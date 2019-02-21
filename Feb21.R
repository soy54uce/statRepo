library(dplyr)

g <- read.csv('Groceries.csv')

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
