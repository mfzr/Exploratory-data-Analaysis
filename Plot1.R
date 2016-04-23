# load data set into variable
input_reader <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
input_reader$Date <- as.Date(input_reader$Date, format="%d/%m/%Y")

# categories data
selection <- subset(input_reader, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Using function form text into date and time
dateandtime <- paste(as.Date(selection$Date), selection$Time)
selection$datetime <- as.POSIXct(dateandtime)

# generating histogram graph 
hist(selection$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#save as png file format
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()