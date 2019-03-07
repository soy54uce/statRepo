library(dplyr)

g <- read.csv('Groceries.csv')

# Market Basket Analysis

BreadMilk <- g %>% 
  summarise(nT = n(),
            suppBr = sum(Bread)/nT,
            suppMi = sum(Milk)/nT,
            suppBrMi = sum(Bread * Milk)/nT,
            conf1 = suppBrMi/suppBr,
            lift1 = conf1/suppMi)
BreadMilk

G <- read.csv('groceriesALL.csv')
# For next class, try using the same code for rule
# Butter -> Milk

# 2-26-19
ButterMilk <- G %>% 
  summarise(sumB = sum(butter),
            nT = n(),
            supB = sumB / nT,
            sumBMi = sum(butter * whole.milk),
            supBMi = sumBMi / nT,
            confBMi = supBMi / supB,
            sumMi = sum(whole.milk),
            supMi = sumMi / nT,
            liftBMi = confBMi / supMi)
ButterMilk

names(G)
G %>% 
  summarise(sumY = sum(yogurt),
            sumM = sum(whole.milk),
            sumYM = sum(yogurt * whole.milk),
            supY = sumY / n(),
            supM = sumM / n(),
            supYM = sumYM / n(),
            confYM = supYM / supY,
            liftYM = confYM / supM)

G %>% 
  summarise(sumC = sum(cereals),
            sumM = sum(whole.milk),
            sumCM = sum(cereals * whole.milk),
            supC = sumC / n(),
            supM = sumM / n(),
            supCM = sumCM / n(),
            confCM = supCM / supC,
            liftCM = confCM / supM)
G %>% 
  summarise(sumB = sum(canned.beer),
            sumM = sum(whole.milk),
            sumBM = sum(canned.beer * whole.milk),
            supB = sumB / n(),
            supM = sumM / n(),
            supBM = sumBM / n(),
            confBM = supBM / supB,
            liftBM = confBM / supM)

G %>% 
  summarise(sumY = sum(make.up.remover),
            sumM = sum(whole.milk),
            sumYM = sum(make.up.remover * whole.milk),
            supY = sumY / n(),
            supM = sumM / n(),
            supYM = sumYM / n(),
            confYM = supYM / supY,
            liftYM = confYM / supM)
