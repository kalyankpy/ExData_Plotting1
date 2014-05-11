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
png("plot2.png", 480,480)
plot(x=req_data$Time,y=as.numeric(as.character(req_data$Global_active_power)), 
     ylab="Global Active Power (kilowatts)", xlab="",
     type="l")
dev.off()
