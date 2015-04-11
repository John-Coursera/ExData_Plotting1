epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"))
epc$datetime <- strptime(paste(epc$Date, epc$Time), format="%d/%m/%Y %H:%M:%S")

epc.feb <- subset(epc, datetime >= "2007-02-01" & datetime < "2007-02-03")
Sys.setlocale("LC_ALL","C")

png(filename="plot2.png")
plot(epc.feb$datetime, epc.feb$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
