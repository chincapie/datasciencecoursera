# Coursera - R programming - Quiz 3
# Programmer: Cesar
# Date: October 14, 2014

# Q1 -  In this dataset, what is the mean of 'Sepal.Length' for the species virginica?
library(datasets)
data(iris)
?iris
d <- iris
str(iris)
d.virg <- d[d$Species == 'virginica', ]
mean(d.virg$Sepal.Length, na.rm = TRUE)

doBy::summaryBy(Sepal.Length ~ Species, data = d, 
  FUN = function(x) {c(mean = mean(x, na.rm = TRUE))})

tapply(d$Sepal.Length, d$Species, mean)

# Q2 -  What R code returns a vector of the means of the variables 'Sepal.Length',
#       'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
str(iris)
apply(iris, 1, mean)
apply(iris[, 1:4], 2, mean)  # selects the numeric variables/columns and applies mean col-wise
apply(iris, 2, mean)
apply(iris[, 1:4], 1, mean)

# Q3 -  How can one calculate the average miles per gallon (mpg) by number of cylinders
#       in the car (cyl)?
data(mtcars)
str(mtcars)
?mtcars
tapply(mtcars$cyl, mtcars$mpg, mean)
apply(mtcars, 2, mean)
tapply(mtcars$mpg, mtcars$cyl, mean)
lapply(mtcars, mean)

# Q4 -  What is the absolute difference between the average horsepower of 4-cylinder cars
#       and the average horsepower of 8-cylinder cars?
str(mtcars)
hp.cyl <- tapply(mtcars$hp, mtcars$cyl, mean)
str(hp.cyl)
abs(hp.cyl['4'] - hp.cyl['8'])

# Q5 - If you run <debug(ls)> what happens when you next call the 'ls' function?
debug(ls)
ls()
