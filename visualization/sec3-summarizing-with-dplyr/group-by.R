library(dslabs)
library(tidyverse)
data("heights")
data("murders")


#computer separate average and sd for male / female heights
heights %>% group_by(sex) # returns a grouped data frame with special properties

heights %>%
  group_by(sex) %>%
  summarize(average = mean(height), standard_deviation = sd(height))

#compute the median murder rate in the 4 regions of country provided in df

#first mutate the dataframe to add rate vector/column
murders <- murders %>%
  mutate(murder_rate = total/population*10^5)
murders

#then group_by region and summarize
murders %>%
  group_by(region) %>%
  summarize(median_murder_rate = median(murder_rate))
