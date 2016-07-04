setwd("/Users/raghavanchandran/desktop/Exploratory Data Analysis")
## 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##
png(file= "plot1.png")
a1 <- aggregate(Emissions~ year, NEI, sum)
barplot((a1$Emissions)/10^6,names.arg=a1$year, xlab="Year",ylab="PM2.5 Emissions")
dev.off()




