# R programming - Assignment 1
# Programmer: Cesar Hincapié
# Date: October 13, 2014

# Part 2
# Write a function that reads a directory full of files and reports the number of
# completely observed cases in each data file. The function should return a data frame
# where the first column is the name of the file and the second column is the number of
# complete cases.

complete <- function (directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating the location of the
    ## csv files
  
    ## 'id' is an integer vector indicating the monitor ID numbers to be used
  
    ## Return a data frame of the form
    ## id   nobs
    ## 1    117
    ## 2    1041
    ## ...
    ## where 'id' is the monitor number and 'nobs' is the number of complete cases
    
        filenames <- sprintf("%03d.csv", id)
        filepaths <- file.path(directory, filenames)
        list.dfs <- lapply(filepaths, read.csv)
        list.completes <- plyr::llply(list.dfs, complete.cases)
        nobs <- sapply(list.completes, sum)
        data.frame(id, nobs)
}