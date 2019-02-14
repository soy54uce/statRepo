#  Homework 2

#  Load the packages:  ggplot2, dplyr, babynames
#  Include loading code here:
library(ggplot2)
library(dplyr)
View(babynames)

# Question 1

#  a.  Using the babynames data frame, create a new 
#  data frame with only your name* in it.
#  (* You may choose a different name, if you prefer, but not Sheila!)
myName <- babynames %>% 
  filter(name == 'Ben')

#  b. Then graph it using ggplot, as we did in class.  Include a 
#  vertical line at the year of your birth:
ggplot(data = myName, mapping = aes(x = year, y = n)) +
  geom_point() +
  geom_vline(xintercept = 1997)

#  c.  Describe the graph in a couple of sentences:  
#   When does it rise and fall?  Try to explain the trend,
#   e.g., the result of immigration, the phenomenon of old 
#   names becoming popular again, babies named after a 
#   famous person, etc.  
# The graph peaks highest in the 1920s and 1960s. However,
# throughout those times, there were still years with very little
# Ben frequency. I imagine the roaring 20s may have led to a lot 
# more unique names, and that may have caused the Ben frequency reduction.
# 


#  Question 2

#  Put the satdata.csv file in your course folder,
#  and make sure your working directory is pointing
#  to that folder.
#  Read in the data set:  satdata.csv, using this method:

sat <- read.csv('satdata.csv')

#  a. Do dim(),names(), summary(), and View()
dim(sat)
names(sat)
summary(sat) 
View(sat)

#  Here is a description of the variables 
#  in sat:

# State -- Name of state 
# Region -- part of US that state is in, using Census categories
# Expenditure -- Current expenditure per pupil in average daily attendance in public elementary and secondary schools, 1994-95 (in thousands of dollars)
# PT.ratio -- Average pupil/teacher ratio in public elementary and secondary schools, Fall 1994
# AveSalary -- Estimated average annual salary of teachers in public elementary and secondary schools, 1994-95 (in thousands of dollars)
# PercTaking -- Percentage of all eligible students taking the SAT, 1994-95
# SATV -- Average verbal SAT score, 1994-95
# SATM -- Average math SAT score, 1994-95
# SATTot -- Average total score on the SAT, 1994-95

#  b.  We will focus on the SATTot variable.
#  Using ggplot, make a histogram of it.
#  Make it look nice by filling bars with
#  a light color (e.g., yellow), and 
#  outlining them with a dark color (e.g., blue)
ggplot(data = sat, mapping = aes(x = SATTot)) +
  geom_histogram(fill = 'yellow', color = 'black', bins = 50)
#  c.  To see if scores vary across regions of the 
#  US, do a boxplot of SATTot by Region.  
#  (To make it look good, fill the boxplots using
#  the region variable)
ggplot(data = sat, mapping = aes(y = SATTot, x = Region, fill = Region)) +
  geom_boxplot()
#  Describe what you see.  Which region has 
#  higher scores?  lower scores?  

#  d.  Why do the regions differ so much in scores?
#  (And what is wrong with the Northeast? :-/ )
#  To find out, first try this:
#  Using ggplot, create scatterplots to see which
#  of the variables Expenditure, PT.ratio,
#  AveSalary, and PercTaking is most correlated
#  with SATTot.  That is, let y = SATTot, and make four
#  scatterplots, letting each variable be x.
ggplot(data = sat, mapping = aes(y = SATTot, x = Expenditure)) +
  geom_point()
ggplot(data = sat, mapping = aes(y = SATTot, x = PT.ratio)) +
  geom_point()
ggplot(data = sat, mapping = aes(y = SATTot, x = AveSalary)) +
  geom_point()
ggplot(data = sat, mapping = aes(y = SATTot, x = PercTaking)) +
  geom_point()
#  Which of the variables shows the strongest
#  relationship with SATTot?  
#  Briefly describe the relationship, in terms
#  of the variables.   
# Perc taking has a strong linear relationship where SATTot decreases as 
# PercTaking increases

#  e.  Redo the plot with that strongest relating variable, 
#  adding a smoothed line (or curve) to the plot.
ggplot(data = sat, mapping = aes(y = SATTot, x = PercTaking)) +
  geom_point() +
  geom_smooth()

#  Describe the relationship.
#  WHY might it be related in this way? 
#  The SATTot started high with a low PercTaking, and decreased while PercTaking 
#  increased until about 65 PercTaking, when the SATTot began to increase again.

#  f.  Now, redo the scatterplot of that one variable 
#  again, this time WITHOUT the smoothed line, but
#  letting the points be colored by the Region
#  of the states.
ggplot(data = sat, mapping = aes(y = SATTot, x = PercTaking, color = Region)) +
  geom_point()

#  Is there a tendency for certain regions to fall in a
#  certain part of the plot?
#  Scores were highest in the MW where PercTaken was low, and lowest in the NE
#  Where PercTaken was high.

#  g.  To check the tendency, do a boxplot of PercTaking by Region.
#   Describe what you see:
ggplot(data = sat, mapping = aes(y = SATTot, x = PercTaking, fill = Region)) +
  geom_boxplot()
#  h.  Now can you explain why test scores varied across the US 
#  as they did?
#  I imagine only the smartest took the tests in the MW and knew they were going to get 
#  good scores, but in the NE everyone took the tests.
#  Question 3

#      Read surveyB.csv like this 
SB <- read.csv('SurveyB_S19.csv')

#      a.  Do a View() and summary()
View(SB)
summary(SB)

#  Notice the vectors Drive and Relationship have some blanks.  To fix
#  this, redo your read.csv, adding the argument below.  Redo
#  your summary, and notice that it will turn the blanks into NAs:
SB <- read.csv('SurveyB_S19.csv', na.strings='')

#  b.  Make a bar graph of just the variable Drive, letting the
#  bars be filled with different colors.  Note 
#  that the bar with people who did not answer
#  the Drive question is still there, though it 
#  is correctly labeled NA.  We will talk about how
#  to remove it later...
ggplot(data = SB, mapping = aes(x = Drive, fill = Drive)) +
  geom_bar()
#  Which response is the most popular?   The least popular?
#  Better than average is the most popular, with 
#  way worse than average as the least popular.
#  c.  To see if the response to Drive differs by gender,
#  redo the bar graph, letting Gender be the fill variable.
ggplot(data = SB, mapping = aes(x = Drive, fill = Gender)) +
  geom_bar()

#  d.  To make comparisons easier, redo the graph, 
#  adding position = 'fill' in the geom_bar()  parentheses.
ggplot(data = SB, mapping = aes(x = Drive, fill = Gender)) +
  geom_bar(position = 'fill')
#  Does the response appear to differ by Gender?  Explain.
#  It seems males were highest in the way better than average category,
#  and there wasn't much difference in the other categories except the worse 
#  than average category, where women pulled ahead.
