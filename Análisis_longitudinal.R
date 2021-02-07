# install.packages('tidyverse')
library(ggplot2)

# install.packages('dplyr')
library(dplyr)

# install.packages('gganimate')
library(gganimate)

# Lectura de Datos de los Archivos
cross_sectional <- read.csv('oasis_cross-sectional.csv')
longitudinal <- read.csv('oasis_longitudinal.csv')

## Generación de las Imágenes para Crear el GIF
# Evolución del Alzheimer en Pacientes Sanos
graph.data <- longitudinal %>%
  select(Subject.ID, Group, Visit, M.F, Age, CDR) %>%
  filter(Group == 'Converted') %>%
  mutate(Group = NULL, M.F = ifelse(M.F == 'F', 'Femenino', 'Masculino')) %>%
  ggplot(aes(CDR, Age, colour = Subject.ID)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  facet_wrap(~ M.F) +
  xlim(0, 2) +
  labs(title = 'Evolución del Alzheimer (Pacientes Sanos)', subtitle = 'Número de Visita: {frame_time}', x = 'Indice de Demencia Clínica', y = 'Edad') +
  transition_time(Visit) +
  ease_aes('linear')
animate(graph.data, renderer = gifski_renderer("CDRvsAge-1.gif"))

# Evolución de Alzheimer en Pacientes con Demencia
graph.data <- longitudinal %>%
  filter(CDR > 0) %>%
  select(Subject.ID, Visit, M.F, Age, CDR) %>%
  mutate(M.F = ifelse(M.F == 'F', 'Femenino', 'Masculino')) %>%
  ggplot(aes(CDR, Age, colour = Subject.ID)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  facet_wrap(~ M.F) +
  xlim(0, 2) +
  labs(title = 'Evolución del Alzheimer (Pacientes con Demencia)', subtitle = 'Número de Visita: {frame_time}', x = 'Indice de Demencia Clínica', y = 'Edad') +
  transition_time(Visit) +
  ease_aes('linear')
animate(graph.data, renderer = gifski_renderer("CDRvsAge-2.gif"))

# Análisis Financiero
x <- longitudinal %>%
  select(Subject.ID, Visit, SES, EDUC)
x <- na.omit(x)
x <- x %>%
  group_by(Subject.ID) %>%
  summarise(Visitas = max(Visit), SES, EDUC) %>%
  mutate(Visitas = factor(Visitas))
x <- as.data.frame(unique(x))
x %>%
  ggplot(aes(SES, EDUC, group = Visitas)) +
  geom_point(aes(color = Visitas)) +
  ggtitle('Análisis Financiero', subtitle = 'Número de visitas según el nivel socioeconónmico') +
  xlab('Nivel Socioeconómico') +
  ylab('Años de Estudio')

## Gráficas de Pastel
# Género

