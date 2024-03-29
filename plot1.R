data <- "./data/household_power_consumption.txt"
readingData <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- readingData[readingData$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()