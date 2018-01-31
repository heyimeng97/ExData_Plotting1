a <- read.table('./household_power_consumption.txt', sep = ';', head = 1)
a[, 1] <- as.Date(a[, 1], format = '%d/%m/%Y')
a$DateTime <- as.POSIXct(paste(a$Date, a$Time, sep = ' '))
library(dplyr)
Finaldata <- filter(a, a$Date >= as.Date('1/2/2007', format = '%d/%m/%Y') & a$Date <= as.Date('2/2/2007', format = '%d/%m/%Y')) 
# extract the data of 1/2/2007 and 2/2/2007 and make its class 'date'

#plot4
# open devices
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot4.png', width = 480, height = 480, units='px')
# draw plots
Sys.setlocale(category = "LC_ALL", locale = "english")
par(mfrow = c(2, 2))
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(data$DateTime, data$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(data$DateTime, data$Sub_metering_2, col = 'red')
lines(data$DateTime, data$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(data$DateTime, data$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
# close devices
dev.off()