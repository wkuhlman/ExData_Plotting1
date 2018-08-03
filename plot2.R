# This script creates Plot 2 for Coursera "Exploratory Data Analysis"
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
data$Date2 <-  strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")

# Subset the data for the correct date range
end_date <- strptime("03/02/2007 00:00:00",format="%d/%m/%Y %H:%M:%S")
start_date <- strptime("01/02/2007 00:00:00",format="%d/%m/%Y %H:%M:%S")  ## midnight on the day after
plot_data <- subset(data, Date2 >= start_date & Date2 < end_date)

# Generate the plot as a ".png" image file
png("plot2.png")
daterange=seq(start_date,end_date,length.out=3)

plot(plot_data$Date2,plot_data$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowats)");
axis.POSIXct(1, at=daterange,labels=format(daterange, "%a"))
dev.off()