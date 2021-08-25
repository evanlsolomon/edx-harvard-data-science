# The dot operator allows you to access values stored in data that is 
# being piped in using the %>% character. The dot is a placeholder for 
# the data being passed in through the pipe.

library(tidyverse)
library(dslabs)
data("murders")

#add murder rate column to existing dataframe using dplyr
murders <- murders %>% mutate(murder_rate = total/population*10^5)

# take mean of all murder rates across states NOT EQUAL TO THE US MURDER RATE!!!
summarize(murders, mean(murder_rate))

# calculate the actual US Murder rate
us_murder_rate <- murders %>%
  summarize(rate = sum(total) / sum(population) * 10^5)
us_murder_rate
class(us_murder_rate)
# summarize returns a Data frame (us_murder_rate is a df)
# any function that requires a numeric value cannot recieve a df


# change the us_murder_rate variable to store a numeric rather than data fram
us_murder_rate <- murders %>%
  summarize(rate = sum(total)/sum(population)*10^5) %>% 
  .$rate
us_murder_rate
class(us_murder_rate)
