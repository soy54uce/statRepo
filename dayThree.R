five<- 5
five < -5
pi
pi > 3
pi < 4

Weight <- c(120, 100, 150, 180)
mean(Weight)

logi <- c(TRUE, TRUE, TRUE, FALSE)
mean(logi)

# READING in data....
# A. based on working directory
survey <- read.csv("SurveyA_S19.csv")
# B. more repeatable
fullPathSurvey <- read.csv("/Users/ben/statRepo/SurveyA_S19.csv")
# C. gives prompt to find file
okWay <- read.csv(file.choose())

# what if i wanted to print milk vector
G <- read.csv("/Users/ben/statRepo/Groceries.csv")
G$Milk
# another way - leave row number blank for whole column
G[, 7] # all rows of column 7
G[1, ] # all columns of row 1
G[, 5:7] # columns 5 through 7
G[, c(1, 5, 7)]

# indexing is really useful, but we won't use it much
# we'll mostly use dplyr

View(mtcars)
class(mtcars)
class(Weight)
class(five)
View(WorldPhones)
class(WorldPhones)

# Kinds of data storage objects
# Vectors, Data Frames, Matrices and Arrays(must be all the same data type)
# Also Lists, we'll use a bit

# Install more packages
# only need to install it once, so we'll point and click
# tidyverse (includes dplyr, ggplot2, knitr, lubridate, nycflights13)
# babynames

# Each time you return to an R session, you need to LOAD necessary packages
library(dplyr)
library(babynames)
library(ggplot2)
library(nycflights13)

dim(babynames)
names(babynames)
head(babynames)

# Create a new data frame that only includes lines for name Benjamin
# in dplyr:
# %>% use cmd-shift-m
Benjamin <- babynames %>% 
  filter(name == "Benjamin") 

Ben <- babynames %>% 
  filter(name == "Ben")

ggplot(data = Benjamin, mapping = aes(x = year, y = n, color = sex)) +
  geom_line() +
  geom_vline(xintercept = 1997)
ggplot(data = Ben, mapping = aes(x = year, y = n, color = sex)) +
  geom_line()+
  geom_vline(xintercept = 1997)
