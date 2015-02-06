
# header true, NA valus is ?
datatbl = read.table("./data/household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
datasub =  subset(datatbl, (datatbl$Date == "1/2/2007" | datatbl$Date== "2/2/2007")) 

#change date format with greek locale settings becomes YYYY-MM-DD
datasub$Date = as.Date(datasub$Date,format="%d/%m/%Y")

#create new column DateTime concatenated the Date and Time columns with POSIXct conversion function
datasub$DateTime <- as.POSIXct(paste(datasub$Date, datasub$Time))

# creating Plot3 on the local directory
png("plot4.png", width=480, height= 480)



#using plot with lines (type=1), x axis the date time no label, y axis energy sub metering,  default line width, line type solid

#x labelss with greek language Sys.getlocale("LC_TIME") > [1] "Greek_Greece.1253", change local seeting to english
Sys.setlocale("LC_ALL","english")

# divide the plot into four sections
par(mfrow=c(2,2)) 
# top left section
plot(datasub$DateTime, datasub$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 

# top right section
plot(datasub$DateTime, datasub$Voltage, type="l", xlab="datetime", ylab="Voltage")   

# bottom left section
plot(datasub$DateTime, datasub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(datasub$DateTime, datasub$Sub_metering_2, type="l", col="red")
lines(datasub$DateTime, datasub$Sub_metering_3, type="l", col="blue")
#turn off the box bty=n around the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) 

# bottom right section
plot(datasub$DateTime, datasub$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  




#close device
dev.off()

