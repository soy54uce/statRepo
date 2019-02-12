## GGPLOT themes
library(ggplot2)
ggplot(data = mpg, mapping = aes(x = hwy, y = cty, color = class)) +
  geom_point()

ggplot(data = mpg, mapping = aes(x = hwy, y = cty, color = class)) +
  geom_point() +
  theme_minimal()

# Try theme_bw()  theme_light()  theme_minimal()


ggplot(data = mpg, mapping = aes(x = hwy, y = cty, color = class)) +
  geom_point() +
  theme(legend.position = 'none')
