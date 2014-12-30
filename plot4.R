# Set the working directory to the directory where the data is saved
setwd("/roger/Coursera/Exploratory_Analysis/ExData_Plotting1")

# Read in all data from .txt file
data <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                   stringsAsFactors = F)

# Convert "Date" column of the date frame from factor class into Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subsetting the data between 02/01/2007 and 02/02/2007
dataSubset <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert the date and time into POSIXct class
datetime <- strptime(paste(dataSubset$Date, dataSubset$Time), "%Y-%m-%d %H:%M:%S")

# Plot4: plotting 4 subplots
png("plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 2))
plot(datetime, as.numeric(dataSubset$Global_active_power), type = "l", 
     xlab = "", ylab = "Global Active Power")
plot(datetime, as.numeric(dataSubset$Voltage), type = "l", ylab = "Voltage")
plot(datetime, as.numeric(dataSubset$Sub_metering_1), type = "l", col = "Black", 
     xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(dataSubset$Sub_metering_2), col = "Red")
lines(datetime, as.numeric(dataSubset$Sub_metering_3), col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("Black", "Red", "Blue"), lty = 1, lwd = 1, bty = "n")
plot(datetime, as.numeric(dataSubset$Global_reactive_power), type = "l",
     ylab = "Global_reactive_power")
dev.off()

