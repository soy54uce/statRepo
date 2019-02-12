library(dplyr)
library(ggplot2)

View(mpg)

#   First of 5MV (Five Main Verbs)

#  1.   filter -- to choose cases (observations) to 
#  keep in your data frame
mpg %>% 
  filter(hwy > 40)

eneffcars <- mpg %>% 
  filter(hwy > 40)

#  If you want to use two
#  logical expressions, i.e.,
#  if cars must satisfy both
eneffcars <- mpg %>%
  filter(hwy > 40 , cty > 30)

#  To satisfy one OR the other
#  condition, use |
eneffcars <- mpg %>%
  filter(hwy > 40 | cty > 30)

#  To choose cars IN a set of
#  particular classes:

bigcars <-
  mpg %>%
  filter(class %in% c('suv', 'pickup'))
View(bigcars)

#  2. mutate  -- Use mutate to create new
#   vectors in the data frame

#  To create a new vector that is the 
#  average of city and highway mileage
mpgnew <- mpg %>%
  mutate(mpgavg = (cty + hwy)/2)
View(mpgnew)

#  3.  summarise -- Summarize some information
#  from the data frame.
mpg %>%
  summarise(hwyavg = mean(hwy))

#  This works, too, just different labeling
mpg %>%
  summarise(mean(hwy))

mpg %>%
  summarise(hwyavg = mean(hwy),
            hwystd = sd(hwy),
            numcars = n())

#  4.  group_by  --  puts the data in groups
#  by a vector.  Most useful when 
#  followed by Summarise.
mpgrouped <-
    mpg %>% group_by(class) %>%
         summarise(hwyavg = mean(hwy),
            hwystd = sd(hwy),
            numcars = n())
View(mpgrouped)

#  5.  Arrange  -- Puts the data in order

#    Don't try to use these to arrange data:
#    NOT sort -- only sorts individual vectors
#    NOT order -- only gives position of largest, next largest, etc


mpgarranged <-
  mpg %>%
  arrange(hwy)     # ascending order is the default
View(mpgarranged)
  
mpgarranged <-
  mpg %>%
  arrange(desc(hwy))   # for descending order
View(mpgarranged)

mpgarranged <-
  mpg %>%
  arrange(desc(hwy)) %>%
  head(8)     #  can just keep a certain number of lines
View(mpgarranged)

#   A couple more bonus data verbs:

#  select -- choose particular columns
#  in the data frame to keep
mpgsmall <-
  mpgarranged %>%
  select(manufacturer, model, hwy, class)
View(mpgsmall)

mpgsmall <-
  mpgarranged %>%
  select(-manufacturer)   #  this keeps all EXCEPT manufacturer
View(mpgsmall)

#   sample_n  is used to take a subset 
#  of a data frame. 
dsmall <- diamonds %>%
  sample_n(1000)

#  left_join (also inner_join, outer_join, etc.)
#  Used to MERGE data frames 
#  More on this later in the semester...

#  Try the following code
mpg20 <- mpg %>%
  filter(hwy > 20)

ggplot(data = mpg20,
       mapping = aes(x = hwy, y = cty,
                     color = class)) +
  geom_point()

#  Could do the same thing like this:

mpg %>%
  filter(hwy > 20)   %>%
  ggplot(mapping = aes(x = hwy, y = cty,
                     color = class)) +
  geom_point()
#  The above code is shorter and doesn't require you
#  to create another data frame....   But you do NOT
#  have to link dplyr and ggplot code like this in class.
#  it's just an option....