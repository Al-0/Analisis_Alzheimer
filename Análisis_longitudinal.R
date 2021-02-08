# install.packages('tidyverse')
library(ggplot2)

# install.packages('dplyr')
library(dplyr)

# install.packages('gganimate')
library(gganimate)

# Lectura de Datos de los Archivos
cross_sectional <- read.csv('oasis_cross-sectional.csv')
longitudinal <- read.csv('oasis_longitudinal.csv')

# Limpieza de datos
longitudinal <- longitudinal %>%
  mutate(M.F = ifelse(M.F == 'F', 'Femenino', 'Masculino')) %>%
  select(- MR.Delay, - Hand, - eTIV, - nWBV, - ASF)
write.csv(longitudinal,"longitudinal_clean.csv", row.names = FALSE)

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
  labs(title = 'Evolución de la Enfermedad de Alzheimer (Pacientes Sanos)', subtitle = 'Número de Visita: {frame_time}', x = 'Indice de Demencia Clínica', y = 'Edad') +
  transition_time(Visit) +
  ease_aes('linear')
animate(graph.data, renderer = gifski_renderer('CDRvsAge-1.gif'))

# Evolución de Alzheimer en Pacientes con Demencia
graph.data <- longitudinal %>%
  filter(Group != 'Nondemented') %>%
  select(Subject.ID, Visit, M.F, Age, CDR) %>%
  mutate(M.F = ifelse(M.F == 'F', 'Femenino', 'Masculino')) %>%
  ggplot(aes(CDR, Age, colour = Subject.ID)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  facet_wrap(~ M.F) +
  xlim(0, 2) +
  labs(title = 'Evolución de la Enfermedad de Alzheimer (Pacientes con Demencia)', subtitle = 'Número de Visita: {frame_time}', x = 'Indice de Demencia Clínica', y = 'Edad') +
  transition_time(Visit) +
  ease_aes('linear')
animate(graph.data, renderer = gifski_renderer('CDRvsAge-2.gif'))

# Análisis Financiero
longitudinal %>%
  select(Subject.ID, Visit, SES, EDUC) %>%
  na.omit() %>%
  group_by(Subject.ID) %>%
  summarise(Visitas = max(Visit), SES, EDUC) %>%
  mutate(Visitas = factor(Visitas)) %>%
  unique() %>%
  as.data.frame() %>%
  ggplot(aes(SES, EDUC, group = Visitas)) +
  geom_point(aes(color = Visitas)) +
  ggtitle('Análisis Financiero', subtitle = 'Número de Visitas según el Nivel Socioeconómico') +
  xlab('Nivel Socioeconómico') +
  ylab('Años de Estudio')

## Gráficas de Pastel

# Género
as.data.frame(table(longitudinal$M.F) / nrow(longitudinal)) %>%
  mutate(Var1 = ifelse(Var1 == 'F', 'Femenino', 'Masculino')) %>%
  rename(Genero = Var1) %>%
  ggplot(aes(x = '', y = Freq, fill = Genero)) +
  geom_bar(stat = 'identity', color = 'white') +
  coord_polar(theta = 'y') +
  scale_fill_manual(values = c('hotpink', 'blue')) +
  theme_void() +
  labs(title = 'Enfermedad de Alzheimer', subtitle = 'Distribución del Género')

# Número de Visitas
as.data.frame(table(longitudinal$Age, longitudinal$CDR) / nrow(longitudinal)) %>%
  rename(Age = Var1, CDR = Var2, Probability = Freq) %>%
  ggplot(aes(x = CDR, y = Age, fill = Probability)) +
  geom_tile() +
  scale_fill_gradient(name = 'Probabilidad', low = 'white', high = 'blueviolet') +
  ggtitle('Enfermedad de Alzheimer', subtitle = 'Probabilidad Conjunta') +
  xlab('Indice de Demencia Clínica') +
  ylab('Edad')

# Gráfico Animado MMSE vs CDR
graph.data <- longitudinal %>%
  filter(Subject.ID == 'OAS2_0087') %>%
  ggplot(aes(x = Visit, y = MMSE, group = Subject.ID, color = Subject.ID)) +
  geom_line() +
  geom_point(aes(shape = factor(CDR))) +
  xlim(min(longitudinal$Visit), max(longitudinal$Visit)) +
  ylim(0, 30) +
  ggtitle('Enfermedad de Alzheimer', subtitle = 'Deterioro del Estado Mental') +
  ylab('Mini Examen del Estado Mental') +
  xlab('Número de Visita') +
  transition_reveal(Visit)
animate(graph.data, renderer = gifski_renderer('MMSEvsVisit.gif'))

# Gráfico Completo MMSE vs CDR
longitudinal %>%
  filter(Subject.ID == 'OAS2_0087') %>%
  ggplot(aes(x = Visit, y = MMSE, group = Subject.ID, color = Subject.ID)) +
  geom_line() +
  geom_point(aes(shape = factor(CDR))) +
  xlim(min(longitudinal$Visit), max(longitudinal$Visit)) +
  ylim(0, 30) +
  facet_wrap(~ Group) +
  ggtitle('Enfermedad de Alzheimer', subtitle = 'Deterioro del Estado Mental') +
  ylab('Mini Examen del Estado Mental') +
  xlab('Número de Visita')
