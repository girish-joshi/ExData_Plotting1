# Read data from the Power consumption file
# NOTE: Only the observations belonging to the dates 1-Feb-2007 and 2 Feb 2007 are read. Entire data is not read. The line numbers from the original file are used, so the original file should be used as is, without modification.

powerData<-read.table("household_power_consumption.txt",nrows=2880,check.names=FALSE,sep=";",skip=66637,header=FALSE)

# Rename the columns
names(powerData)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Start png device
png(file="plot1.png")

#Plot a histogram
hist(powerData$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")

#png device off and plot saved to the png file
dev.off()
