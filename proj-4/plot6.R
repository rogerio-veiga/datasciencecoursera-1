library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bc <- subset( NEI , fips == '24510')
la <- subset( NEI , fips == '06037')

NEI <- rbind(bc,la)

SCC$SCC <- as.character(SCC$SCC)

merged <- merge(NEI,SCC, by = 'SCC')

merged$Short.Name <- as.character(merged$Short.Name)
merged$EI.Sector <- as.character(merged$EI.Sector)

merged <- merged[grep('Veh', merged$Short.Name, ignore.case = FALSE),]
merged <- merged[grep('Fires', merged$Short.Name, ignore.case = FALSE, invert = TRUE),]

df <- merged %>% group_by(year,fips) %>% summarise(mean(Emissions),max(Emissions), median(Emissions))

colnames(df) <- make.names(colnames(df))
df$City <- df$fips
df$City[df$City == '06037'] <- 'Los Angeles County'
df$City[df$City == '24510'] <- 'Baltimore City'

p <- ggplot(df, aes(x=year, y=mean.Emissions., colour=City)) +
  geom_point(alpha=.3) +
  geom_smooth(alpha=.2, size=1) +
  ggtitle("Mean Emissions Vs Time") +
  xlab('Mean Emissions') +
  ylab('Year')

png('plot6.png')
print(p)
dev.off()


