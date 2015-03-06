
# Read data from the Power consumption file
# NOTE: Only the observations belonging to the dates 1-Feb-2007 and 2 Feb 2007 are read. Entire data is not read. The line numbers from the original file are used, so the original file should be used as is, without modification.

powerData<-read.table("household_power_consumption.txt",nrows=2880,check.names=FALSE,sep=";",skip=66637,header=FALSE)

# Rename the columns
names(powerData)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#Create a vector with Date and Time variable
DateVal<-as.POSIXct(strptime(paste(powerData$Date,powerData$Time),"%d/%m/%Y %H:%M:%S"))

#Add Weekday and the Data and Time variable to the Data frame
powerData$Day<-weekdays(DateVal)
powerData$DateTime<-DateVal

#Start png device
png(file="plot2.png")

#Create the plot
plot(powerData$DateTime,powerData$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab="")


#png device off and plot saved to the png file
dev.off()
