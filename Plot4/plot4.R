#Read_Data
household <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings = "?")
household[['date_time']] <- strptime(with(household, paste(Date, Time, sep=" ")), "%d/%m/%Y %H:%M:%S")
household[['Date']] <- strptime(household[['Date']], format="%d/%m/%Y")

#01-02 July Data
july <- subset(household, Date >= "2007-02-01" & Date <= "2007-02-02" )

#Plot
dev.print(png, file='plot4.png', width=480, height=480)
png(file = 'plot4.png', bg='transparent')
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(july, plot(date_time, Global_active_power, type='l', xlab='', ylab='Global Active Power'))
with(july, plot(date_time, Voltage, type='l', xlab='datetime', ylab='Voltage'))

with(july, plot(date_time, Sub_metering_1, type='l', col='black', xlab='', ylab=''))
with(july, lines(date_time, Sub_metering_2, type='l', col='red', xlab='', ylab=''))
with(july, lines(date_time, Sub_metering_3, type='l', col='blue', xlab='', ylab=''))
title(xlab='', ylab='Energy sub metering')
legend("topright", col=c("black","red","blue"), lty=, lwd=2.5, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(july, plot(date_time, Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power'))

#Write to .png
#dev.copy(png, file='plot4.png', width=480, height=480)
dev.off()