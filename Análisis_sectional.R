library(ggplot2)
library(dplyr)

setwd("C:/Users/valen/Documents/Bedu/Mod2/Programacion-con-R-Santander-master/Programacion-con-R-Santander-master/Proyecto")
sectional <- read.csv("oasis_cross-sectional.csv")
summary(sectional)
sectional %>% ggplot() + aes(x = Age, y = CDR, color = M.F) + geom_point()
sectional %>% ggplot() + aes(x = CDR, fill = M.F) + geom_histogram()
sectional_demented <- sectional %>% mutate(demented = ifelse(CDR > 0, "Demented", "Non demented"))
sectional_demented %>% na.omit(demented) %>%
  ggplot() + aes(x = Age, fill = demented) + geom_histogram() + facet_wrap("M.F")
sectional_demented %>% ggplot() + aes(x = MMSE, fill = demented) + geom_histogram()
