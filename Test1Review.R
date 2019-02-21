#  Reviewing for Test #1:

#  Review the ideas outlined in the Reading
#   for chapters 1 and 2.

#  For the R part of it, review these ideas:

#  Data Structures:  vectors, data frames are the two
#  we've used so far.  
#  (Others include matrices, arrays, lists)
vector <- c(1, 2, 3)
vectors <- data.frame(vector, vector, vector)
names(vectors) = c("hi", "bye", "why")

View(vectors)

#  Data Types in R:  Logical, Numeric, Character/String

#  Quantitative vs Categorical data:  
#     Quant:   age, earnings
#     Categ:   year in school, response (yes/no)

someBools <- c(TRUE, FALSE, TRUE)
someCats <- c("yes", "no", "maybe")
vectors <- data.frame(vectors, someBools, someCats)


#  R is case sensitive

#  How are missing values represented in R?
NA
#  How do you get out of the + prompt?
# wuuuuuuuuuuuuuuut

#  Functions and arguments (which are which below?):
#      mean(Height)
#      sqrt(25)
#      mean(S$Earnings, na.rm=TRUE)
mtcars
mean(mtcars$mpg)
head(mtcars)
median(mtcars[,3])
summary(mtcars)
mean(mtcars$vs, na.rm = TRUE)


#  Meaning of   <-   in R
#     assignment --  whatever is on the pointy end
#     receives the assignment, e.g.
#      m <- mean(Height)


#  Programs and Packages, 

#  Installing and Loading, 
library(dplyr)

#  A little bit of writing code....  Here's some practice:

#  Enter these vectors in R:

#  Animal:  cat, dog, pig, opossum, horse, human
#  Sleep:  12.5, 10.1, 9.1, 18.0,  2.9, 8
#  REM:  3.2, 2.9, NA, 4.9, 0.6, 1.9   (don't put the NA in quotes)
#  Brain:  .026, .07, .18,.006, .655, 1.32
#  Body:  3.3, 14, 86.2, 1.7, 521, 62
Animal <-  c("cat","dog", "pig")

#  Have R calculate the mean Body size 

#  Have R calculate the mean REM sleep time

#  Do a summary of the Body vector

#  Create new vectors:  LBrain is the log of Brain
#   and    LBody is the log of Body
#  Note:  You may use the function log() 
#  OR the functionlog10()


#  Try some plots:   Brain by Body,  LBrain by LBody

#  Also:  Sleep by Body, then Sleep by LBody

#  Put the vectors in a data frame:

#  Use View() to make sure it looks correct.


#  Remove the vectors from your environment, using rm()


#  Do summary() on the whole data frame


#  Now, redo the plots using plot and an$


