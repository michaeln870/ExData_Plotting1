#Plot 2

#Loading data and subsetting relevent rows
hpc_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc_data$Date <- as.Date(hpc_data$Date, "%d/%m/%Y")
hpc <- subset(hpc_data, (hpc_data$Date == as.Date("2007-02-01")
                         | hpc_data$Date == as.Date("2007-02-02")))
#Extracting date and time as a single vector
datetime <- as.POSIXct(paste(hpc$Date, hpc$Time))

#Plotting and saving onto png
png(file = "plot2.png")
plot(datetime, hpc$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (Kilowatts)",)
dev.off()