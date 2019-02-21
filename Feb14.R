# OSWEGO data

library(dplyr)
library(ggplot2)

O <- read.csv('Oswego(1).csv', na.strings = '?')

glimpse(O)
names(O)
head(O)

ggplot(O, aes(x = Age, fill = Sick)) +
  geom_density(alpha = 0.5)

ggplot(O, aes(x = Ham, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = Spinach, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = Potatoes, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = CabSalad, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = Jello, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = Rolls, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = Bread, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = Milk, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = Coffee, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = Water, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = Cakes, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = VanIC, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = ChocIC, fill = Sick)) +
  geom_bar(position = 'fill')
ggplot(O, aes(x = FruitSalad, fill = Sick)) +
  geom_bar(position = 'fill')

ggplot(O, aes(x = Age, fill = VanIC)) +
  geom_density(alpha = 0.5)

ggplot(O, aes(x = Age, fill = ChocIC)) +
  geom_density(alpha = 0.5)
