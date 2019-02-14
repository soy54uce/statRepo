# Feb 7th
library(stats)
library(dplyr)
library(ggplot2)

View(mpg)
# 5 Main verbs of dplyr
# 1. FILTER -- filter where some column meets some condition
mpg40 <- mpg %>% 
  filter(hwy > 40)

enEff <- mpg %>% 
  filter(hwy > 40, cty > 30)

enEff <- mpg %>% 
  filter(hwy > 40 | cty > 30)

# Choosing cars in a set of particular classes:
bigcars <- mpg %>% 
  filter(class %in% c('suv', 'pickup'))

# 2. MUTATE -- Use mutate to create new variables in the data frame

# To create a new vector that is the average of city and highway mileage
mpgNew <- mpg %>% 
  mutate(mpgAvg = (cty + hwy)/2)

# 3. SUMMARISE -- Summarize some information from the data frame.
mpg %>% 
  summarise(hwyavg = mean(hwy))

mpg %>% 
  summarise(mean(hwy))

mpg %>% 
  summarise(hwyavg = mean(hwy),
            hwystd = sd(hwy),
            numcars = n()) # or length(hwy)

# 4. Group_by() puts the data in groups by a vector. Most useful
# when followed by Summarise
classMpg <- mpg %>% 
  group_by(class) %>% 
  summarise(hwyavg = mean(hwy),
            hwystd = sd(hwy),
            numcars = n())

# 5. Arrange -- puts the data in order
#    NOT sort -- only sorts individual vectors
#    NOT order -- only gives position of the largest, next largest, . . .

mpgArranged <- mpg %>% 
  arrange(hwy)
View(mpgArranged)

mpgDescArranged <- mpg %>% 
  arrange(desc(hwy))
View(mpgDescArranged)

mpgDescArranged <- mpg %>% 
  arrange(desc(hwy)) %>% 
  head()

# Additional useful verbs in dplyr

# SELECT -- choose particular columns in the data frame to keep
mpgsmall <- mpgArranged %>% 
  select(manufacturer, model, hwy, class)

# SAMPLE_N -- used to take a subset of a data frame
mpgsample <- mpg %>% 
  sample_n(50)
dsmall <- diamonds %>% 
  sample_n(1000)

# LEFT_JOIN -- Used to merge data frames
#   also inner_join, outer_join, right_join


mpg20 <- mpg %>% 
  filter(hwy > 20)

ggplot(mpg20, aes(x = hwy, y = cty, color = class)) +
  geom_point()
# OR like this:
mpg %>% 
  filter(hwy > 20) %>% 
  ggplot(aes(x = hwy, y = cty, color = class)) +
  geom_point()

