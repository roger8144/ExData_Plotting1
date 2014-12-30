
# Set the working directory to the directory where the data is saved
setwd("/roger/Coursera/Exploratory_Analysis")

# Read in all data from .txt file
data <- read.table("household_power_consumption.txt", header = T, sep = ";", 
                   stringsAsFactors = F)

# Convert "Date" column of the date frame from factor class into Date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subsetting the data between 02/01/2007 and 02/02/2007
dataSubset <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# plot the histogram of Global Active Power
hist(as.numeric(dataSubset$Global_active_power), main = "Global Active Power", 
     col = "Red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

