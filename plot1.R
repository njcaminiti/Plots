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

png(file = "plot1.png")

hist(pow$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()

