# Read the data from a local file:
data <- read.csv("C:/household_power_consumption.txt", sep=";", 
                 header=TRUE, na.strings="?")
# Combine the date and time fields to create Date objects
dateTime <- strptime(paste(data$Date, data$Time), 
                     "%d/%m/%Y %H:%M:%S")
# Append dateTime to the dataframe: 
data <- cbind(data, dateTime)
# Subset the dataframe based on date range:
sData <- subset(data, (data$dateTime >= as.POSIXlt("2007-02-01 00:00:00") &
                         data$dateTime < as.POSIXlt("2007-02-03 00:00:00")))


# Create a linear plot of the Global Active Power & Time fields
# And save it to the file plot2.png (file will be stored in
# current working directory):
png(file="plot2.png",width=800, height=500)
plot(sData$dateTime, sData$Global_active_power, 
     main="Global Active Power", xlab="Time", 
     ylab="Global Active Power (kilowatts)", type="l")
dev.off()