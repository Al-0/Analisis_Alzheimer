# Cargamos el paquete `e1071` para ajustar máquinas de vectores de soporte
library(e1071) 
library(dplyr)
library(ggplot2)

# Se declara el directorio y se lee el csv
setwd("~/GitHub/Analisis_Alzheimer")
sectional <- read.csv("oasis_cross-sectional.csv")
summary(sectional)

# Se limpian los datos
sectional <- sectional %>%
  select(- Delay, - Hand, - eTIV, - nWBV, - ASF)
rows <- dim(sectional)[1]
tail(sectional, 21)
sectional <- sectional[1:(rows-20),];tail(sectional)

# Análisis de edad / demencia
sectional_demented <- sectional %>% mutate(Demented = ifelse(CDR > 0, "Demented", "Non demented")) %>% na.omit(sectional_demented)
dim(sectional_demented)
head(sectional_demented)
sectional_demented %>% ggplot() + aes(x = Age, y = MMSE, color = Demented) +
  geom_point() + ggtitle("División de clases")
# Del gráfico anterior se puede apreciar claramente una división o frontera
# entre los paciente con diagnóstico de demencia y aquellos que no tienen.
# Esto es prometedor para generar un modelo SVM.

# Ajustamos el clasificador de vectores de soporte con la función `svm`
sectional_demented <- sectional_demented %>% mutate(num_var = ifelse(Demented == 'Demented', 1, -1));
dat2 <- sectional_demented %>% select(Age, MMSE, as.factor(num_var)) %>% rename(Demented = num_var)
dat2$Demented <- as.factor(dat2$Demented)
head(dat2)
class(dat2$Demented)
svmfit <- svm(Demented~MMSE + Age, data = dat2, kernel = "linear",
              cost = 10, scale = FALSE)
summary(svmfit)
svmfit$index
plot(svmfit, dat2, ylim=c(14,31))
# Como podemos apreciar, este modelo simple sólo puede dividir nuestro dataset con
# una simple linea. Aun con el mejor esfuerzo no es muy bueno clasificando a los pacientes
# (aun así, mejor que el modelo lineal). Es necesario seguir trabajando para obtener un mejor
# modelo de predicción.


# El siguiente comando indica que queremos comparar MVS con un kernel lineal, usando un rago de valores del parámetro `cost`
set.seed(524)
tune.out <- tune(svm, Demented~MMSE + Age, data = dat2, kernel = "linear", 
                 ranges = list(cost = c(0.001, 0.01, 0.1, 1, 5, 10, 100)))
summary(tune.out)
# Elegimos el mejor modelo ajustado
bestmod <- tune.out$best.model
bestmod
summary(bestmod)
###
plot(bestmod,dat2,ylim=c(14,31))
# Como podemos observar, el modelo en su estado actual no puede mejorar demasiado con un kernel lineal

# Ahora consideramos un conjunto de datos de prueba
set.seed(1536)
dim(dat2)
train <- sample(216,100)
testdat2 <- dat2[train,];tail(testdat2)
ypred <- predict(bestmod, testdat2)
table(predict = ypred, truth = testdat2$Demented) / 100
# Incluso este modelo sencillo tiene una precisión del ~85% para predecir la demencia en los pacientes
###

# Generamos índices para el conjunto de entrenamiento
set.seed(1536)
train <- sample(216, 100)
tail(as.data.frame(train))
# Ajustamos una máquina de vectores de soporte con un kernel radial y valores de los parámetros `gamma = 1` y `cost = 1`
svmfit <- svm(Demented~MMSE + Age, data = dat2[train, ], 
              kernel = "radial", gamma = 1, cost = 1)
plot(svmfit, dat2[train, ])
summary(svmfit)
# El modelo obtenido al cambiar la función de kernel a 'radial' es increiblemente ajustado a nuestro
# modelo. Esta gráfica es increíble para predecir la variable de interés, pero aun podemos intentar
# mejorarla mediante la manipulación de las vartiables.

# Ajustamos una máquina de vectores de soporte con un kernel radial y valores de los parámetros `gamma = 1` y `cost = 1e5`
svmfit <- svm(Demented~MMSE + Age, data = dat2[train, ], 
              kernel = "radial", gamma = 1, cost = 1e5)
plot(svmfit, dat2[train, ])
# El modelo queda aun mejor! Quiza estamos acercandonos al punto de 'overfit' con el dataset
# que utilizamos.

###

# Ajustamos máquinas de vectores de soporte con un kernel radial para diferentes valores de los parámetros `cost` y `gamma`

set.seed(1980)
train <- sample(216, 100)
tune.out <- tune(svm, Demented~MMSE + Age, data = dat2[train, ], kernel = "radial", 
                 ranges = list(cost = c(0.1, 1, 10, 100, 1000), 
                               gamma = c(0.5, 1, 2, 3, 4)))
summary(tune.out)
# Realizamos clasificación con el mejor modelo ajustado y obtenemos la matriz de confusión.
table(true = dat2[-train, "Demented"], 
      pred = predict(tune.out$best.model, newdata = dat2[-train,]))
plot(tune.out$best.model, dat2[train, ])

