

# Question 1
survey <- read.csv('SurveyC.csv', na.strings = '')
library(dplyr)
library(ggplot2)

# Question 2
survey %>% 
  filter(!is.na(Relationship)) %>% 
  ggplot(mapping = aes(x = Books, fill = Relationship)) +
  geom_density() +
  theme_classic() +
  facet_grid(Relationship ~.) +
  xlab("Books Read per Year for Pleasure") +
  ggtitle("Does a relationship cut in on your reading time?")

# Question 3
survey %>% 
  filter(!is.na(Relationship)) %>% 
  group_by(Relationship) %>% 
  summarise(AvgBooks = mean(Books),
            NumStuds = n())

print("It seems that there may be a slight increase in the number of books read for those who aren't in a relationship, but this difference is not very noticeable when looking at a graph.")

# Question 4
survey %>% 
  filter(!is.na(Relationship)) %>% 
  filter(!is.na(SocialMedia)) %>% 
  ggplot(mapping = aes(x = Relationship, fill = SocialMedia)) +
  geom_bar(position = 'fill') +
  labs(x = 'Are you currently in a Relationship?', fill = 'Favorite Social Media')    
      
print("A clear difference seen here is that people who aren't sure about their relationship status use snapchat much more than others. Also, those not in a relationship use facebook the most, and those in a relationship use instagram the most.")
    
# Question 5
survey %>% 
  filter(!is.na(Piercings)) %>% 
  filter(!is.na(Height)) %>%
  ggplot(mapping = aes(x = Height, y = Piercings)) +
  geom_point() +
  geom_smooth()

print("The most likely explanation for this trend is that the taller people are men, and men don't generally have as many piercings as women.")    
    
    
# Question 6
survey %>% 
  filter(!is.na(Year), Year != '5 Graduate', Year != '6 Non-Degree') %>% 
  filter(!is.na(Political)) %>% 
  ggplot(aes(x = Year, y = Political, fill = Year)) +
  geom_boxplot() +
  theme_bw() +
  ylab("Political Leaning, where 0 is most Liberal and 10 is most Conservative")

print("This graph shows a reasonably consistent trend that younger people are more likely to be liberal.")
  
# Question 7

survey %>% 
  filter(CGPA <= 4) %>% 
  arrange(desc(CGPA)) %>% 
  select(Year, CGPA, Sleep, Breakfast) %>% 
  head(10)

# Question 8

survey <- survey %>% 
  mutate(ScaleEarnings = Earnings/1000)

ggplot(survey, aes(x = ScaleEarnings)) +
  geom_density(fill = 'green') +
  xlab("Earnings in $1000's")

ggplot(survey, aes(x = ScaleEarnings)) +
  geom_density(fill = 'green') +
  scale_x_log10() +
  xlab("log10 of Earnings in $1000's")
