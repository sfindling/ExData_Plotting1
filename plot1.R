################
# plot1.R
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
# This script will produce a graph on the screen and also generate a png file "plot1.png" in the working directory.
#
#=========================================================================================

# Check if "household_power_consumption.txt" file exist or not
if(!file.exists("household_power_consumption.txt")) {print("household_power_consumption.txt not found !!!")}

# Reading data
Consumption=read.table("household_power_consumption.txt",sep=";",skip = 66637, nrow = 2880)
colnames(Consumption) = colnames(read.table("household_power_consumption.txt",nrow = 1, header = TRUE, sep=";"))

# Drawing histogram
hist(Consumption$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1300))
text(-0.7,1550,"Plot 1",xpd=NA, cex=2)

#png()
png(filename = "plot1.png")
hist(Consumption$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)",ylim=c(0,1300))
text(-0.7,1550,"Plot 1",xpd=NA, cex=2)
dev.off() 
