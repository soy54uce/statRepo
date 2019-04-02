#  This data contains all calls made to the Burlington
#  Police Department, from January 1, 2018 to
#  December 31, 2018.
library(ggplot2)
library(dplyr)
#  Put the BPD2018.csv data in your course folder,
# and make sure your working directory points to
#  this folder.  Read in the data, and make sure it looks ok:
b <- read.csv('BPD2018.csv')
View(b)

#  Do a scatterplot of Latitude by Longitude, to see where
#  calls are made in Burlington.
ggplot(b, aes(x = Longitude, y = Latitude)) +
  geom_point()


#  There are some outliers in Longitude -- 
#  To make sure you have only local data, keep only
#  observations with longitude <  ??

#  Redo the scatterplot of Latitude by Longitude, to see where
#  calls are made in Burlington.  You should see the shape
#  of Burlington appear....  

#  Install and load a package called lubridate
#  This package makes it easier to work with dates.
library(lubridate)

#  Install and load a package called leaflet
# This package will allow us to create a cool
#  graph....
library(leaflet)


#  For example, look at the variable call_time

#  Because it is in a month/day/year hour/minute format,
#  we can 'extract' the date from it using the function
#  mdy_hm().   (Other extraction functions are:
#  dmy, myd, ymd, ydm, dym, mdy, ymd_hm)

#  THen the functions date(), month(), wday(),
#  and day() extract these values from the date.
#  Run the following code, and use View(b) to 
#  look at the new variables that have been created.
b <- b %>%
  mutate(Call = mdy_hm(call_time),
         Date = date(Call),
         Month = month(Call),
         WeekDay = wday(Call),
         Day = day(Call))

#  The lubridate functions 'know' which days of 
#  the week have which names, and which months of the
#  years have which names.   You can make R use
#  these names, by adding the argument label=TRUE
#  to the month, and the wday functions above.  
#  Go back and change the code above.  
#  Rerun the code, and view the data frame again, 
#  to see the difference...

#  Now, we will use the package leaflet. 
#  Run the following two lines:
m <- leaflet() %>%
  addTiles() %>%
  setView(lat = 44.475, lng = -73.212, zoom = 12)
m
#  (This should look familiar)

#  To add the locations of all of the calls in 
# our data set, run this:
m %>% addCircles(lat = b$Latitude, 
                 lng = b$Longitude)

#  Use ggplot to create a bar graph of the new
#  Month variable.  What does the pattern say about
#  the frequency of crimes in the months of the year?
#  Does it make sense?

#  Create another bar-graph, adding a fill of alcohol_related, 
#  and making bars all the same height.  You will need to make
#  the alcohol variable a factor, like this:   
#     as.factor(alcohol_related)     
#  Is the proportion of alcohol related calls different for the 
#  Months of the year?

#  Use ggplot to create a bar graph of the new
#  WeekDay variable.  What does the pattern say about
#  the frequency of crimes in the Days of the Week?
#  Does it make sense?

#  As you did with the Month graph, add a fill of 
#  whether the call was
#  alcohol related, and see if this
#  is related to Day of the Week.

#  Use ggplot to create a bar graph of the new Day
#  variable (Day of the month).  Again, do you see
#  a pattern that makes sense?

#  Use ggplot to create a bar graph of the new
#  Date variable.  Does the year-round pattern 
#  make sense?

#  Finally, using dplyr, create a new data set
#  that counts the number of calls of each
#  call type.  (hint:  use group_by).

#  Use dplyr to print the top 10 types of calls.
#  What are the top 5 types?

