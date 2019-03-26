
library(dplyr)
G <- read.csv('groceriesALL.csv')

## Problem 1
G %>% summarise(sumY = sum(yogurt),
                sumM = sum(whole.milk),
                sumMY = sum(whole.milk * yogurt),
                supY = sumY / n(),
                supM = sumM / n(),
                supMY = sumMY / n(),
                confMY = supMY / supM,
                liftMY = confMY / supY)

## Problem 2
G %>%  summarise(sumY = sum(yogurt),
            sumC = sum(cereals),
            sumCY = sum(cereals * yogurt),
            supY = sumY / n(),
            supC = sumC / n(),
            supCY = sumCY / n(),
            confCY = supCY / supC,
            liftCY = confCY / supY)

## Problem 3
G %>%  summarise(sumY = sum(yogurt),
            sumM = sum(whole.milk),
            sumYM = sum(yogurt * whole.milk),
            supY = sumY / n(),
            supM = sumM / n(),
            supYM = sumYM / n(),
            confYM = supYM / supY,
            liftYM = confYM / supM)