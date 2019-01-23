#  This is our second script 17 Jan 
#  I'm including some lines from our last script...

#  Storing values in answer and answer2
answer <- 3^3 
answer2 <- sqrt(49) -3

#   Data on Height for 5 people:
#   Create a Vector of values

#  Height is numeric data
Height <- c(68, 62, 70, 74, 65)
Height

#  Gender is character data
Gender <- c('F', 'F','M','M','F')

#  Passing is logical data
Passing <- c(TRUE, TRUE, TRUE, FALSE, TRUE)

# Some shortcuts for creating vectors
oneToFive <- 1:5
# For a sequence of 5 to 100 in steps of 5
seq2 <- seq(5, 100, 5)
# For a vector of 1 2 1 2 1 2 1 2 . . .
repeatSeq <- rep(1:2, 10)
# Create random data:
runif(20)
normdata <- rnorm(10000000)
hist(normdata)

# A few more functions:
sqrt(16)
num <- 16.23453
round(num)
round(num, 2)
log10(1000000)
log(1000000)

# Enter another student vector
# The NA is a missing value
Weight <- c(160, 110, NA, 200, 140)

# Mean of height, and mean of weight
mean(Height)
mean(Weight)
# or ignore missing values
mean(Weight, na.rm = TRUE)

# DATA FRAMES
# rows that are observations
# columns that are variable
# Ways to create data frames:
# 1. Stick vectors together
students <- data.frame(Gender, Height, Weight, Passing)
View(students)

# could now remove the vectors themselves
rm(Gender, Height, Weight, Passing)
mean(students$Height)
mean(students$Weight, na.rm = TRUE)

# 2. There are useful data frames already stored in R.
View(mtcars)
View(iris)

# 3. Read data frames from a file -- most often a csv file
# look at your working directory

grocFile <- read.csv("Groceries.csv")

# work with directories
getwd()
setwd("/Users/ben/statRepo")
dir()

