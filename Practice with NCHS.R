#  Practice dplyr and ggplot using the NCHS data.  
#  This data has physical measurements taken by the
#  U.S. National Center for Health Statistics (NCHS)
#  on about 5000 people.  Look at the NCHS data set
#  description file on Daily Schedule on Blackboard.

#  Load dplyr and ggplot2, then download NCHS
#  from the DATA tab on our Blackboard page,  
#  and read NCHS into R.  
library(ggplot2)
library(dplyr)
NCHS <- read.csv('NCHS.csv')
#  To take a look at NCHS:   use View and  summary, 
#  then use glimpse  from dplyr.
summary(NCHS)
View(NCHS)
glimpse(NCHS)
#  Are there many missing values in the data? yes, lots


#  Start with a scatterplot of Weight by Height.
ggplot(data = NCHS, 
       mapping = aes(x = height, y = weight)) +
  geom_point()


#  It's a very large data set!  Try 
#  redoing the plot with a sample of 1000
NCHS %>% 
  sample_n(1000) %>% 
  ggplot(aes(x = height, y = weight)) +
  geom_point()

#  IMPORTANT NOTE:
#   R doesn't have a problem making a graph of
#   quantitative variables that have missing
#  values -- it simply skips the missing values.
#   (Categorical variables with missing values
#   are a little more tricky...)

#  What do you notice about the shape of the plot?
#  It has a tail on the left, composed of small individuals (children)

#  Try filtering out ......
#  (Note that it makes a different if your filter
#  comes before versus after the sample_n!)
NCHS %>% 
  filter(age >= 16) %>% 
  sample_n(1000) %>% 
  ggplot(aes(x = height, y = weight)) +
  geom_point()



#  Using mutate, create a new height variable, 
#  called htinch,that is height in inches.
#  Also create a new weight variable, wtlbs, that is
#  weight in lbs.
#      39.37 inches per meter
#      2.2 lbs per kilogram
N <- NCHS %>% 
  filter(age >= 16) %>% 
  mutate(htinch = height * 39.37, 
         wtlbs = weight * 2.2)

#  Create a new data set N, with no kids, and with
#  htinch, wtlbs in the data set.
#  ^^^^^^
ggplot(data = N,
       mapping = aes(x = htinch, y = wtlbs)) +
  geom_point()

#   Now do some summarizing with N.  Use summarise() to calculate
#   the mean bmi for everyone in the data set. 
N %>% 
  summarise(meanbmi = mean(bmi, na.rm = TRUE),
            meanht = mean(htinch, na.rm = TRUE),
            meanwt = mean(wtlbs, na.rm = TRUE))
#  Add another summary variable.  Note where the 
#  comma and parentheses go..

#  Now, use group_by to print results by gender


#  Now, group by sex
N %>% group_by(sex, smoker) %>% 
  summarise(meanbmi = mean(bmi, na.rm = TRUE),
            meanht = mean(htinch, na.rm = TRUE),
            meanwt = mean(wtlbs, na.rm = TRUE))

#  Group by sex and also smoker



#  Now,  get rid of people
#  who are missing the smoker variable.
#  Getting rid of missing values can 
#  be tricky, but it's an important thing
#  to know how to do:
N %>% filter(!is.na(smoker)) %>% 
  group_by(sex, smoker) %>% 
  summarise(meanbmi = mean(bmi, na.rm = TRUE),
            meanht = mean(htinch, na.rm = TRUE),
            meanwt = mean(wtlbs, na.rm = TRUE))

#   Take NCHS data and sort in order of BMI, 
#    and print top 20  (lowest 20 BMIs)
N %>% 
  arrange(bmi) %>% 
  select(height, htinch, wtlbs, bmi) %>% 
  head(20)

#    (highest 20 BMIs)
N %>% 
  arrange(desc(bmi)) %>% 
  select(height, htinch, wtlbs, bmi) %>% 
  head(20)


