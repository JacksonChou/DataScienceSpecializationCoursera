
splitNames = strsplit(names(cameraData), "\\.")

#===============================================
#
#Week 4 Quiz
#
#===============================================

#Question 1

library(dplyr)
library(RCurl)


setwd("E:/Users/Jackson/One Drive/OneDrive/R stuff/Data Science Specialization/Getting and Cleaning Data")

if(!file.exists("./data")) {dir.create("./data")}

fileurl1 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
fileurl2 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"

idahodata <- getURL(fileurl1)

data1 <- read.csv(textConnection(idahodata))

list <- strsplit(names(data1), split = "wgtp")




#Question 2

fileurl3 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

GDPdata <- getURL(fileurl3)

data2 <- read.csv(textConnection(GDPdata))

str(data2)
#need to clean out dataframe and remove first 4 rows
data2 <- data2[-c(1:4),]

#Replace commas with nothing for X.3 column
data2$X.3 <- gsub(",", "", data2$X.3)

#Remove rows after 190

data2 <- data2[1:190,]
data2$X.3 <- as.numeric(data2$X.3)
mean(data2$X.3, na.rm=T)


#Question 3

grep("^United States", data2$X.2)

#Question 4

fileurl4 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

educationdata <- getURL(fileurl4)

data3 <- read.csv(textConnection(educationdata))
View(data3)

#Merge educational data with gdp data

data4 <- merge(data2, data3, by.x = "X", by.y = "CountryCode")

fiscaljune <- grep("Fiscal year end: June", data4$Special.Notes)

length(fiscaljune)



#Question 5

install.packages('quantmod')
library(quantmod)

amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

#Match the index for sampleTimes that says "2012" year
year2012 <- grepl("2012", sampleTimes)

#Subset Sampletimes based on year 2012
sampleTimes2012 <- subset(sampleTimes, year2012)

#Find the day of each element in sampletimes2012
day <- format(sampleTimes2012, '%A')
table(day) #This is the answer to see how many days were Monday in 2012 

length(sampleTimes2012) 


