library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- subset( NEI , fips == '24510')
NEI$type <- factor(NEI$type)

df <- NEI %>% group_by(year,type) %>% summarise(mean(Emissions),min(Emissions), max(Emissions), median(Emissions))

colnames(df) <- make.names(colnames(df))

p <- ggplot(df, aes(x=year, y=mean.Emissions., colour=type)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, size=1) +
  ggtitle("Mean Emissions Vs Time") +
  xlab('Mean Emissions') +
  ylab('Year')
  
png('plot3.png')
print(p)
dev.off()
