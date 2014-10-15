# Coursera - R programming - Quiz 4
# Programmer: Cesar Hincapié
# Date: October 14, 2014

# Q1 -  What is produced at the end of this snippet of R code?
set.seed(1)
rpois(5, 2)

# Q2 -  What R function can be used to generate standard Normal random variables?
?rnorm

# Q3 -  When simulating data, why is using the set.seed() function important?
?set.seed
# It ensures that the sequence of random numbers starts in a specific place 
# and is therefore reproducible.

# Q4 -  Which function can be used to evaluate the inverse cumulative distribution 
# function for the Poisson distribution?
?qpois

# Q5 - What does the following code do?
set.seed(10)
x <- rbinom(10, 10, 0.5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
summary(y)
plot(x, y)

# Q6 - What R function can be used to generate Binomial random variables?
?rbinom

# Q7 - What aspect of the R runtime does the profiler keep track of when 
# an R expression is evaluated?
?Rprof

# Q8 - Consider the following R code
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
summaryRprof()

# Q9 - When using 'system.time()', what is the user time?
?system.time

# Q10 - If a computer has more than one available processor and R is able to 
# take advantage of that, then which of the following is true when using 'system.time()'?
