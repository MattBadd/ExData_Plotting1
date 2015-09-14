

readfile <- function () {
    hpc <- subset(read.delim("household_power_consumption.txt",sep=";",na.strings="?",stringsAsFactors = FALSE), 
           Date == "1/2/2007" | Date == "2/2/2007")
    hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time), format="%d/%m/%Y %H:%M:%S" )
    hpc
}


hpc <- readfile()
png("plot4.png")

par(mfrow=c(2,2))

## First Plot
plot(hpc$DateTime,
     hpc$Global_active_power,
     type="l",
     xlab = "",
     ylab="Global Active Power (kilowatts)"
)

## Second Plot
plot(hpc$DateTime,
     hpc$Voltage,
     type="l",
     xlab = "DateTime",
     ylab="Voltage"
)

## Third Plot
with(hpc,plot(DateTime,Sub_metering_1,ylab="Energy sub metering",xlab="",type="l"))
with(hpc,lines(DateTime,Sub_metering_2,col="red"))
with(hpc,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty="solid")

## Fourth Plot
plot(hpc$DateTime,
     hpc$Global_reactive_power,
     type="l",
     xlab = "DateTime",
     ylab="Global Reactive Power (kilowatts)"
)

dev.off()