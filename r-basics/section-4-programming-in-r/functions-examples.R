avg = function(x){
  s = sum(x)
  n = length(x)
  s/n
}

x = 1:100
# we see that the above function and the predefined mean function are identical
identical(mean(x), avg(x))

# variables inside a function are not defined in the workspace
s = 3
avg(1:10)
s

# functions can have multiple arguments as well as default vals for args
avg = function(x, arithmetic = TRUE){
  n = length(x)
  ifelse(arithmetic, sum(x)/n, prod(x)^(1/n))
}
