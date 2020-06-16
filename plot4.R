# Load packages
library(lubridate)
library(dplyr)

# Load the data
pow_data <- read.csv("E:/Coursera/Data Science-Foundations with R - JHU/4/ExData_Plotting1/household_power_consumption.txt", sep=";")

# Subset and transform the data
pow_data$Date <- dmy(pow_data$Date)
pdata <- pow_data %>% filter(Date %in% as.Date(c("2007-02-01", "2007-02-02")))

for(i in 3:9) {
      pdata[, i] <- as.numeric(pdata[, i])
}

# Create PNG file
png(filename = "plot4.png", width = 480, height = 480, 
    units = "px", pointsize = 12, bg = "white")
# Draw
par(mfrow = c(2, 2))

plot(datetime, pdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(datetime, pdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, pdata$Sub_metering_1, type = "l", col = "black", 
     xlab="", ylab="Energy sub metering")
lines(datetime, pdata$Sub_metering_2, type = "l", col = "red")
lines(datetime, pdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), 
       bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(datetime, pdata$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()