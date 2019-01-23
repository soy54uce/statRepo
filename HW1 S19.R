#
#   HW#1
#   Your Name Here: Ben Beaudin
#
#   Part 1

#   Enter the vector (variable) Height 
#   with the values 62, 65, 69, 72, 70, 69
Height <- c(62, 65, 69, 72, 70, 69)

#   Enter the vector Weight 
#   with the values 110, 140, 145, 200, 165, 155, 
Weight <- c(110, 140, 145, 200, 165, 155)
#   Enter the vector Gender 
#   with the values F, F, O, M, M, M
Gender <- c('F', 'F', 'O', 'M', 'M', 'M')
#   Use a shortcut to create a vector 
#   with the integers from 1 to 6.
numbers <- 1:6
#   Calculate the BMI, using the equation  
#      703.07 x W / (H squared)    
#    (make sure it works in R)
BMI <- (703.7 * Weight) / (Height**2)
#   Create a scatterplot of Weight by Height 
#   (i.e., Height on the x axis)
plot(Height, Weight)
#   Describe briefly the relationship that you see, 
#   including it here as a comment.
# it seems that generally a greater height will mean a greater weight

#   Part 2

#   Download the data file surveyA_S19.csv to your desktop, 
#   put it in your class folder, 
#   and read it using the function read.csv.   
#   Be sure to set your working directory so that 
#   you can just put the file name of the data in
#   the quotes:
S <- read.csv('SurveyA_S19.csv')

#   Run the following:
View(S)
dim(S)
names(S)


#   Now, use one R function to summarize all of the variables:
summary(S)
#   Find the mean and median of the variable, Earnings, 
#   using the functions mean() and median(), and 
#   making sure the results match the summary above.
mean(S$Earnings, na.rm = TRUE)
median(S$Earnings, na.rm = TRUE)
#   Have R make a histogram of Earnings
hist(S$Earnings)
#   Have R make a histogram of Height
hist(S$Height)
#   Have R do a barplot of Triangle:   
#    Use  barplot(table(vector))
triangle <- table(S$Triangle)
barplot(triangle,names.arg=c("NA", "Sleep + Good Grades", "Sleep + Social Life", "Social Life+Good Grades"))
#   Finally, plot Weight by Height
#  (Make sure you get the height and 
#  weight data in the data frame, S.)
plot(S$Height, S$Weight)
#   Describe briefly the relationship that you see.  
#   Is it similar to the relationship you observed above?
# similarly to above, the weight generally increases with height, but there are more outliers
# with this larger data set