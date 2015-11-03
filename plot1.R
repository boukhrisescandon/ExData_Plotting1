## Read in the input data
input_data <- read.csv("household_power_consumption.txt", header = TRUE, 
                       sep = ";", na="?", colClasses=c("character", "character", 
                                                       "numeric", "numeric", "numeric", 
                                                       "numeric", "numeric", "numeric", "numeric"))


## Save the data as a data frame and subset it to get the days of interest
day_data.df <- data.frame(input_data)
day_data <- subset(day_data.df, day_data.df$Date == "1/2/2007" | day_data.df$Date == "2/2/2007")


## Create the plot and save it as a PNG
png("plot1.png", width=480, height=480)
hist(day_data$Global_active_power, 
     col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()