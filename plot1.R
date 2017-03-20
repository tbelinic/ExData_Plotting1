library(dplyr)
library(lubridate)
data<- read.table("./household_power_consumption.txt", skip=66637,nrows=2880, sep=";") 
data <- rename(data, Date=V1, Time=V2, Global_active_power=V3, Global_reactive_power=V4, Voltage=V5,
               Global_intensity=V6, Sub_metering_1=V7, Sub_metering_2=V8, Sub_metering_3=V9)

data$Time <- paste(data$Date, data$Time)
data$Time <- dmy_hms(data$Time)
data <- select(data, Time:Sub_metering_3)



## Plot 1
png(file="plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()