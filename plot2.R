# Read file
power <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, header = TRUE, sep =";" )
#Convert the Global_active_power into a numeric class using as.numeric()function.
power$Global_active_power <- as.numeric(power$Global_active_power)
# Merge date and time together
power$TimeDate <- strptime(paste(power$Date, power$Time, sep=""), "%d/%m/%Y %H:%M:%S")
# Convert the Date and Time variables to Date/Time classes in R using the ad.Date() and strptime() functions.
power$Date <- as.Date(power$Date, format="%d/%m/%Y" )
power$Time <- strptime(power$Time, format="%H:%M:%S")
# Subsetting only data from the dates 2007-02-01 and 2007-02-02
subsetpower <- subset(power, Date == "2007-02-01" | Date =="2007-02-02")
# Creating plot in png
png("plot2.png", width=480, height=480)
plot(subsetpower$TimeDate, subsetpower$Global_active_power, type = "l", main ="Global Active Power Vs Time", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

