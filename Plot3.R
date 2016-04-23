# load data set into variable
insert <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
insert$Date <- as.Date(insert$Date, format="%d/%m/%Y")

# categories data
selection <- subset(insert, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Using function form text into date and time
dateandtime <- paste(as.Date(selection$Date), selection$Time)
selection$Datetime <- as.POSIXct(dateandtime)

## generating plot graph for Energy sub metering
with(selection, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#saving as png file format
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()