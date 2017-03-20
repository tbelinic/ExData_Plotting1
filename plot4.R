library(dplyr)
library(lubridate)
data<- read.table("./household_power_consumption.txt", skip=66637,nrows=2880, sep=";") 
data <- rename(data, Date=V1, Time=V2, Global_active_power=V3, Global_reactive_power=V4, Voltage=V5,
               Global_intensity=V6, Sub_metering_1=V7, Sub_metering_2=V8, Sub_metering_3=V9)

data$Time <- paste(data$Date, data$Time)
data$Time <- dmy_hms(data$Time)
data <- select(data, Time:Sub_metering_3)


## Plot 4
png(file="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
plot(data$Time, data$Global_active_power, xlab="",ylab="Global Active Power", type="n") 
lines(data$Time, data$Global_active_power)

plot(data$Time, data$Voltage, xlab="datetime", ylab="Voltage", type="n") 
lines(data$Time, data$Voltage)

with(data, plot(Time, Sub_metering_1, xlab="", ylab = "Energy sub metering", type="n"))  
with(data, lines(Time, Sub_metering_1, col="black"))
with(data, lines(Time, Sub_metering_2, col="red"))
with(data, lines(Time, Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(data$Time, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="n") 
lines(data$Time, data$Global_reactive_power)
dev.off()