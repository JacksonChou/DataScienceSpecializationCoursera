####################################
## Getting and Cleaning Data
## Week 1 Quiz
##
## Jackson Chou
####################################


if (file.exists("E:/Users/Jackson/One Drive/OneDrive/R stuff/Data Science Specialization/Getting and Cleaning Data") == "TRUE"))

  {
  
  setwd("E:/Users/Jackson/One Drive/OneDrive/R stuff/Data Science Specialization/Getting and Cleaning Data")

  }

#################################################
##  QUESTION 1
#################################################

#Create link variable
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
#download.file(fileURL, destfile = "./data/2006survey", method = "curl")

library(RCurl)
x <- getURL(fileURL, ssl.verifypeer = FALSE)

out <- read.csv(textConnection(x))
head(out)

View(out)

#How many are properties worth $1,000,000 or more?
length(which(out$VAL == 24))


#################################################
##  QUESTION 3
#################################################
library(xlsx)
excelURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"

download.file(excelURL, destfile = "E:/Users/Jackson/One Drive/OneDrive/R stuff/Data Science Specialization/Getting and Cleaning Data/gasdata.xlsx", mode = "wb")

gasdata <- read.xlsx("./gasdata.xlsx", sheetIndex = 1, header = T)

View(gasdata)

dat <- read.xlsx("./gasdata.xlsx", sheetIndex = 1, colIndex = 7:15, rowIndex = 18:23)

sum(dat$Zip*dat$Ext,na.rm=T)


#################################################
##  QUESTION 4
#################################################

XMLURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

library(XML)

doc <- xmlTreeParse(XMLURL, useInternalNodes = T)

rootNode <- xmlRoot(doc)

xmlName(rootNode)

zipcodedat <- xpathSApply (rootNode, "//zipcode", xmlValue)
length(which(zipcodedat == "21231"))


#################################################
##  QUESTION 5
#################################################



surveyURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"

library(RCurl)
y <- getURL(surveyURL, ssl.verifypeer = FALSE)

#read data using fread() from data.table package
library(data.table)
DT <- fread(y)


