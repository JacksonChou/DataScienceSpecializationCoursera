#########################################
## Coursera Project Week 4
##
## Exploratory Data Analysis
##
## Jackson Chou
##
## Plot 4 
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

## Plot 4
## Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI$SCC <- as.factor(NEI$SCC)

SCCcoal <- SCC %>% filter(grepl("Coal", Short.Name))

#subset to Coal related names in Short.Names
coal <- NEI[NEI$SCC %in% SCCcoal$SCC, ]

png(filename = "plot4.png")

ggplot(coal, aes(x = factor(year), y = Emissions, fill=type))+
geom_bar(stat = "identity", width = .4)+
  ggtitle("Total Coal-Related PM2.5 Emissions")+
xlab("Year") + ylab("Total Coal Related PM2.5 Emissions")


dev.off()


