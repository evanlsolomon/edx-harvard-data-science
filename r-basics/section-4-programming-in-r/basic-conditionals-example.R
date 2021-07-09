library(dslabs)
data(murders)
murder_rate = murders$total / murders$population*100000
ind = which.min(murder_rate)


if(murder_rate[ind] <0.5){
  print(murders$state[ind])
}else {
  print("No state has murder rate that low")
}

#changing the condition to < 0.25 changes the result
if(murder_rate[ind] <0.25){
  print(murders$state[ind])
}else {
  print("No state has murder rate that low")
}

# the ifelse() function works similarly to an if-else conditional
a = 0
ifelse(a>0, 1/a, NA)

# the ifelse() function works on vectors
a = c(0,1,2,-4,5)
result = ifelse(a>0, 1/a, NA)
result

# the ifelse() function also works for replacing missing values
data(na_example)
no_nas = ifelse(is.na(na_example), 0 , na_example)

# the any() and all() functions evaluate logical vectors
z = c(TRUE, TRUE, FALSE)
any(z)
all(z)
