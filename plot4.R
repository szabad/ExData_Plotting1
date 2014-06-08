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


# Create a linear plot of the three Energy submetring fields
# And save it to the file plot3.png (file will be stored in
# current working directory):
png(file="plot4.png",width=900, height=800)
par(mfrow = c(2, 2))

# First subplot
plot(sData$dateTime, sData$Global_active_power, 
     main=NULL, xlab="Time", 
     ylab="Global Active Power (kilowatts)", type="l")

# Second subplot (Voltage)
plot(sData$dateTime, sData$Voltage, 
     main=NULL, xlab="Time", 
     ylab="Voltage", type="l")

# Third subplot (of the 3 Energy sub meterings)
plot(sData$dateTime, sData$Sub_metering_1, 
     main=NULL, xlab="Time", 
     ylab="Energy Sub metering", type="n")
lines(sData$dateTime, sData$Sub_metering_1)
lines(sData$dateTime, sData$Sub_metering_2, col='red')
lines(sData$dateTime, sData$Sub_metering_3, col='blue')
legend("topright", cex=0.5, lwd=1, col=c('black', 'red', 'blue'), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Fourth subplot (of Global Reactive power)
plot(sData$dateTime, sData$Global_reactive_power, 
     main=NULL, xlab="Time", ylab="Global reactive power", type="l")
dev.off()