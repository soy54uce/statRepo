# The function ifelse()
library(ggplot2)
age <- 16:24
age

ifelse(age > 19, "OLD", "YOUNG")

ageCat <- ifelse(age > 19, "OLD", "YOUNG")

c <- read.csv('07c - Crickets.csv')

ggplot(c, aes(x = TempF, y = Chirps)) +
  geom_point() +
  geom_smooth()

ggplot(c, aes(x = TempF, y = Chirps)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE)

# ~ means 'explained by' in R
CricketReg <- lm(c$TempF ~ c$Chirps)

CricketReg
class(CricketReg)
mode(CricketReg)

# correlation coefficient
cor(c$TempF, c$Chirps)

mtcars

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = 'lm')

CarMpgReg <- lm(mtcars$mpg ~ mtcars$wt)
cor(mtcars$wt, mtcars$mpg)
cor(mtcars$mpg, mtcars$wt)
CarMpgReg
