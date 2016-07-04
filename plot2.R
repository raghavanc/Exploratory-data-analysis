setwd("/Users/raghavanchandran/desktop/Exploratory Data Analysis")
## 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##
png(file= "plot2.png")
a2 <- aggregate(Emissions~ year, subset(NEI, fips == "24510"), sum)   
barplot(a2$Emissions,names.arg = a2$year, xlab="Year", ylab="PM2.5 Emissions (Tons)")
dev.off()

