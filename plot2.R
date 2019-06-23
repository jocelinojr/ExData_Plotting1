library(tidyverse)

# previously, I've changed the type of the file to a csv to make it easier to read in

#reading the file as a .csv 
hpower <- read.csv(file = "household_power_consumption.csv", sep = ";")
# looking at the data
glimpse(hpower_filter)


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

# Makes the Plot 2
plot(x = hpower_filter$date_time, 
     y = hpowers$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowats)")

dev.copy(png, file="plot2.png")

dev.off()




# Plot 3
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

dev.copy(png, file="plot3.png")

dev.off()



# Plot 4
par(mfrow = c(2,2))
plot(x = hpower_filter$date_time, 
     y = hpowers$Global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowats)")


plot(x = hpower_filter$date_time, 
     y = hpowers$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")


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


with(hpower_filter, plot(hpower_filter$date_time, 
                         Global_reactive_power,
                         type = "l",
                         xlab = "datetime",
                         ylab = "Global_reactive_power"))

dev.copy(png, file="plot5.png")

dev.off()


