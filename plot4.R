## set working directory
setwd("C:/MOOC/ExploreatoryDataAnalysis")

## read file
tmp <- read.csv("household_power_consumption.txt", sep=';', dec=".", stringsAsFactors = F)

## create date time field
tmp$datetime <- strptime(paste(as.Date(tmp$Date, "%d/%m/%Y"), tmp$Time),
                         format="%Y-%m-%d %H:%M:%S", tz="")

## convert to date field
tmp$Date <- as.Date(tmp$Date, format="%d/%m/%Y")

## filter not relevant date transactions
data <- tmp[tmp$Date >= "2007-02-01" & tmp$Date <= "2007-02-02",]

## convert field to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)


## create day of week (DOW) field
## data$dow <- weekdays(data$datetime, abbreviate = T)

## plot the data
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(data$datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data$datetime, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(data$datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()
