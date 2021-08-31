# load libraries and inspect data
library(dslabs)
library(tidyverse)

data("gapminder")
head(gapminder)

#facet plots by continent and year
filter(gapminder, year %in% c(1962,2012)) %>%
  ggplot(aes(fertility, life_expectancy, col = continent)) +
  geom_point() +
  facet_grid(continent~year)

# facet by year only
filter(gapminder, year %in% c(1962,2012)) %>%
  ggplot(aes(fertility, life_expectancy, col=continent)) +
  geom_point() +
  facet_grid(.~year)

#facet by multiple years, plots wrapped onto multiple rows
years <- c(1962, 1980, 1990, 2000, 2012)
continents <- c("Europe", "Asia")
gapminder %>% 
  filter(year %in% years & continent %in% continents) %>%
  ggplot(aes(fertility, life_expectancy, col=continent)) +
  geom_point() +
  facet_wrap(~year)
