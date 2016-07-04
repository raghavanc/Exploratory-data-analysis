setwd("/Users/raghavanchandran/desktop/Exploratory Data Analysis")
## 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##
png(file= "plot4.png")
d4 <- SCC[grep("Coal", SCC$Short.Name),]
a4 <- merge(x=NEI, y=d4, by='SCC')
a4.total <- aggregate(a4[, 'Emissions'], by=list(a4$year), sum)  
colnames(a4.total) <- c('Year', 'Emissions')

ggplot(data=a4.total, aes(x=Year, y=Emissions/1000)) + 
    geom_line(aes(group=1, col=Emissions)) + geom_point(aes(size=2, col=Emissions)) + 
    ggtitle(expression('Total Emissions of PM'[2.5])) + 
    ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + 
    geom_text(aes(label=round(Emissions/1000,digits=2), size=2, hjust=1.5, vjust=1.5)) + 
    theme(legend.position='none') + scale_colour_gradient(low='black', high='red')
dev.off()


