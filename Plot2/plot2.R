#Read_Data
household <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings = "?")
household[['date_time']] <- strptime(with(household, paste(Date, Time, sep=" ")), "%d/%m/%Y %H:%M:%S")
household[['Date']] <- strptime(household[['Date']], format="%d/%m/%Y")

#01-02 July Data
july <- subset(household, Date >= "2007-02-01" & Date <= "2007-02-02" )

#Plot
with(july, plot(date_time, Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)'))

#Write to .png
dev.copy(png, file='plot2.png', width=480, height=480)
dev.off()