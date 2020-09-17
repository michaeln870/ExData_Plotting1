#Plot 4

#Loading data and subsetting relevent rows
hpc_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc_data$Date <- as.Date(hpc_data$Date, "%d/%m/%Y")
hpc <- subset(hpc_data, (hpc_data$Date == as.Date("2007-02-01")
                         | hpc_data$Date == as.Date("2007-02-02")))

#Extracting date and time as a single vector
datetime <- as.POSIXct(paste(hpc$Date, hpc$Time))

png(file = "plot4.png")
par(mfcol = c(2,2))

#plot 1 (from plot2.R)
plot(datetime, hpc$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)",)

#plot 2 (from plot3.R)
plot(datetime, hpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering",)
lines(datetime, hpc$Sub_metering_2, type = "l", xlab = "", col = "red",)
lines(datetime, hpc$Sub_metering_3, type = "l", xlab = "", col = "blue",)
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1),  col=c("black","red","blue"),  bty = "n")

#plot 3
plot(datetime, hpc$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage",)

#plot 4
plot(datetime, hpc$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power",)

dev.off()