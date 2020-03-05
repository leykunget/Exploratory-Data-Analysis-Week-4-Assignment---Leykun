## Assignment - Q1  
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

## read emissions data and classification code
emissions_data <- readRDS("summarySCC_PM25.rds")
class_code <- readRDS("Source_Classification_Code.rds")

## add up the total emissions for each year

sum_by_year <- aggregate(emissions_data$Emissions, by=list(year=emissions_data$year), FUN=sum)
sum_by_year

## create the plot

png("plot1.png")
plot(sum_by_year$year, sum_by_year$x, type = "o", pch =19,
     main = "Total Emissions of PM2.5 in US from all sources",
     ylab = "Total emissions of PM2.5 (tons)",
     xlab = "Year")
dev.off()
