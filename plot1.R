## Plot 1

#Loading data and subsetting relevent rows
hpc_data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc_data$Date <- as.Date(hpc_data$Date, "%d/%m/%Y")
hpc <- subset(hpc_data, (hpc_data$Date == as.Date("2007-02-01")
                         | hpc_data$Date == as.Date("2007-02-02")))

#Plotting and saving onto png
png(file = "plot1.png")
hist(hpc$Global_active_power,
     col = "red",
     main = "Global Active Power", 
     xlab = "Global Active power (kilowatts)")
dev.off()