a <- read.table('./household_power_consumption.txt', sep = ';', head = 1)
a[, 1] <- as.Date(a[, 1], format = '%d/%m/%Y')
a$DateTime <- as.POSIXct(paste(a$Date, a$Time, sep = ' '))
library(dplyr)
Finaldata <- filter(a, a$Date >= as.Date('1/2/2007', format = '%d/%m/%Y') & a$Date <= as.Date('2/2/2007', format = '%d/%m/%Y')) 
# extract the data of 1/2/2007 and 2/2/2007 and make its class 'date'

#plot3
# open devices
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot3.png', width = 480, height = 480, units='px')
# draw plots
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),lwd = 1)
# close devices
dev.off()