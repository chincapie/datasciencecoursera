# R programming - Week 3 - Debugging

printmessage <- function (x) {
  if(x > 0)
    print('x is greater tha zero')
  else
    print('x is less than or equal to zero')
  invisible(x)
}

printmessage(1)

printmessage(NA)

printmessage2 <- function (x) {
  if(is.na(x))
    print('x is a missing value!')
  else if(x > 0)
    print('x is greater tha zero')
  else
    print('x is less than or equal to zero')
  invisible(x)
}

x <- log(-1)

printmessage2(x)

# primary tools for debbugging in R

?traceback

?debug

?browser

?trace

?recover

print/cat statements

# traceback
mean(y)
traceback()

lm(y ~ z)
traceback()

# debug
debug(lm)
lm(y ~ z)

# recover
options(error = recover)