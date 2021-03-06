#Setup - done once in memory, repeat in every file but don't re-run
setwd("C:/Users/jadetooth/Desktop/Proj1")
full <- read.csv("household_power_consumption.txt", sep=";")
full$Date <- as.Date(full$Date, format="%d/%m/%Y")
elec <- subset(full, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
elec$Time <- strptime(paste(elec$Date," ", elec$Time), "%Y-%m-%d %H:%M:%S")

#Generate Plot
png(filename="plot4.png", width=480, height=480, units = "px", bg="transparent")

par(mfrow=c(2, 2))

plot(x=elec$Time, y=as.numeric(as.character(elec$Global_active_power)), 
     type="l",
     xlab="",
     ylab="Global Active Power")

plot(x=elec$Time, y=as.numeric(as.character(elec$Voltage)), 
     type="l",
     xlab="datetime",
     ylab="Voltage")

plot(x=elec$Time, y=as.numeric(as.character(elec$Sub_metering_1)), 
     type="n",
     xlab="",
     ylab="Energy sub metering")
lines(x=elec$Time, y=as.numeric(as.character(elec$Sub_metering_1)), col="black")
lines(x=elec$Time, y=as.numeric(as.character(elec$Sub_metering_2)), col="red")
lines(x=elec$Time, y=as.numeric(as.character(elec$Sub_metering_3)), col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty="solid", col=c("black", "red", "blue"), bty="n" )


plot(x=elec$Time, y=as.numeric(as.character(elec$Global_reactive_power)), 
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()