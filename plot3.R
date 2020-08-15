#Please pull all files from the repository before running this script

#Unzip the raw data file and reading it into R
unzip(zipfile = "./exdata_data_household_power_consumption.zip", exdir = "./Raw Data")
raw_data <- read.table(file = "./Raw Data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Subsetting required data
plot_data <- raw_data[raw_data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Making formatting changes
datetime <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(plot_data$Global_active_power)
submeter1 <- as.numeric(plot_data$Sub_metering_1)
submeter2 <- as.numeric(plot_data$Sub_metering_2)
submeter3 <- as.numeric(plot_data$Sub_metering_3)

#plotting the graph and exporting as png
png(filename = "plot3.png")
plot(datetime, submeter1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(datetime, submeter2, type = "l", col = "red")
lines(datetime, submeter3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, lty = 1, col = c("black", "red", "blue"))
dev.off()
