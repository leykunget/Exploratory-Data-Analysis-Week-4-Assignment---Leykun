## Assignment - Q6
## Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, 
## California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## read emissions data and classification code
emissions_data <- readRDS("summarySCC_PM25.rds")
class_code <- readRDS("Source_Classification_Code.rds")

## subset data from Baltimore City, Los Angeles County and from type "on road"

## Load dplyr package
require(dplyr)

losangelscal.data<-summarise(group_by(filter(emissions_data, fips == "06037"& type == 'ON-ROAD'), year),
                                  Emissions=sum(Emissions))
baltcitymary.data<-summarise(group_by(filter(emissions_data, fips == "24510"& type == 'ON-ROAD'), year),
                             Emissions=sum(Emissions))

losangelscal.data$County <- "Los Angeles County, CA"
baltcitymary.data$County <- "Baltimore City, MD"
both.emissions.data <- rbind(losangelscal.data, baltcitymary.data)
both.emissions.data

## create plot comparing emissions from motor vehicles in Baltimore and LA from 1999-2008

library(ggplot2)

png(filename = "plot6.png")

qplot(year, Emissions, data = both.emissions.data, color = County, geom = "line") +
  ggtitle("Emissions of PM2.5 in Baltimore City (24510) and LA County (06037)") + 
  ylab("Total Emissions from motor vehicles (tons)") + 
  xlab("Year") 

dev.off()
