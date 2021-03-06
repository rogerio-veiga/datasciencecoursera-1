library(dplyr)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

df <- NEI %>% group_by(year) %>% summarise(mean(Emissions),min(Emissions), max(Emissions), median(Emissions))
colnames(df) <- make.names(colnames(df))

png('plot1.png')
par(mfrow = c(1,2))
plot(mean.Emissions. ~ year , data = df, ylab = 'Emissions',
     type = 'l' , main = 'avg emissions vs time', lwd=2)
fit <- glm(df$mean.Emissions.~df$year)
co <- coef(fit)
abline(fit, col="blue", lwd=2)
legend('topright' , c('actual','trend') , col = c('black','blue'), lwd=2)



plot(max.Emissions. ~ year , data = df, ylab = 'Emissions',
     type = 'l', main = 'max emissions vs time', lwd=2)
fit <- glm(df$max.Emissions.~df$year)
co <- coef(fit)
abline(fit, col="blue", lwd=2)
legend('topright' , c('actual','trend') , col = c('black','blue'), lwd=2)
dev.off()

