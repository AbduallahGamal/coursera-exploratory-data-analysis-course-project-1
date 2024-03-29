data <- "./data/household_power_consumption.txt"
readingData <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- readingData[readingData$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetimmme <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMeterinnng1 <- as.numeric(subSetData$Sub_metering_1)
subMeterinnng2 <- as.numeric(subSetData$Sub_metering_2)
subMeterinnng3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetimmme, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetimmme, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetimmme, subMeterinnng1, type="l", ylab="Energy Submetering", xlab="")
lines(datetimmme, subMeterinnng2, type="l", col="red")
lines(datetimmme, subMeterinnng3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetimmme, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()