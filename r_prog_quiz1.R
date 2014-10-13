# Coursera - R Programming Course
# Programmer: Cesar Hincapié
# Date: October 12, 2014

# dataset: hw1_data.csv

getwd()  # get working directory

dir()  # see directory contents

d <- read.csv(file='hw1_data.csv')  # read data

str(d)  # see data structure

head(d)  # see first 6 rows of dataframe

nrow(d)  # number of rows in dataframe

dim(d)  # dimensions of dataframe

tail(d)  # see last 6 rows of dataframe

d$Ozone[47]  # see element 47 of the ozone variable

d[47, 'Ozone']  # subset row 47 of the Ozone column/variable

summary(d$Ozone)  # summary of the ozone variable

mean(d$Ozone, na.rm=TRUE)  # mean of the ozone data, missing values removed

d.sub <- d[which(d$Ozone > 31 & d$Temp > 90), ]  # subset 1 - ozone>31 and temp>90

mean(d.sub$Solar.R)  # mean solar.r of the subsetted data

d.june <- d[which(d$Month == 6), ]  # subset 2 - June data

mean(d.june$Temp)  # mean temp of the June data

d.may <- d[which(d$Month == 5), ]  # subset 3 - May data

max(d.may$Ozone, na.rm = TRUE)  # max ozone in May, missing values removed