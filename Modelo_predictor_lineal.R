library(ggplot2)
library(dplyr)

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
sectional <- na.omit(sectional)
dim(sectional)

# Obtenemos un modelo lineal
attach(sectional)
#rm(Age);rm(CDR);rm(Educ);rm(ID);rm(M.F);rm(SES)
m <- lm(CDR ~ Age + Educ + SES + MMSE + M.F)
summary(m)
# Analizando el summary, podemos observar que el mayor indicador de CRM es el MMSE, con un pvalue
# de practicamente 0. Interesantemente, el segundo predictor que se esperaba fuera más fuerte,
# la edad, sólo tiene un p-value de 0.0833, lo cual hace riesgosa su inclusión en el modelo.
# Todas las demás variables muestran un p-value sumamente elevado, dando a entender que el género
# no influye directamente sobre la demencia (como se había especulado) y que las distinciones
# sociales y económicas no afectan al momento de predecir la prevalencia de la enfermedad.
 
# Modelo lineal incluyendo solamente MMSE y Edad
m2 <- lm(CDR ~ Age + MMSE)
summary(m2)
# El p-value de edad deja algo que desear, pero considerando que el modelo no
# es perfecto se tolera este error por interés de experimentar.

# Gráficas residuales estandarizadas
StanRes1 <- rstandard(m2)
par(mfrow = c(2, 1))
plot(Age, StanRes1, ylab = "Residuales Estandarizados")
plot(MMSE, StanRes1, ylab = "Residuales Estandarizados")
dev.off()
# Se puede observar un patrón ligero en la gráfica de Edades, mientras que en la de MMSE el
# patrón resulta sumamente alto. Esto nos indica que el modelo lineal no es el más indicado
# para este dataset, y que los resultados obtenidos no serán demasiado precisos.

# Finalmente mostramos una gráfica de Y, el precio contra los valores
# ajustados 
plot(m2$fitted.values, CDR, main="Modelo de regresión lineal múltiple",
     sub="2.375087 + 0.002396 * Age - 0.083702 * MMSE",
     xlab = "Valores ajustados de CDR", ylab = "CDR")
abline(lsfit(m2$fitted.values, CDR))
m2$fitted.values
