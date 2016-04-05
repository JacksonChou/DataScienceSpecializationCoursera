#########################################
## Coursera Project Week 4
##
## Exploratory Data Analysis
##
## Jackson Chou
##
## Plot 2 
########################################


setwd("E:/Users/Jackson/One Drive/OneDrive/R stuff/Coursera - Data Science Specialization/4. Exploratory Data Analysis/Week 4 Course Project")


## Data Set
## PM2.5 Emissions Data (summarySCC_PM25.rds): file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. 
## For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. 

## Column defintions
## fips: A five-digit number (represented as a string) indicating the U.S. county
## SCC: The name of the source as indicated by a digit string (see source code classification table)
## Pollutant: A string indicating the pollutant
## Emissions: Amount of PM2.5 emitted, in tons
## type: The type of source (point, non-point, on-road, or non-road)
## year: The year of emissions recorded

## Plot 2
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
##Use the base plotting system to make a plot answering this question.

library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI %>% filter(fips == "24510")

baltimoresum <- aggregate(baltimore$Emissions, list(baltimore$year), sum)
  
png(filename = 'plot2.png')

barplot(baltimoresum$x, names.arg = baltimoresum$Group.1,
        main='Total Emission in Baltimore City, MD', 
        xlab='Year', ylab=expression('PM'[2.5]))

dev.off()
