#  Reviewing for Test #1:

#  Review the ideas outlined in the Reading
#   for chapters 1 and 2.

#  For the R part of it, review these ideas:

#  Data Structures:  vectors, data frames are the two
#  we've used so far.  
#  (Others include matrices, arrays, lists)

#  Data Types in R:  Logical, Numeric, Character/String

#  Quantitative vs Categorical data:  
#     Quant:   age, earnings
#     Categ:   year in school, response (yes/no)

#  R is case sensitive

#  How are missing values represented in R?

#  How do you get out of the + prompt?

#  Functions and arguments (which are which below?):
#      mean(Height)
#      sqrt(25)
#      mean(S$Earnings, na.rm=TRUE)
#  na.rm = TRUE is a "named argument"

#  Meaning of   <-   in R
#     assignment --  whatever is on the pointy end
#     receives the assignment, e.g.
#      m <- mean(Height)


#  Programs and Packages, 

#  Installing and Loading, 

#  A little bit of writing code....  Here's some practice:

#  Enter these vectors in R:
Animal <- c("cat", "dog", "pig", "opossum", "horse", "human")
Sleep <- c(12.5, 10.1, 9.1, 18.0, 2.9, 8)
REM <- c(3.2, 2.9, NA, 4.9, 0.6, 1.9)
Brain <- c(.026, .07, .18, .006, .655, 1.32)
Body <- c(3.3, 14, 86.2, 1.7, 521, 62)

#  Animal:  cat, dog, pig, opossum, horse, human
#  Sleep:  12.5, 10.1, 9.1, 18.0,  2.9, 8
#  REM:  3.2, 2.9, NA, 4.9, 0.6, 1.9   (don't put the NA in quotes)
#  Brain:  .026, .07, .18,.006, .655, 1.32
#  Body:  3.3, 14, 86.2, 1.7, 521, 62


#  Have R calculate the mean Body size 
mean(Body)
#  Have R calculate the mean REM sleep time
mean(REM, na.rm = TRUE)
#  Do a summary of the Body vector
summary(Body)
#  Create new vectors:  LBrain is the log of Brain
#   and    LBody is the log of Body
#  Note:  You may use the function log() 
#  OR the functionlog10()
LBrain <- log(Brain)
LBody <- log(Body)

#  Try some plots:   Brain by Body,  LBrain by LBody
plot(x = Body, y = Brain)
plot(x = LBody, y = LBrain)
#  Also:  Sleep by Body, then Sleep by LBody
plot(Body, Sleep)
plot(LBody, Sleep)
#  Put the vectors in a data frame:
myFrame <- data.frame(Animal, Body, Brain, REM, Sleep, LBody, LBrain)
#  Use View() to make sure it looks correct.
View(myFrame)

#  Remove the vectors from your environment, using rm()
rm(Animal, Body, Brain, REM, Sleep, LBody, LBrain)

#  Do summary() on the whole data frame
summary(myFrame)

#  Now, redo the plots using plot and an$
plot(myFrame$Body, myFrame$Brain)
plot(myFrame$Body, myFrame$Sleep)

