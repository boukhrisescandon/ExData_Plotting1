## Read in the input data
input_data <- read.csv("household_power_consumption.txt", header = TRUE, 
                       sep = ";", na="?", colClasses=c("character", "character", 
                                                       "numeric", "numeric", "numeric", 
                                                       "numeric", "numeric", "numeric", "numeric"))


## Save the data as a data frame and subset it to get the days of interest
day_data.df <- data.frame(input_data)
day_data <- subset(day_data.df, day_data.df$Date == "1/2/2007" | day_data.df$Date == "2/2/2007")

## Convert the time so that it can be plotted 
time <- strptime(paste(day_data$Date, day_data$Time), "%d/%m/%Y %H:%M:%S")

## Create the plot and save it as a PNG
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
with(day_data, {
  
  plot(time, day_data$Global_active_power, type = "l", xlab= "", ylab = "Global Active Power", main = "")
  
  plot(time, day_data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", main = "")
  
  plot(time, day_data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
  lines(time, day_data$Sub_metering_2, col = "red")
  lines(time, day_data$Sub_metering_3, col = "blue")
  legend("topright", lty=1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(time, day_data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", main = "")
})
dev.off()
