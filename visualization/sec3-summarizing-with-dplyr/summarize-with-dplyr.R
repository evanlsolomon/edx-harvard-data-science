library(tidyverse)
data("heights")

# compute avg and sd heights for males in a dataframe called s
s <- heights %>% 
     filter(sex == "Male") %>%
     summarize(average = mean(height), standard_deviation = sd(height))


# compute median min and max
heights %>% filter(sex == "Male") %>% 
  summarize(
    median = median(height), 
    min = min(height), 
    max = max(height)
  )

#alternative way to get median min max in base R
quantile(heights$height, c(0, 0.5, 1))


# this code does not throw error with dplyr>=1
heights %>% 
  filter(sex == "Male") %>%
  summarize(range = quantile(height, c(0, 0.5, 1)))
