
# header true, NA valus is ?
datatbl = read.table("./data/household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
datasub =  subset(datatbl, (datatbl$Date == "1/2/2007" | datatbl$Date== "2/2/2007")) 

#change date format with greek locale settings becomes YYYY-MM-DD
datasub$Date = as.Date(datasub$Date,format="%d/%m/%Y")

#create new column DateTime concatenated the Date and Time columns with POSIXct conversion function
datasub$DateTime <- as.POSIXct(paste(datasub$Date, datasub$Time))

# creating Plot3 on the local directory
png("plot3.png", width=480, height= 480)



#using plot with lines (type=1), x axis the date time no label, y axis energy sub metering,  default line width, line type solid

#x labelss with greek language Sys.getlocale("LC_TIME") > [1] "Greek_Greece.1253", change local seeting to english
Sys.setlocale("LC_ALL","english")

plot(datasub$DateTime, datasub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")

lines(datasub$DateTime, datasub$Sub_metering_2, type="l", col="red")

lines(datasub$DateTime, datasub$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))


#close device
dev.off()


#s1=Sys.getlocale("LC_TIME")
#d1=Sys.time()
#Sys.setlocale("LC_TIME","english")
#d2=Sys.time()
#print(d1)
#print(d2)
#cat("\n....difference is:",d2-d1)
#Sys.setlocale("LC_TIME","greek")



