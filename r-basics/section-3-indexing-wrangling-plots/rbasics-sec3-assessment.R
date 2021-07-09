library(dslabs)
library(dplyr)
data(heights)
options(digits=3) # report 3 significant digits

average_height = mean(heights$height)

above_avg = heights$height>average_height # vector of those above avg


female = heights$sex == "Female"

heights = mutate(heights, heights2 = heights$height*2.54) #add column for cm

heights[18] # access the 18th record in the df

mean(heights$heights2) #find the average height in cm

female_cm = heights[heights$sex=="Female", "heights2"]

females = data.frame(heights_cm = female_cm)
mean(females$heights_cm) # find average height of females cm

data(olive) # bring the data into the workspace
head(olive) #view the head of the data

## use a scatter plot to determine if there is a relationship between
## palmitic and palmitoleic acid in the olive dataset

palmitic = olive$palmitic
palmitoleic = olive$palmitoleic
plot(palmitic, palmitoleic)

## create a histogram of the percentage of eicosenoic acid in olive dataset
eicosenoic = olive$eicosenoic
hist(eicosenoic)

## make a boxplot of palmitic acid percentage in olive with separate
## distributions for each region

boxplot(palmitic~region, data = olive)
