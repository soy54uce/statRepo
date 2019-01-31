# January 31

# lots taken from Jan29.R
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
  facet_grid(~class) +
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

ggplot(data = weather,
       mapping = aes(x = temp)) +
  geom_histogram(fill = 'green', color = 'blue')

# using histogram with facets
ggplot(data = weather,
       mapping = aes(x = temp)) +
  geom_histogram(fill = 'green', color = 'blue') +
  facet_wrap(~ month, nrow = 4)

# next named graph is boxplots
ggplot(weather, aes(y = temp, group = month, fill = month)) +
  geom_boxplot() 

# last named graph is bargraph
ggplot(weather, aes(x = month)) +
  geom_bar()

ggplot(flights, aes(x = carrier, fill = carrier)) +
  geom_bar()

# NEW data set
View(diamonds)
ggplot(d, aes(x = carat)) +
  geom_histogram(fill = 'orange', color = 'yellow') +
  scale_x_log10()

ggplot(diamonds, aes(x = cut, fill = cut)) +
  geom_bar()

ggplot(diamonds, aes(x = x, y = y)) +
  geom_point(alpha = 0.2)

# Some diamonds have length and/or width of 0
# omit them, since they're missing important info

d <- diamonds %>% 
  filter(x != 0, y < 20)

ggplot(d, aes(x = x, y = y, color = clarity)) +
  geom_point(alpha=0.6) 

ggplot(d, aes(x = carat)) +
  geom_density(fill = 'orange', color = 'yellow') +
  scale_x_log10()

# bar graph with 2 variables
ggplot(d, aes(x = cut, fill = color)) +
  geom_bar()

# If you wanted to compare color dist within each cut:

ggplot(d, aes(x = cut, fill = color)) +
  geom_bar(position = 'fill')

ggplot(d, aes(x = cut, fill = color)) +
  geom_bar(position = 'dodge')

# suppose we wanted to look at price (quantitative) by
# cut (categorical) -- Use boxplots for this
ggplot(d, aes(y = price, x = cut, fill = cut)) +
  geom_boxplot()

ggplot(d, aes(y = price, x = color, fill = color)) +
  geom_boxplot()

# scatterplot of price by carat e.g. y = price by x = carat
ggplot(d, aes(y = price, x = carat, color = cut)) +
  geom_point()

# Boxplot of carat by cut 
ggplot(d, aes(y = carat, x = cut, fill = cut)) +
  geom_boxplot()
