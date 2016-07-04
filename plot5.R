setwd("/Users/raghavanchandran/desktop/Exploratory Data Analysis")
## 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##
library(ggplot2)
png(file= "plot5.png")
d5 <- SCC[grep("Motor Vehicle", SCC$Short.Name),]
a5 <- merge(x=NEI, y=d5, by='SCC')
a5.reg <- subset(a5, fips == "24510")
a5.total <- aggregate(a5.reg[, 'Emissions'], by=list(a5.reg$year), sum)  
colnames(a5.total) <- c('year', 'Emissions')
ggplot(data=a5.total, aes(x=year, y=Emissions)) + geom_bar(aes(fill=year)) + guides(fill=F) + 
    ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City, Maryland') + 
    ylab(expression('PM'[2.5])) + xlab('Year') + theme(legend.position='none') + 
    geom_text(aes(label=round(Emissions,0), size=1, hjust=0.5, vjust=2))

dev.off()