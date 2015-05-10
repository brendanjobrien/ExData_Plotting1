' read data
'
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

'subset
'
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007") , ]

'change type
'
globalActivePower <- as.numeric(subsetData$Global_active_power)
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)
voltage <- as.numeric(subsetData$Voltage)
dateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)

'image file
'
png(filename = "plot4.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")
par(mfrow = c(2, 2))

'plot
'

## Top-left
plot(dateTime, globalActivePower, 
     type = "l",
     xlab = "", ylab = "Global Active Power")

## Top-right
plot(dateTime, voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

## Bottom-left
plot(dateTime, subMetering1, 
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(dateTime, subMetering2, type="l", col = "red")
lines(dateTime, subMetering3, type="l", col = "blue")
legend("topright", 
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

## Bottom-right
plot(dateTime, globalReactivePower, 
     type = "l",
     col = "black",
     xlab = "datetime", ylab = "Golobal_reactive_power")

dev.off()