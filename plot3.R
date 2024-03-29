data <- "./data/household_power_consumption.txt"
readingData <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- readingData[readingData$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetimmee <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMeterinnng1 <- as.numeric(subSetData$Sub_metering_1)
subMeterinnng2 <- as.numeric(subSetData$Sub_metering_2)
subMeterinnng3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetimmee, subMeterinnng1, type="l", ylab="Energy Submetering", xlab="")
lines(datetimmee, subMeterinnng2, type="l", col="red")
lines(datetimmee, subMeterinnng3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()