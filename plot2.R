data <- "./data/household_power_consumption.txt"
readingData <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- readingData[readingData$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)

datetimmee <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetimmee, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()