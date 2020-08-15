#Please pull all files from the repository before running this script

#Unzip the raw data file and reading it into R
unzip(zipfile = "./exdata_data_household_power_consumption.zip", exdir = "./Raw Data")
raw_data <- read.table(file = "./Raw Data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Subsetting required data
plot_data <- raw_data[raw_data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Making formatting changes
datetime <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(plot_data$Global_active_power)

#plotting line graph and exporting as png
png(filename = "plot2.png")
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
