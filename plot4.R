epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"))
epc$datetime <- strptime(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")

epc.feb <- subset(epc, datetime >= "2007-02-01" & datetime < "2007-02-03")
Sys.setlocale("LC_ALL","C")

png(filename="plot4.png")
par(mfrow = c(2, 2))

# identical to plot2
plot(epc.feb$datetime, epc.feb$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(epc.feb$datetime, epc.feb$Voltage, type="l", xlab="datetime", ylab="Voltage")

# identical to plot3
plot(epc.feb$datetime, epc.feb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(epc.feb$datetime, epc.feb$Sub_metering_2, col="red")
lines(epc.feb$datetime, epc.feb$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)

plot(epc.feb$datetime, epc.feb$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
