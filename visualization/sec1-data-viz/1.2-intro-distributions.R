library(dslabs)
data(heights)

# make a table of category proportions
prop.table(table(heights$sex))


cdf_function <- function(x) { # computes prob. for a single value
  mean(my_data <= x)
}

cdf_values <- sapply(a, cdf_function)
plot(a, cdf_values)
