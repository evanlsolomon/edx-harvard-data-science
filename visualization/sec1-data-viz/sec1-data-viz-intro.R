library(dslabs)
data(heights)
head(heights)

#proportions of sex of the records in the heights data
#category frequency table
prop.table(table(heights$sex))

x=heights$height
