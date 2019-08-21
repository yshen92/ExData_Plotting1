#Read_Data
household <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings = "?")
household[['Date']] <- strptime(household[['Date']], format="%d/%m/%Y")

#01-02 July Data
july <- subset(household, Date >= "2007-02-01" & Date <= "2007-02-02" )

#Plot
with(july, hist(Global_active_power,xlab='Global Active Power (kilowatts)',main='Global Active Power', col='red'))

#Write to .png
dev.copy(png, file='plot1.png', width=480, height=480)
dev.off()