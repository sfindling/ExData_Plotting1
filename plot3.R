################
# plot3.R
################
# Serge Findling
# Spring, Texas - May 2014
#=========================================================================================
# The dataset is located at:
#   https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#
# * Download the dataset
# * Unzip the dataset and copy it in your working directory
# 
# You should see "household_power_consumption.txt" r in your working directory
#
# You may want to set your working directory using setwd()
#
# This script will produce a graph on the screen and also generate a png file "plot3.png" in the working directory.
#=========================================================================================

# Check if "household_power_consumption.txt" file exist or not
if(!file.exists("household_power_consumption.txt")) {print("household_power_consumption.txt not found !!!")}

# Reading data
Consumption=read.table("household_power_consumption.txt",sep=";",skip = 66637, nrow = 2880)
colnames(Consumption) = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";"))

# Preparation
Xdate=as.Date(Consumption$Date,format="%d/%m/%Y")
Xtime=Consumption$Time
x <- paste(Xdate, Xtime)
Xdatetime=strptime(x, "%Y-%m-%d %H:%M:%S")

# Plot the graph
plot(Xdatetime, Consumption$Sub_metering_1,type="l",xlab="",ylab="Global Active Power (kilowatts)",oma = c(0, 0, 2, 0))
lines(Xdatetime, Consumption$Sub_metering_2, col="red")
lines(Xdatetime, Consumption$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1  ", "Sub_metering_2  ","Sub_metering_3  "),cex=1)
text(1170297068,42,"Plot 3",xpd=NA, cex=2)

#Create and save png file
png(filename = "plot3.png")
plot(Xdatetime, Consumption$Sub_metering_1,type="l",xlab="",ylab="Global Active Power (kilowatts)",oma = c(0, 0, 2, 0))
lines(Xdatetime, Consumption$Sub_metering_2, col="red")
lines(Xdatetime, Consumption$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1  ", "Sub_metering_2  ","Sub_metering_3  "),cex=1)
text(1170297068,42,"Plot 3",xpd=NA, cex=2)
dev.off() 
