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

## plot the data
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()


hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()