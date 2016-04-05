#########################################
## Coursera Project Week 4
##
## Exploratory Data Analysis
##
## Jackson Chou
##
## Plot 1 
########################################


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

## Plot 1
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
## for each of the years 1999, 2002, 2005, and 2008.


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions <- aggregate(NEI$Emissions, by = list(NEI$year), FUN= sum)

png(filename='plot1.png')

barplot(emissions$x, names.arg=emissions$Group.1, 
        main=expression('Total Emission of PM'[2.5]),
        xlab='Year', ylab=expression(paste('PM', ''[2.5])))

dev.off()

