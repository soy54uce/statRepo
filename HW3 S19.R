#  HW3 S19

library(ggplot2)
library(dplyr)

#  Question 1, a.
# Var = region Aes = color Geom = point
# Var = rentention Aes = y Geom = point
# Var = sfratio Aes = x Geom = point
# Var = size Aes = facet Geom = grid

#  Question 1, b.
## ggplot(data = ipeds, 
##        mapping = aes(x = sfratio, y = retention, 
##                      color = region)) +
##        geom_point() +
##        facet_grid(~size)

#  Question 2, a.
View(msleep)
msleep %>% 
  filter(vore == 'herbi') %>% 
  select(name, sleep_total) %>% 
  arrange(desc(sleep_total)) %>% 
  head(5)
  
msleep %>% 
  filter(vore == 'herbi') %>% 
  select(name, sleep_total) %>% 
  arrange(sleep_total) %>% 
  head(5)

#  Question 2, b.

msleepSum <- msleep %>% group_by(vore) %>%
  summarise(meansleep = mean(sleep_total),
            sdsleep = sd(sleep_total),
            n_vore = n())
msleepSum

#  Question 3, a.
msleepConservation <- msleep %>% 
  filter(!is.na(conservation)) %>% 
  filter(!is.na(vore))
  
ggplot(data = msleepConservation, mapping = aes(x = vore, fill = conservation)) +
  geom_bar(position = 'fill') +
  ggtitle('Conservation status of animal by "vore"')

#  Question 3, b.
msleep %>% 
  filter(!is.na(sleep_total)) %>% 
  filter(!is.na(vore)) %>% 
  ggplot(mapping = aes(x = vore, y = sleep_total, fill = vore)) +
  geom_boxplot() +
  ggtitle('Total Hours of Sleep by "vore"') +
  ylab('Total Hours of Sleep')

#  Question 3, c.
msleep %>% 
  filter(!is.na(vore)) %>% 
  ggplot(mapping = aes(x = sleep_total, fill = vore)) +
  geom_density() +
  facet_grid(rows = vars(vore)) +
  ggtitle('Total Hours of Sleep by "vore"') +
  xlab('Total Hours of Sleep')

#  Question 3, d.

ggplot(msleep, aes(x = bodywt, y = brainwt)) + 
  geom_point() +
  scale_x_log10() +
  scale_y_log10() +
  geom_smooth() +
  ggtitle('Brain Weight by Body Weight (log scale)') +
  xlab('Brain Weight (log scale)') +
  ylab('Body Weight (log scale)')

#  Question 4

# lie factor = size of graphic effect/size of data effect
# size of graphic:
# SoG <- (40 - 4)/4
# SoE <- (47500 - 43147)/43147
# SoG/SoE

# Overall lie factor: 89.2
