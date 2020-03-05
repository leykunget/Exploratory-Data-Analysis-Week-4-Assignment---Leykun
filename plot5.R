## Assignment - Q5
## How have emissions from motor vehicle sources changed 
## from 1999-2008 in Baltimore City?

## load dplyr and ggplot2 packages
library(dplyr)
library(ggplot2)

## read emissions data and classification code
emissions_data <- readRDS("summarySCC_PM25.rds")
class_code <- readRDS("Source_Classification_Code.rds")

## subset data from Baltimore City from type "on road"
baltimore.emissions.year  <- emissions_data %>%
  filter(fips == "24510" & type == "ON-ROAD") %>%
  group_by(year) %>%
  summarize(Emissions = sum(Emissions))

baltimore.emissions.year$year <- as.factor(baltimore.emissions.year$year)

## create plot showing car related emissions in Baltimore City from 1999-2008

png(filename = "plot5.png")

ggplot(baltimore.emissions.year, aes(x=year, y=Emissions,fill=year, label = round(Emissions,2))) +
  geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" emissions in tons")) +
  ggtitle("Emissions from motor vehicle sources in Baltimore City")+
  geom_label(colour = "white", fontface = "bold")
  
dev.off()

