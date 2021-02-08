# install.packages("tidyverse")
library(ggplot2)

# install.packages("dplyr")
library(dplyr)

# install.packages("gganimate")
library(gganimate)

# Lectura y Limpieza de los Datos
cross_sectional <- read.csv("oasis_cross-sectional.csv") %>%
  mutate(M.F = ifelse(M.F == 'F', 'Femenino', 'Masculino')) %>%
  select(- Delay, - Hand, - eTIV, - nWBV, - ASF)

longitudinal <- read.csv("oasis_longitudinal.csv") %>%
  mutate(M.F = ifelse(M.F == 'F', 'Femenino', 'Masculino')) %>%
  select(- MR.Delay, - Hand, - eTIV, - nWBV, - ASF)

# Limpieza de datos
longitudinal <- longitudinal %>%
  mutate(M.F = ifelse(M.F == 'F', 'Femenino', 'Masculino')) %>%
  select(- MR.Delay, - Hand, - eTIV, - nWBV, - ASF)
write.csv(longitudinal,"longitudinal_clean.csv", row.names = FALSE)

## Generación de las Imágenes para Crear el GIF

# Evolución del Alzheimer en Pacientes Sanos
graph.data <- longitudinal %>%
  select(Subject.ID, Group, Visit, M.F, Age, CDR) %>%
  filter(Group != "Demented") %>%
  mutate(Group = NULL) %>%
  ggplot(aes(CDR, Age, colour = Subject.ID)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  facet_wrap(~ M.F) +
  xlim(0, 2) +
  labs(title = 'Evolución de la Enfermedad de Alzheimer (Pacientes Sanos)', subtitle = 'Número de Visita: {frame_time}', x = 'Indice de Demencia Clínica', y = 'Edad') +
  transition_time(Visit) +
  ease_aes("linear")
animate(graph.data, renderer = gifski_renderer("./shinyapp/Alzheimer/www/longitudinal/long_converted.gif"))

# Obtención del % de la población que representa el grupo de pacientes que desarrollaron Alzheimer
n_converted <- longitudinal %>%
  filter(Group == "Converted", Visit == 1) %>%
  nrow()

n_nondemented <- longitudinal %>%
  filter(Group == "Nondemented", Visit == 1) %>%
  nrow()

round(n_converted / (n_converted + n_nondemented) * 100, 3)

# Obtención del % de la población afectada de cada género
n_converted_F <- longitudinal %>%
  filter(Group == "Converted", M.F == "Femenino", Visit == 1) %>%
  nrow()

n_converted_M <- longitudinal %>%
  filter(Group == "Converted", M.F == "Masculino", Visit == 1) %>%
  nrow()

round(((n_converted_F / 14) * n_converted / (n_converted + n_nondemented)) * 100, 3) # Género Femenino

round(((n_converted_M / 14) * n_converted / (n_converted + n_nondemented)) * 100, 3) # Género Masculino

# Evolución de Alzheimer en Pacientes con Demencia
graph.data <- longitudinal %>%
  filter(Group != "Nondemented") %>%
  select(Subject.ID, Visit, M.F, Age, CDR) %>%
  ggplot(aes(CDR, Age, colour = Subject.ID)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  facet_wrap(~ M.F) +
  xlim(0, 2) +
  labs(subtitle = "Número de Visita: {frame_time}", x = "Indice de Demencia Clínica", y = "Edad") +
  transition_time(Visit) +
  ease_aes("linear")
animate(graph.data, renderer = gifski_renderer("./shinyapp/Alzheimer/www/longitudinal/long_demented.gif"))

# Obtención del % de la población que desarrollo un cuadro clínico severo de demencia
subjects <- longitudinal %>%
  filter(CDR == 2) %>%
  select(Subject.ID)

n_demented_severe <- longitudinal %>%
  filter(Subject.ID %in% subjects$Subject.ID) %>%
  select(Subject.ID, M.F, Visit, CDR) %>%
  group_by(Subject.ID) %>%
  mutate(Min_CDR = min(CDR), Max_CDR = max(CDR)) %>%
  as.data.frame() %>%
  filter(Visit == 1) %>%
  select(Subject.ID, M.F, Min_CDR, Max_CDR)

n_demented = longitudinal %>% 
  filter(Group != "Nondemented", Visit == 1) %>%
  nrow()

round(nrow(n_demented_severe) / n_demented * 100, 3)

# Obtención del % de la población de cada género que desarrolla un cuadro clínico severo de demencia
round(((table(n_demented_severe$M.F) / nrow(n_demented_severe)) * (nrow(n_demented_severe) / n_demented)) * 100, 3)

# Obtención del % de la población que no sigue desarrollando Alzheimer
n_demented_neutral <- longitudinal %>%
  group_by(Subject.ID) %>%
  filter(min(CDR) == max(CDR)) %>%
  as.data.frame() %>%
  filter(CDR > 0, Visit == 1)

round((nrow(n_demented_neutral) / n_demented) * 100, 3) 

# Obtención del % de la población por género que no sigue desarrollando Alzheimer
round(((table(n_demented_neutral$M.F) / nrow(n_demented_neutral)) * (nrow(n_demented_neutral) / n_demented)) * 100, 3)

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
  facet_wrap(~ Visitas)
  # ggtitle(subtitle = "Número de Visitas según el Nivel Socioeconómico") +
  xlab("Nivel Socioeconómico") +
  ylab("Años de Estudio")

## Gráficas de Pastel

# Género
as.data.frame(table(longitudinal$M.F) / nrow(longitudinal)) %>%
  rename(Genero = Var1) %>%
  ggplot(aes(x = "", y = Freq, fill = Genero)) +
  geom_bar(stat = "identity", color = "white") +
  coord_polar(theta = "y") +
  scale_fill_manual(values = c("hotpink", "blue")) +
  theme_void() +
  labs(subtitle = "Distribución del Género")

# Número de Visitas
as.data.frame(table(longitudinal$Age, longitudinal$CDR) / nrow(longitudinal)) %>%
  rename(Age = Var1, CDR = Var2, Probability = Freq) %>%
  ggplot(aes(x = CDR, y = Age, fill = Probability)) +
  geom_tile() +
  scale_fill_gradient(name = "Probabilidad", low = "white", high = "blueviolet") +
  ggtitle(subtitle = "Probabilidad Conjunta") +
  xlab("Indice de Demencia Clínica") +
  ylab("Edad")

# Gráfico Animado MMSE vs CDR
graph.data <- longitudinal %>%
  filter(Subject.ID == "OAS2_0087") %>%
  ggplot(aes(x = Visit, y = MMSE, group = Subject.ID, color = Subject.ID)) +
  geom_line() +
  geom_point(aes(shape = factor(CDR))) +
  xlim(min(longitudinal$Visit), max(longitudinal$Visit)) +
  ylim(0, 30) +
  ggtitle(subtitle = "Deterioro del Estado Mental") +
  ylab("Mini Examen del Estado Mental") +
  xlab("Número de Visita") +
  transition_reveal(Visit)
animate(graph.data, renderer = gifski_renderer("MMSEvsVisit.gif"))

# Gráfico Completo MMSE vs CDR
longitudinal %>%
  filter(Subject.ID == "OAS2_0087") %>%
  ggplot(aes(x = Visit, y = MMSE, group = Subject.ID, color = Subject.ID)) +
  geom_line() +
  geom_point(aes(shape = factor(CDR))) +
  xlim(min(longitudinal$Visit), max(longitudinal$Visit)) +
  ylim(0, 30) +
  facet_wrap(~ Group) +
  ggtitle("Enfermedad de Alzheimer", subtitle = "Deterioro del Estado Mental") +
  ylab("Mini Examen del Estado Mental") +
  xlab("Número de Visita")

graph.data <- longitudinal %>%
  filter(Group == "Converted") %>%
  ggplot(aes(x = Visit, y = CDR, group = Subject.ID, color = Subject.ID)) +
  geom_line() +
  geom_point() +
  xlim(min(longitudinal$Visit), max(longitudinal$Visit)) +
  ylim(min(longitudinal$CDR), max(longitudinal$CDR)) +
  facet_wrap(~ M.F) +
  ggtitle("Enfermedad de Alzheimer", subtitle = "Deterioro del Estado Mental") +
  ylab("Indice de Demencia Clínica") +
  xlab("Número de Visita") +
  transition_reveal(Visit)
animate(graph.data, renderer = gifski_renderer("CDRvsVisit.gif"))
