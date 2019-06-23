
#reading the file 
#reading the file 
hpower <- read.table("household_power_consumption.txt", 
                     header = TRUE, 
                     sep=";", 
                     na.strings = "?")


# type casting the data types
hpower$Date <- as.Date(hpower$Date, "%d/%m/%Y")
# filtering only the rows we want
hpower_filter <-  subset(hpower, between(Date, left = as.Date("2007-02-01"), 
                                   right = as.Date("2007-02-02")))

hpower_filter$date_time <-  paste(as.character(hpower_filter$Date), as.character(levels(hpower$Time)))

# type casting the data types
hpower_filter$Global_active_power <- as.numeric(as.character(hpower_filter$Global_active_power))  
hpower_filter$Global_reactive_power <- as.numeric(as.character(hpower_filter$Global_reactive_power))
hpower_filter$Voltage <- as.numeric(as.character(hpower_filter$Voltage))
hpower_filter$Global_intensity <- as.numeric(as.character(hpower_filter$Global_intensity))
hpower_filter$Sub_metering_1 <- as.numeric(as.character(hpower_filter$Sub_metering_1))
hpower_filter$Sub_metering_2 <- as.numeric(as.character(hpower_filter$Sub_metering_2))
hpower_filter$Sub_metering_3 <- as.numeric(as.character(hpower_filter$Sub_metering_3))
hpower_filter$date_time <- as.POSIXct(hpower_filter$date_time)

# Makes the Plot 3

with(hpower_filter, plot(hpower_filter$date_time, 
                         Sub_metering_1,
                         type = "l",
                         xlab = "",
                         ylab = "Energy sub Mtering"))
lines(hpower_filter$date_time, 
      hpower_filter$Sub_metering_2,
      col="red")

lines(hpower_filter$date_time, 
      hpower_filter$Sub_metering_3,
      col="blue")

legend("topright", pch = "________", 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", width=480, height=480)

dev.off()





