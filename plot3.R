epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"))
epc$datetime <- strptime(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")

epc.feb <- subset(epc, datetime >= "2007-02-01" & datetime < "2007-02-03")
Sys.setlocale("LC_ALL","C")

png(filename="plot3.png")
plot(epc.feb$datetime, epc.feb$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(epc.feb$datetime, epc.feb$Sub_metering_2, col="red")
lines(epc.feb$datetime, epc.feb$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.off()
