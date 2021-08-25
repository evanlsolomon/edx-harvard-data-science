library(dslabs)
library(tidyverse)

data("murders")

# add murder rate (per 100k) column
murders <- murders %>% mutate(rate = total / population *10^5)

# use 'arrange' fn to sort table by population
murders %>% arrange(population) %>% head()

# use 'arrange' fn to sort table by murder rate in asc order (default)
murders %>% arrange(rate) %>% head()

# use 'arrange' fn to sort table by murder rate in desc order
murders %>% arrange(desc(rate)) %>% head()


# use 'arrange' fn to sort table first by region then by murder rate
murders %>% arrange(region, rate) %>% head()
murders %>% arrange(region, rate)

# use top_n fn to show 10 states with HIGHEST (top) murder rates
murders %>% top_n(10, rate)

# now arrange them first by murder rate and pipe into top_n function
murders %>% arrange(desc(rate)) %>% top_n(10)

# alternatively, can use the slice_max function
murders %>% slice_max(rate, n = 10)
