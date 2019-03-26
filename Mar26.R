library(dplyr)
library(ggplot2)
names(anscombe)

anscombe %>% 
  summarise(meanX1 = mean(x1),
            meanY1 = mean(y1),
            sdX1 = sd(x1),
            sdY1 = sd(y1))

cor(anscombe$x1, anscombe$y1)

anscombe %>% 
  summarise(meanX2 = mean(x2),
            meanY2 = mean(y2),
            sdX2 = sd(x2),
            sdY2 = sd(y2))

cor(anscombe$x2, anscombe$y2)

anscombe %>% 
  summarise(meanX3 = mean(x3),
            meanY3 = mean(y3),
            sdX3 = sd(x3),
            sdY3 = sd(y3))

cor(anscombe$x3, anscombe$y3)

anscombe %>% 
  summarise(meanX4 = mean(x4),
            meanY4 = mean(y4),
            sdX4 = sd(x4),
            sdY4 = sd(y4))

cor(anscombe$x4, anscombe$y4)

ggplot(anscombe, aes(x = x1, y = y1)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE) +
  ylim(3, 13) +
  xlim(4, 19)

ggplot(anscombe, aes(x = x2, y = y2)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE) +
  ylim(3, 13) +
  xlim(4, 19)

ggplot(anscombe, aes(x = x3, y = y3)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE) +
  ylim(3, 13) +
  xlim(4, 19)

ggplot(anscombe, aes(x = x4, y = y4)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE) +
  ylim(3, 13) +
  xlim(4, 19)

a <- read.csv('a.csv')

ggplot(data = a, aes(x = X, y = Y)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE) +
  facet_wrap(~Set)
