' read data
'
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

'subset
'
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007") , ]
globalActivePower <- as.numeric(subsetData$Global_active_power)

'image file
'
png(filename = "plot1.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")

'Plot
'
hist(globalActivePower, 
     col = "Red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency",
     breaks = 12, ylim = c(0, 1200))

dev.off()