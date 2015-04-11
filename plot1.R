epc <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na.strings=c("?"))
epc$Date <- as.Date(strptime(epc$Date, format="%d/%m/%Y"))

epc.feb <- subset(epc, Date >= "2007-02-01" & Date <= "2007-02-02")

png(filename="plot1.png")
hist(epc.feb$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()
