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
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)


## create day of week (DOW) field
## data$dow <- weekdays(data$datetime, abbreviate = T)

## plot the data
png("plot3.png", width=480, height=480)

plot(data$datetime, data$Sub_metering_1, type="l", main="", xlab="",
     ylab="Energy sub metering" )
lines(data$datetime, data$Sub_metering_2, type="l", col="red")
lines(data$datetime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
