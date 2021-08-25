library(dslabs)
library(tidyverse)
data(murders)

#murders %>% ggplot() +
 # geom_point(aes(x = population/10^6, y = total))

# add points layer to predefined ggplot object
p <- ggplot(data = murders, mapping = aes(population/10^6,total, label = abb))

#p + geom_point(size = 3) +
#  geom_text(nudge_x = .05) +
#  scale_x_log10() +
#  scale_y_log10() +
#  xlab("Populations in millions (log scale)") +
#  ylab("Total number of murders (log scale)")+
#  ggtitle("US Gun Murders in US 2010") 

# make all points blue
#p + geom_point(size = 3, color = "blue")

# redefine p to be everything except the points layer
p <- murders %>%
  ggplot(aes(population/10^6, total, label = abb)) +
  geom_text(nudge_x = 0.075) +
  scale_x_log10() +
  scale_y_log10() +
  xlab("Population in millions (log scale)") +
  ylab("Total number of murders (log scale)") +
  ggtitle("US Gun Murders in 2010")

# color points by region
p + geom_point(aes(col = region), size = 3)

# add a line with the average murder rate
# define average murder rate
r <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^6) %>%
  pull(rate)

# basic line with average murder rate for the country
p + geom_point(aes(col = region), size = 3) +
  geom_abline(intercept = log10(r))    # slope is default of 1


# change line to dashed and dark grey, line under points
p + 
  geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  geom_point(aes(col = region), size = 3) +
  scale_color_discrete(name = "Region") #capitalize legend
  theme_economist()

