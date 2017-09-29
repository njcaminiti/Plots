library(dplyr, lubridate)

download.file(
  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
  destfile = "power.zip")

unzip("power.zip")
file.remove("power.zip")


power <- read.csv2("household_power_consumption.txt", 
                   header = TRUE, dec = ".", na.strings = "?", 
                   stringsAsFactors = FALSE)

pow <- (subset(power, Date == "1/2/2007" | Date == "2/2/2007")) 
rm(power)

png(file = "plot4.png")
par(mfrow = c(2,2))

plot(pow$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power") 
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

plot(pow$Voltage, type = "l", xaxt = "n", xlab = "datetime", 
     ylab = "Voltage")
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

plot(pow$Sub_metering_1, type = "l", xaxt = "n", xlab = "", 
     ylab = "Energy Sub Metering")
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", 
                              "Sub_Metering_3"), 
       lty = 1, col = c("black", "red", "blue"))

lines(pow$Sub_metering_2, col = "red")
lines(pow$Sub_metering_3, col = "blue")

plot(pow$Global_reactive_power, type = "l", xaxt = "n", xlab = "datetime", 
     ylab = "Global_reactive_power")
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.off()
