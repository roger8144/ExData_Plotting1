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

# Plot3: plotting sub_metering_1, sub_metering_2, and sub_metering3 as a 
# function of weekdays in the same plot
png("plot3.png", height = 480, width = 480)
par(mar = c(4.5, 4.5, 1.5, 1.5))
plot(datetime, as.numeric(dataSubset$Sub_metering_1), type = "l", col = "Black",
     ylab = "Energy sub metering", xlab = "")
lines(datetime, as.numeric(dataSubset$Sub_metering_2), type = "l", col = "Red")
lines(datetime, as.numeric(dataSubset$Sub_metering_3), type = "l", col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("Black", "Red", "Blue"), lty = 1, lwd = 1)
dev.off()