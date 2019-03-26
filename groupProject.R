# Ben Beaudin

library(dplyr)
library(ggplot2)


lyrics <- read.csv('hipHopLyrics.csv') %>% 
  select(-c(url, id)) %>% 
  group_by(sentiment) 

summary(lyrics)

rRoss <- lyrics %>% 
  filter(artist == 'Rick Ross')

summary(rRoss)

moneyLyrics <- lyrics %>% 
  filter(theme == 'money')

lyrics %>% 
  filter(candidate == 'Donald Trump' | candidate == 'Hillary Clinton' | candidate == 'Chris Christie' | candidate == 'Jeb Bush') %>% 
  ggplot(aes(x = album_release_date, fill = sentiment)) +
  geom_density(alpha = 0.5) +
  facet_grid(candidate ~.) +
  labs(title = 'Density of hip hop lyrics by sentiment for candidates of the 2016 US presidential election.', x = 'Album Release Date',
       y = 'Density', fill = 'Sentiment')

lyrics %>% 
  filter(candidate == 'Donald Trump' | candidate == 'Hillary Clinton') %>% 
  ggplot(aes(x = album_release_date, fill = theme)) +
  geom_density(alpha = 0.5) +
  facet_grid(candidate ~ sentiment) +
  labs(title = 'Density of hip hop lyrics by theme for the final candidates of the 2016 US presidential election.', x = 'Album Release Date',
       y = 'Density', fill = 'Theme')


HC_lyrics <- lyrics %>% 
  filter(candidate == 'Hillary Clinton')

DT_lyrics <- lyrics %>% 
  filter(candidate == 'Donald Trump')
