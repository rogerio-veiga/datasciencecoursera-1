library(ggplot2)
library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCC$SCC <- as.character(SCC$SCC)

merged <- merge(NEI,SCC, by = 'SCC')

merged$Short.Name <- as.character(merged$Short.Name)
merged$EI.Sector <- as.character(merged$EI.Sector)

# These next two lines extract emission for Coal Combustion
merged <- merged[grep('Coal', merged$Short.Name, ignore.case = FALSE),]
merged <- merged[grep('Comb', merged$Short.Name, ignore.case = FALSE),]

df <- merged %>% group_by(year) %>% summarise(mean(Emissions),min(Emissions), max(Emissions), median(Emissions))


colnames(df) <- make.names(colnames(df))
png('plot4.png')
par(mfrow = c(1,2))
plot(mean.Emissions. ~ year , data = df, ylab = 'Emissions',
     type = 'l' , main = 'US avg emissions vs time', lwd=2)
fit <- glm(df$mean.Emissions.~df$year)
co <- coef(fit)
abline(fit, col="blue", lwd=2)
legend('topright' , c('actual','trend') , col = c('black','blue'), lwd=2)



plot(max.Emissions. ~ year , data = df, ylab = 'Emissions',
     type = 'l', main = 'US max emissions vs time', lwd=2)
fit <- glm(df$max.Emissions.~df$year)
co <- coef(fit)
abline(fit, col="blue", lwd=2)
legend('topright' , c('actual','trend') , col = c('black','blue'), lwd=2)
dev.off()



