#Please pull all files from the repository before running this script

#Unzip the raw data file and reading it into R
unzip(zipfile = "./exdata_data_household_power_consumption.zip", exdir = "./Raw Data")
raw_data <- read.table(file = "./Raw Data/household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Subsetting required data
plot_data <- raw_data[raw_data$Date %in% c("1/2/2007", "2/2/2007"), ]

#Plotting histogram and exporting to current working directory as png
png(filename = "plot1.png")
hist(plot_data$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()