add2 <- function(x, y) {
  x + y
}

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n) {
  use <- x > n
  x[use]
}

ColumnMean <- function(y, removeNA = TRUE) {
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc) {
    means[i] <- mean(y[, i], na.rm = removeNA)
  }
  means
  }

f <- function(a, b) {
  print(a)
  print(b) 
}
f(45)  # example of lazy evaluation; error thrown only after print(a) is evaluated

x <- list(a = 1:5, b = rnorm(10))
lapply(x, mean)
sapply(x, mean)

x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
lapply(x , mean)

x <- 1:4
lapply(x, runif)
args(runif)
lapply(x, runif, min = 0, max = 10)

x <- list(a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
x
lapply(x, function(elt) elt[, 1])  # example of an anonymous function

# tapply
str(tapply)
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
f
tapply(x, f, mean)
tapply(x, f, mean, simplify = FALSE)
tapply(x, f, range)

# split
str(split)
split(x, f)
lapply(split(x, f), mean)
tapply(x, f, mean)

# split-apply functions on real data
library(datasets)
str(datasets)
datasets
ls()
str(d)
head(airquality)
str(airquality)
summary(airquality)
s <- split(airquality, airquality$Month)
lapply(s, function(x) colMeans(x[, c('Ozone', 'Solar.R', 'Wind')]))
sapply(s, function(x) colMeans(x[, c('Ozone', 'Solar.R', 'Wind')]))
sapply(s, function(x) colMeans(x[, c('Ozone', 'Solar.R', 'Wind')], na.rm = TRUE))

# splitting on more than one level
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)
str(split(x, list(f1, f2)))
str(split(x, list(f1, f2), drop = TRUE))

# mapply - multivariate version of lapply family of functions
str(mapply)
list(rep(1, 4), rep(2, 3), rep(3, 2), rep(4, 1))
mapply(rep, 1:4, 4:1)

# vectorizing a function using mapply
noise <- function(n, mean, sd) {
  rnorm(n, mean, sd)
}
noise(5, 1, 2)
noise(1:5, 1:5, 2)  # doesn't work correctly if passed a vector of args
mapply(noise, 1:5, 1:5, 2)

# apply function - used to eavluate a function over the margins of an array
str(apply)
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean)
apply(x, 1, sum)
apply(x, 2, quantile, prob = c(0.25, 0.75))

a <- array(rnorm(2 * 2 * 10), c(2, 2, 10))
apply(a, c(1, 2), mean)
rowMeans(a, dims = 2)