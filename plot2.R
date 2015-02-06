
# header true, NA valus is ?
datatbl = read.table("./data/household_power_consumption.txt", sep=";", header=T, quote= "", strip.white=TRUE, stringsAsFactors = F, na.strings= "?")

# Subsetting the full data to obtain the data related to two days: 
datasub =  subset(datatbl, (datatbl$Date == "1/2/2007" | datatbl$Date== "2/2/2007")) 

#change date format with greek locale settings becomes YYYY-MM-DD
datasub$Date = as.Date(datasub$Date,format="%d/%m/%Y")

#create new column DateTime concatenated the Date and Time columns with POSIXct conversion function
datasub$DateTime <- as.POSIXct(paste(datasub$Date, datasub$Time))

# creating Plot2 on the local directory
png("plot2.png", width=480, height= 480)

#using plot with lines (type=1), x axis the date time no label, y axis the active power,  default line width 
#x lables with greek language Sys.getlocale("LC_TIME") > [1] "Greek_Greece.1253"
Sys.setlocale("LC_ALL","english")

plot(datasub$DateTime, datasub$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")

#close device
dev.off()

