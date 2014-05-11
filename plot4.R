# This script reads the coursera dataset for programming assignment 1 and creates plot as needed

setwd("/home/kalyankpy/Dropbox/coursera/ExData_Plotting1/")
# Read the complete dataset
data<-read.delim("../household_power_consumption.txt", header=T, sep=";")
# Convert the time and data into respective classes
data$Time<-strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")
# Extract the data for two days
req_rows<-data$Date==as.Date("2007-02-01") | data$Date==as.Date("2007-02-02")
req_data<-data[req_rows,]
# Initiate the png device and save the plot, close the device
png("plot4.png", 480,480)
par(mfrow=c(2,2))
plot(x=req_data$Time,y=as.numeric(as.character(req_data$Global_active_power)), 
     ylab="Global Active Power", xlab="",
     type="l")
plot(x=req_data$Time, y=as.numeric(as.character(req_data$Voltage)),
     ylab="Voltage",
     xlab="datetime",
     type="l")

req_data$Sub_metering_1<-as.numeric(as.character(req_data$Sub_metering_1))
req_data$Sub_metering_2<-as.numeric(as.character(req_data$Sub_metering_2))
req_data$Sub_metering_3<-as.numeric(as.character(req_data$Sub_metering_3))

# Initiate the png device and save the plot, close the device
plot(x=req_data$Time,y=req_data$Sub_metering_1, ylab="Energy Submetering",type="n")
lines(req_data$Time, req_data$Sub_metering_1, col="black")
lines(req_data$Time, req_data$Sub_metering_2, col="red")
lines(req_data$Time, req_data$Sub_metering_3, col="blue")

plot(x=req_data$Time,y=as.numeric(as.character(req_data$Global_reactive_power)), 
     ylab="Global Reactive Power", xlab="datetime",
     type="l")
dev.off()
