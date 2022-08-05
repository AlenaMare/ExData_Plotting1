# Read file
power <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, header = TRUE, sep =";" )
# Convert the Date and Time variables to Date/Time classes in R using the ad.Date() and strptime() functions.
power$Date <- as.Date(power$Date, format="%d/%m/%Y" )
power$Time <- strptime(power$Time, format="%H:%M:%S")
# Convert the Global_active_power into a numberic class using as.numeric()function.
power$Global_active_power <- as.numeric(power$Global_active_power)
# Subsetting only data from the dates 2007-02-01 and 2007-02-02
subsetpower <- subset(power, Date == "2007-02-01" | Date =="2007-02-02")
# Creating histogram in png
png("plot1.png", width=480, height=480)
hist(subsetpower$Global_active_power, col="red", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

