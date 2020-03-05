## Assignment - Q3: 
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
## which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
## Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot 
## answer this question.

## read emissions data and classification code
emissions_data <- readRDS("summarySCC_PM25.rds")
class_code <- readRDS("Source_Classification_Code.rds")

## subset to just data from Baltimore and sum up emissions by variable "type"
baltimore_data <- subset(emissions_data, emissions_data$fips=="24510")
baltimore_type_year <- aggregate(baltimore_data$Emissions, 
                                 by=list(baltimore_data$type, baltimore_data$year), 
                                 FUN=sum)
colnames(baltimore_type_year) <- c("Type", "Year", "Emissions")

## create plot with ggplot2

library(ggplot2) # load ggplot2 package

png(filename = "plot3.png")
qplot(Year, Emissions, data = baltimore_type_year, color = Type, geom = "line") +
  ggtitle("Total Emissions of PM2.5 in Baltimore City By pollutant type") + 
  xlab("Year") +
  ylab("Total Emissions (tons)") 
  
dev.off()
