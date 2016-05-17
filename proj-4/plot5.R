library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEI <- subset( NEI , fips == '24510')
SCC$SCC <- as.character(SCC$SCC)

merged <- merge(NEI,SCC, by = 'SCC')

merged$Short.Name <- as.character(merged$Short.Name)
merged$EI.Sector <- as.character(merged$EI.Sector)

# These next two lines extract emission for Coal Combustion
merged <- merged[grep('Veh', merged$Short.Name, ignore.case = FALSE),]
merged <- merged[grep('Fires', merged$Short.Name, ignore.case = FALSE, invert = TRUE),]

df <- merged %>% group_by(year) %>% summarise(mean(Emissions),min(Emissions), max(Emissions), median(Emissions))


colnames(df) <- make.names(colnames(df))
png('plot5.png')
par(mfrow = c(1,2))
plot(mean.Emissions. ~ year , data = df, ylab = 'Emissions',
     type = 'l' , main = 'Avg auto emissions vs time\nin Baltimore City', lwd=2)
fit <- glm(df$mean.Emissions.~df$year)
co <- coef(fit)
abline(fit, col="blue", lwd=2)
legend('topright' , c('actual','trend') , col = c('black','blue'), lwd=2)



plot(max.Emissions. ~ year , data = df, ylab = 'Emissions',
     type = 'l', main = 'Max auto emissions vs time\nin Baltimore City', lwd=2)
fit <- glm(df$max.Emissions.~df$year)
co <- coef(fit)
abline(fit, col="blue", lwd=2)
legend('topright' , c('actual','trend') , col = c('black','blue'), lwd=2)
dev.off()



