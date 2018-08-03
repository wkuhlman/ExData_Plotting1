# This script creates Plot 1 for Coursera "Exploratory Data Analysis"
# Peer-graded Assignment: Course Project 1

##Get the data from the web
## Uncomment the three lines below if you don't elready have 
## the file household_power_consumption.txt (it's a big file)
#  date_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#  download.file(data_url, "household_power_consumption.zip")
#  unzip("household_power_consumption.zip")

# Read in the data:
data <- read.delim("household_power_consumption.txt", sep=";", na.strings ="?", stringsAsFactors=FALSE)

# Fix the dates
data$Date2 <- as.Date(data$Date,format="%d/%m/%Y")

# Subset the data for the correct date range
start_date <- as.Date("2007-02-01")
end_date <- as.Date("2007-02-02")
plot_data <- subset(data, Date2 >= start_date & Date2 <= end_date)

# Generate the plot as a ".png" image file
png("plot1.png")
hist(plot_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowats)")
dev.off()