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
# Al asilar el modelo obtenemos un p-value más aceptable de la edad, con lo cuál podemos estar
# satisfechos en incluirla en nuestro modelo predictor.