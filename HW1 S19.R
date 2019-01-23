#
#   HW#1
#   Your Name Here:
#
#   Part 1

#   Enter the vector (variable) Height 
#   with the values 62, 65, 69, 72, 70, 69
Height <- c(62, 65, 69, 72, 70, 69)

#   Enter the vector Weight 
#   with the values 110, 140, 145, 200, 165, 155, 

#   Enter the vector Gender 
#   with the values F, F, O, M, M, M

#   Use a shortcut to create a vector 
#   with the integers from 1 to 6.

#   Calculate the BMI, using the equation  
#      703.07 x W / (H squared)    
#    (make sure it works in R)

#   Create a scatterplot of Weight by Height 
#   (i.e., Height on the x axis)

#   Describe briefly the relationship that you see, 
#   including it here as a comment.


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

#   Find the mean and median of the variable, Earnings, 
#   using the functions mean() and median(), and 
#   making sure the results match the summary above.

#   Have R make a histogram of Earnings

#   Have R make a histogram of Height

#   Have R do a barplot of Triangle:   
#    Use  barplot(table(vector))

#   Finally, plot Weight by Height
#  (Make sure you get the height and 
#  weight data in the data frame, S.)

#   Describe briefly the relationship that you see.  
#   Is it similar to the relationship you observed above?



