# R programming - Assignment 1
# Programmer: Cesar Hincapié
# Date: October 14, 2014

# Part 3
# Write a function that takes a directory of data files and a threshold for complete cases
# and calculates the correlation between sulfate and nitrate for monitor locations where
# the number of completely observed cases (on all variables) is greater than the threshold.
# The function should return a vector of correlations for the monitors that meet the
# threshold requirement. If no monitors meet the threshold requirement, then the function
# should return a numeric vector of length 0.

corr <- function (directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating the location of the
    ## csv files
  
    ## 'threshold' is a numeric vector of length 1 indicating the number of completely
    ## observed observations (on all variables) required to compute the correlation
    ## between nitrate and sulfate; the default is 0
  
    ## Return a numeric vector of correlations
        
        comp <- complete(directory)
        id <- comp[comp$nobs > threshold, ]$id
        filenames <- sprintf("%03d.csv", id)
        filepaths <- file.path(directory, filenames)
        ids.threshold <- lapply(filepaths, read.csv)
  
        compute.cor <- function(obs) {
                  cc <- complete.cases(obs)
                  round(cor(obs[cc, ]$sulfate, obs[cc, ]$nitrate), digits = 5)
        }
  
        sapply(ids.threshold, compute.cor)
}