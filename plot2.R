' read data
'
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

'subset
'
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007") , ]
globalActivePower <- as.numeric(subsetData$Global_active_power)
dateTime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

'image file
'
png(filename = "plot2.png", 
    width = 480, height = 480,
    units = "px", bg = "transparent")

'plot
'
plot(dateTime, globalActivePower, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()