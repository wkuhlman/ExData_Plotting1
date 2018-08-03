# This script creates Plot 4 for Coursera "Exploratory Data Analysis"
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
png("plot4.png")
daterange=seq(start_date,end_date,length.out=3)
par(mfrow=c(2,2))
plot(plot_data$Date2,plot_data$Global_active_power,type="l", xlab="", ylab="Global Active Power (kilowats)");
plot(plot_data$Date2,plot_data$Voltage,type="l", xlab="", ylab="Voltage");
plot(plot_data$Date2,plot_data$Sub_metering_1,type="l", xlab="", ylab="Energy sub metering");
lines(plot_data$Date2,plot_data$Sub_metering_2,col="red")
lines(plot_data$Date2,plot_data$Sub_metering_3,col="blue")
axis.POSIXct(1, at=daterange,labels=format(daterange, "%a"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col=c("black","red", "blue"), lty=1)
plot(plot_data$Date2,plot_data$Global_reactive_power,type="l", xlab="", ylab="Global Reactive Power (kilowats)");
dev.off()
