# Ben Beaudin
# Nicholas Lawrence
# Nick Knudsen

library(dplyr)

lyrics <- read.csv('hipHopLyrics.csv') %>% 
  select(-c(url, id)) %>% 
  group_by(sentiment) 

summary(lyrics)

rRoss <- lyrics %>% 
  filter(artist == 'Rick Ross')

summary(rRoss)

moneyLyrics <- lyrics %>% 
  filter(theme == 'money')
