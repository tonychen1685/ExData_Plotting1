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

# Create four files
for(i in 1:4) {
      file_name <- paste("plot", i, ".R", sep = "")
      file.create(file_name)
}
