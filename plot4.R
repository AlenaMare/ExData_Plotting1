# Read file
power <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, header = TRUE, sep =";" )
#Convert the Global_active_power/Global_reactive_power into a numeric class using as.numeric()function.
power$Global_active_power <- as.numeric(power$Global_active_power)
power$Global_reactive_power <- as.numeric(power$Global_active_power)
# Merge date and time together
power$TimeDate <- strptime(paste(power$Date, power$Time, sep=""), "%d/%m/%Y %H:%M:%S")
# Convert the Date and Time variables to Date/Time classes in R using the ad.Date() and strptime() functions.
power$Date <- as.Date(power$Date, format="%d/%m/%Y" )
power$Time <- strptime(power$Time, format="%H:%M:%S")
# Subsetting only data from the dates 2007-02-01 and 2007-02-02
subsetpower <- subset(power, Date == "2007-02-01" | Date =="2007-02-02")
# Creating four plots in png
png("plot4.png", width=480, height=480)
par(mfcol=c(2,2))
plot(subsetpower$TimeDate, subsetpower$Global_active_power, type = "l", xlab="", ylab="Global Active Power")
with(subsetpower, plot(subsetpower$TimeDate, subsetpower$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering"))
lines(subsetpower$TimeDate, subsetpower$Sub_metering_2, type = "l", col = "red")
lines(subsetpower$TimeDate, subsetpower$Sub_metering_3, type = "l", col = "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1, col = c("black","red","blue"))
plot(subsetpower$TimeDate, subsetpower$Voltage, type = "l", xlab="datetime", ylab="Voltage")
plot(subsetpower$TimeDate, subsetpower$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")
dev.off() 



