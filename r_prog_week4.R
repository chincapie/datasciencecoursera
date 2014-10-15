# R programming - Week 4 - str Function, Simulation and Profiling

#### str Function ####

# the most important function in all of R
# compactly display the abbreviated contents of (possibly nested) lists
# roughly one line of output per basic object
# The basic goal of str is to answer the question: What's in this object?

str(str)
str(lm)
str(ls)

x <- rnorm(100, 2, 4)
summary(x)
str(x)

f <- gl(40, 10)
str(f)
summary(f)

library(datasets)
head(airquality)
str(airquality)

m <- matrix(rnorm(100), 10, 10)
str(m)
head(m[, 1])

s <- split(airquality, airquality$Month)
str(s)


#### Simulation ####

# probablity distribution functions have four functions associated with them prefixed with:
# d for density
# r for random number generation
# p for cumulative distribution
# q for quantile function

# probability distributions in R:
# norm for normal distribution
# pois fo Poisson distribution
# gamma for gamma distribution
# binom for binomial distribution
# unif for uniform distribution
# exp for exponential distribution

x <- rnorm(10)
x
x <- rnorm(10, 20, 2)

set.seed(1)
rnorm(5)
rnorm(5)
set.seed(1)
rnorm(5)

rpois(10, 1)
rpois(10, 2)
rpois(10, 20)
ppois(2, 2) # cumulative distribution - Pr(x <= 2, if the rate is 2)
ppois(4, 2) # Pr(x <= 4, if the rate is 2)
ppois(6, 2) # Pr(x <= 6, if the rate is 2)

# simulating from a linear model
# x is a normal random variable
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

# x is binary
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

# simulating from a generalized linear model - slighty more complicated
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)

# random sampling using the sample function
set.seed(1)
sample(1:10, 4)
sample(1:10, 4)
sample(letters, 5)
sample(1:10)  # permutation
sample(1:10)
sample(1:10, replace = TRUE)  # sample with replacement



#### Profiling R code ####

# helps figuring out why R is taking as long as it is and optimizing code
# is code running slowly?
# profiling is a systematic way to examine how much time is spent in different parts of code

# general rules of optimization
# design code first, then optimize if necessary
# premature optimization is the root of all evil! - Donald Knuth
# measure (collect data), don't guess
# apply scientific principles to optimization

# using system.time()
?system.time

# elapsed time > user time
system.time(readLines('http://www.utoronto.ca'))

# elapsed time < user time
hilbert <- function(n) {
  i <- 1:n
  1 / outer(i - 1, i, '+')
}
x <- hilbert(1000)
system.time(svd(x))

# timing longer expressions
system.time({
  n <- 1000
  r <- numeric(n)
  for (i in 1:n) {
    x <- rnorm(n)
    r[i] <- mean(x)
  }
})

# R Profiler

?Rprof
?summaryRprof

# do not use system.time() and Rprof() together or you will be sad!