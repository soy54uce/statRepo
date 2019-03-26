# Read in data for part 2

library(ggplot2)
library(dplyr)

USbirths <- read.csv('USbirths_2000_2014(3).csv')

ggplot(USbirths, aes(x = births)) +
  geom_histogram()

ggplot(USbirths, aes(x = births)) +
  geom_density()

ggplot(USbirths, aes(x = date, y = births)) +
  geom_point()

USbirths %>% 
  filter(year == 2014, month == 1) %>% 
  ggplot(aes(x = date, y = births)) +
  geom_point() +
  geom_text(aes(label = day_of_week,
                hjust = 0, vjust = 0))


# Question 2 on homework

# Part a
# Compare with only other Fridays as they are the only day of the week that is significant 
# when it is the 13th day of the month.


  
USFribirths <- USbirths %>% 
  mutate(thirteen = ifelse(USbirths$date_of_month == 13, 'Yes', 'No')) %>% 
  filter(day_of_week == 'Fri')
  
ggplot(USFribirths, aes(x = births, fill = thirteen)) +
  geom_density(alpha = 0.5)

USFribirths %>% 
  group_by(thirteen) %>% 
  summarise(mean = mean(births),
            median = median(births),
            max = max(births),
            min = min(births),
            sd = sd(births),
            n = n())

# Part e
# For the group born on Friday the 13th, the center was just under 12,000 births, with a 
# relatively small standard deviation of 580, and a very tall and skinny shape. The group 
# not born on Friday the 13th had a slightly higher center close to 12,100, a larger spread
# and  a generally normal distribution slightly skewed to the left. These graphs show us 
# that there is generally a slightly lower number of people born on Friday the 13th than 
# compared to other days. This might be explained by human superstitions, and not wanting
# their children to be cursed. 

# Quesiton 3 on homework

m <- read.csv('MeasureS19.csv', na.strings = '')

summary(m)

m2 <- m %>% 
  mutate(Height = ifelse(Height < 40, NA, Height),
         Armspan = ifelse(Armspan < 40, NA, Armspan),
         Lhand = ifelse(Lhand > 15, NA, Lhand),
         Rhand = ifelse(Rhand > 15, NA, Rhand)) %>% 
  filter(!is.na(Height), !is.na(Hand))

ggplot(m2, aes(x = Height, y = Armspan)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE)

ggplot(m2, aes(x = Height, y = RFoot)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE)

ggplot(m2, aes(x = Height, y = Rhand)) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE)

HeightArmspanReg <- lm(m2$Height ~ m2$Armspan)
summary(HeightArmspanReg)

HeightRFootReg <- lm(m2$Height ~ m2$RFoot)
summary(HeightArmspanReg)

HeightRhandReg <- lm(m2$Height ~ m2$Rhand)
summary(HeightArmspanReg)

HeightArmspanReg
HeightRFootReg
HeightRhandReg


# Part d
# For each increase in armspan by 1 inch, height has an associated increase
# of about 0.65 inches.
# For each increase in right foot length by 1 inch, height has an associated increase
# of about 3.60 inches.
# For each increase in right hand length by 1 inch, height has an associated increase
# of about 2.11 inches.

# Part e

mA <- m %>% 
  filter(!is.na(Height), !is.na(Armspan)) 

cor(mA$Height, mA$Armspan)

mB <- m %>% 
  filter(!is.na(Height), !is.na(RFoot))

cor(mB$Height, mB$RFoot)

mC <- m %>% 
  filter(!is.na(Height), !is.na(Rhand))

cor(mC$Height, mC$Rhand)

# Part f
# The relationship between height and armspan was relatively close with a slight 
# linear correlation. Height and right foot measurement had the highest correlation
# of 0.50. The weakest correlation was between height and right hand length.
# This makes sense being the least correlated body measurement, as human hand size
# is a pretty variable trait between people that doesn't always seem associated 
# with height.


