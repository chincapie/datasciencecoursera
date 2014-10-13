# R programming - Assignment 1
# Programmer: Cesar Hincapié
# Date: October 13, 2014

# Part 1
# Write a function named 'pollutantmean' that calculates the mean of a pollutant
# (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean'
# takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers,
# 'pollutantmean' reads that monitors' particulate matter data from the directory specified
# in the 'directory' argument and returns the mean of the pollutant across all of the monitors,
# ignoring any missing values coded as NA.

pollutantmean <- function (directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating the location of the
    ## csv files
  
    ## 'pollutant' is a character vector of length 1 indicating the name of the pollutant
    ## for which the mean will be calculated; either "sulfate" or "nitrate"
  
    ## 'id' is an integer vector indicating the monitor ID numbers to be used
  
    ## return the mean of the pollutant across all monitors list in the 'id' vector
    ## (ignoring NA values)
    
    ## use data.table package to read in data with fread
  
        filenames <- sprintf("%03d.csv", id)
        filepaths <- file.path(directory, filenames)
        list.dfs <- lapply(filepaths, read.csv)
        df <- plyr::ldply(list.dfs)
        mean(df[, pollutant], na.rm = TRUE)
}