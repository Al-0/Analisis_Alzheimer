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

# Se filtran las personas menores de 62 años
sectional_demented <- sectional_demented %>% filter(Age >= 62)

# Análisis de distribución de demencia
sectional_demented %>% ggplot() + aes(x = Demented) + 
  geom_histogram(stat="count", fill = "blue", color = "black") +
  ggtitle("Frecuencia del estado de demencia.") +
  xlab("Estado de demencia") +
  theme_classic()

# Análisis de género y demencia
only_demented <- sectional_demented %>% filter(Demented == "Demented");head(only_demented)
table(only_demented$M.F) / nrow(only_demented)
# F: 0.6, M: 0.4
as.data.frame(table(only_demented$M.F) / nrow(only_demented)) %>%
  mutate(Var1 = ifelse(Var1 == 'F', 'Femenino', 'Masculino')) %>%
  rename(Genero = Var1) %>%
  ggplot(aes(x = '', y = Freq, fill = Genero)) +
  geom_bar(stat = 'identity', color = 'white') +
  coord_polar(theta = 'y') +
  scale_fill_manual(values = c('hotpink', 'blue')) +
  theme_void() +
  labs(title = 'Enfermedad de Alzheimer', subtitle = 'Distribución del Género')

# Análisis de relación entre MMSE y CDR
sectional %>% ggplot() + aes(x = CDR, y = MMSE) + geom_bin2d() +
  ggtitle("Análisis de relación CDR - MMSE")
  
sectional %>% ggplot() + aes(x = Age, y = CDR, color = M.F) + geom_point()
sectional %>% ggplot() + aes(x = CDR, fill = M.F) + geom_histogram()

sectional_demented %>% ggplot() + aes(x = MMSE, fill = demented) + geom_histogram()
