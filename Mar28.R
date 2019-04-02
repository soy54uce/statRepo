library(dplyr)
library(ggplot2)

t <- read.csv('traffic.csv')

ggplot(t, aes(x = Flow, fill = Lane)) +
    geom_density(alpha = 0.4)

ggplot(t, aes(x = Sample, y = Flow, color = Lane)) +
  geom_line()

ggplot(t, aes(x = Sample, y = Occup, color = Lane)) +
  geom_line()

ggplot(t, aes(x = Occup, y = Flow, color = Lane)) +
  geom_point()

t %>% group_by(Lane) %>% 
  summarise(avFlow = mean(Flow),
            medFlow = median(Flow),
            sdFlow = sd(Flow),
            avOcc = mean(Occup),
            medOcc = median(Occup),
            sdOcc = sd(Occup))
