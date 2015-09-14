

readfile <- function () {
    hpc <- subset(read.delim("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors = FALSE), 
           Date == "1/2/2007" | Date == "2/2/2007")
    hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time), format="%d/%m/%Y %H:%M:%S" )
    hpc
}

hpc <- readfile()
png("plot1.png")
hist(hpc$Global_active_power,
     col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")
dev.off()