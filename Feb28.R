sd(c(1, 2, 4, 4, 4))
sd(c(0, 2, 3, 5, 5))

bechData <- read.csv('bechdel87.csv')

library(ggplot2)
library(dplyr)

ggplot(data = bechData,
       mapping = aes(x = Decade)) +
  geom_bar()

ggplot(data = bechData, mapping = aes(x = Btest)) + 
  geom_bar()

ggplot(bechData, aes(x = Btest5)) +
  geom_bar()

ggplot(bechData, aes(x = budget13)) +
  geom_histogram()

ggplot(bechData, aes(x = budget13)) +
  geom_density()

ggplot(bechData, aes(x = domgross13)) +
  geom_histogram()

ggplot(bechData, aes(x = domgross13)) +
  geom_density(fill = 'mint')

help(col2rgb)

ggplot(bechData, aes(x = intgross13)) + 
  geom_histogram()

ggplot(bechData, aes(x = Decade, fill = Btest)) + 
  geom_bar(position = 'fill')

ggplot(bechData, aes(x = Decade, fill = Btest5)) + 
  geom_bar(position = 'fill')

ggplot(bechData, aes(x = Btest, y = averating)) + 
  geom_boxplot()

bechData %>% 
  group_by(Btest) %>% 
  summarize(meanRating = mean(averating, na.rm = TRUE),
            medianRating = median(averating, na.rm = TRUE),
            sdRating = sd(averating, na.rm = TRUE))

bechData %>% 
  group_by(Btest) %>% 
  summarize(meanBudget = mean(budget13, na.rm = TRUE),
            medianBudget = median(budget13, na.rm = TRUE),
            sdBudget = sd(budget13, na.rm = TRUE))

bechData %>% 
  group_by(Btest) %>% 
  summarize(meanGross = mean(domgross13, na.rm = TRUE),
            medianGross = median(domgross13, na.rm = TRUE),
            sdGross = sd(domgross13, na.rm = TRUE))

ggplot(data = bechData, mapping = aes(x = budget13,
                                      y = domgross13)) +
  geom_point() +
  geom_smooth()

newData <- bechData %>% 
  mutate(domprofit13 = 100 * (domgross13 - budget13) / budget13,  
    intprofit13 = 100 * (intgross13 - budget13) / budget13)

ggplot(data = newData, 
       mapping = aes(x = domprofit13)) +
  geom_density() +
  facet_grid(Btest ~.) +
  scale_x_log10()

newData %>% 
  group_by(Btest) %>% 
  summarise(medDomProf = median(domprofit13, na.rm = TRUE),
            medIntProf = median(intprofit13, na.rm = TRUE))
