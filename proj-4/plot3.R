library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- subset( NEI , fips == '24510')
NEI$type <- factor(NEI$type)

df <- NEI %>% group_by(year,type) %>% summarise(mean(Emissions),min(Emissions), max(Emissions), median(Emissions))

colnames(df) <- make.names(colnames(df))