

readfile <- function () {
    hpc <- subset(read.delim("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors = FALSE), 
           Date == "1/2/2007" | Date == "2/2/2007")
    hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time), format="%d/%m/%Y %H:%M:%S" )
    hpc
}

hpc <- readfile()
png("plot2.png")
plot(hpc$DateTime,
     hpc$Global_active_power,
     type="l",
     xlab = "",
     ylab="Global Active Power (kilowatts)"
     )

dev.off()