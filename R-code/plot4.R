
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

png(file="plot4.png")

#We need to create 4 plots with 2 rows and 2 columns structure
par(mfrow = c(2,2))

#First plot
plot(powerData$DateTime,powerData$Global_active_power,type="l",ylab="Global Active Power", xlab="")

#Second plot
plot(powerData$DateTime,powerData$Voltage,type="l",ylab="Voltage", xlab="datetime")

#Third plot along with annotations and legend

plot(powerData$DateTime,powerData$Sub_metering_1,type="l",ylab="Energy sub metering", xlab="")

lines(powerData$DateTime,powerData$Sub_metering_2,type="l",col="red")
lines(powerData$DateTime,powerData$Sub_metering_3,type="l",col="blue")

legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=1,bty="n")

#Fourth plot

plot(powerData$DateTime,powerData$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")


#png device off and plot saved to the png file
dev.off()
