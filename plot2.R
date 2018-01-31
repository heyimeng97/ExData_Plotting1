a <- read.table('./household_power_consumption.txt', sep = ';', head = 1)
a[, 1] <- as.Date(a[, 1], format = '%d/%m/%Y')
a$DateTime <- as.POSIXct(paste(a$Date, a$Time, sep = ' '))
library(dplyr)
Finaldata <- filter(a, a$Date >= as.Date('1/2/2007', format = '%d/%m/%Y') & a$Date <= as.Date('2/2/2007', format = '%d/%m/%Y')) 
# extract the data of 1/2/2007 and 2/2/2007 and make its class 'date'

#plot2
# open devices
if(!file.exists('figures')) dir.create('figures')
png(filename = './figures/plot2.png', width = 480, height = 480, units='px')
# draw plots
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 1)
# close devices
dev.off()