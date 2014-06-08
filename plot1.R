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


# Create a 1-dim histogram of the Global Active Power field
# And save it to the file plot1.png (file will be stored in
# current working directory):
png(file="plot1.png",width=800, height=500)
hist(sData$Global_active_power, col='red', 
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
