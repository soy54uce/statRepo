# January 24

# ggplot2 -- The Grammar of Graphics

library(ggplot2)

mpg
ggplot(mpg, aes(x = displ, y = hwy, alpha = class)) +
  geom_point()

ggplot(mpg, aes(x = displ, y = hwy, size = class)) +
  geom_point()

# only can handle 6 shapes by default, but could force more
ggplot(mpg, aes(x = displ, y = hwy, shape = class, color = class)) +
  geom_point()

# back to original graph
# facets split data up into multiple graphs
# facet_grid use
# ROWS ~ COLUMNS or ROWS ~ . or . ~ COLUMNS
ggplot(mpg, aes(x = displ, y = hwy, color = trans)) +
  geom_point(alpha = 0.5) +
  facet_grid(class ~ .)

ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point(alpha = 0.5) +
  facet_grid(class ~ drv)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se = FALSE)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth() +
  labs(x = "Engine Displacement", y = "Highway Mileage", title = 'Mileage by Size of Engine')

ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  labs(x = "Engine Displacement", y = "Highway Mileage", title = 'Mileage by Size of Engine',
       color = "Vehicle Class")


# load nycflights data
library(nycflights13)
library(dplyr)
nycflights13::flights
dim(flights)

# ModernDive talks about the 5NG Five Named Graphs
# scatterplots
# linegraphs
# boxplot
# histogram
# barplot

allAlaskaFlights <- flights %>% 
  filter(carrier == 'AS')

ggplot(allAlaskaFlights, aes(x = dep_delay, y = arr_delay)) +
  geom_point(alpha = 0.2)

# could also jitter the points
# geom_jitter()
ggplot(allAlaskaFlights, aes(x = dep_delay, y = arr_delay)) +
  geom_jitter(width = 5, height = 5)

# line graph 
# two filters with & or ,
head(weather)
earlyJanuaryWeather <- weather %>% 
  filter(month == 1, day <= 15, origin == 'EWR')

ggplot(earlyJanuaryWeather, aes(x = time_hour, y = temp)) +
  geom_line()
