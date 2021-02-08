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
write.csv(sectional,"sectional_clean.csv", row.names = FALSE)

# Análisis de edad / demencia
sectional_demented <- sectional %>% mutate(Demented = ifelse(CDR > 0, "Demented", "Non demented"))
sectional_demented %>% na.omit(Demented) %>%
  ggplot() + aes(x = Age, fill = Demented) + geom_histogram() +
  ggtitle("Frecuencia de edades. Factor de demencia en barras apiladas.") 
sectional_demented %>% filter(Demented == "Demented") %>% summarise(min(Age))

sectional %>% ggplot() + aes(x = Age, y = CDR, color = M.F) + geom_point()
sectional %>% ggplot() + aes(x = CDR, fill = M.F) + geom_histogram()

sectional_demented %>% ggplot() + aes(x = MMSE, fill = demented) + geom_histogram()
