library(dplyr)
library(lubridate)

download.file(
  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
  destfile = "power.zip")

unzip("power.zip")
file.remove("power.zip")


power <- read.csv2("household_power_consumption.txt", 
                   header = TRUE, dec = ".", na.strings = "?", 
                   stringsAsFactors = FALSE)

pow <- (subset(power, Date == "1/2/2007" | Date == "2/2/2007")) %>%
  mutate(Date = dmy(Date)) 
rm(power)

png(file = "plot2.png")

plot(pow$Global_active_power, type = "l", xaxt = "n", xlab = "", ylab = "Global Active Power (kilowatts)") 
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
dev.off()