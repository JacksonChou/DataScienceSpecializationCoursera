#########################################
## Coursera Project Week 4
##
## Exploratory Data Analysis
##
## Jackson Chou
##
## Plot 6 
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

## Plot 6
## Compare emissions from motor vehicle sources in Baltimore City with emissions,
## from motor vehicle sources in Los Angeles County, California (fips == "06037").
## Which city has seen greater changes over time in motor vehicle emissions?

library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

balt_la_motor <- filter(NEI, fips == "24510" | fips == "06037", type == "ON-ROAD")

baltlasources <- aggregate(balt_la_motor$Emissions, list(type = balt_la_motor$type, year = balt_la_motor$year, zip = balt_la_motor$fips), sum)


png(filename = 'plot6.png')

qplot(year, x, data =baltlasources, geom = 'line', color = zip)+
  ggtitle("Motor Vehicle Emissions - Baltimore (24510) vs. Los Angeles (06037)")+
  xlab("Year")+ylab("PM2.5 Emissions")

dev.off()
