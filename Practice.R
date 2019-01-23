
# -------------------------------------------------------

#  More work with vectors and data frames:  

#  Enter Birth/Death data for different countries 
#  as 3 vectors, by running the code below, then print them
#  on the console.  

Birth <- c(34 ,17 ,15 ,11, 23,20 ,12, 20, 8 ,50, 11, 13)
Country<-c('Afg','Arg','Aus','Can','Egy','ElS','Fra','Isr','Jap','Nig','Ukr','USA')
Death  <- c( 8 , 8,  6  ,7  ,7  ,6  ,9  ,5  ,10, 10, 15 ,8 )

# Use the vectors to create a Data Frame, called bd:
bd <- data.frame(Birth, Country, Death)

#   To look at the data frame, we used:
View(bd)

#  Try these other useful functions that have data frames as
#  their arguments:
dim(bd)       #  number of rows, number of columns
names(bd)     #  names of variables
summary(bd)   #  stats for each variables
head(bd)      #  first 6 rows
tail(bd)      #  last 6 rows

#  Next, remove the vectors, Country, Birth, and Death,
#   from your workspace.
#  (Remember we still have them in the workspace,
#  inside the data frame called bd)
rm(Country, Birth, Death)

#  If you try to find the mean of the Birth
#  vector now, this doesn't work:
mean(Birth)

#  R doesn't see the vector as a vector -- R
#  only sees it within the data frame, bd.
#  So to identify Birth, you address it like this:
bd$Birth
mean(bd$Birth)

plot(x = bd$Birth, y = bd$Death)
plot(x = bd$Death, y = bd$Birth)
