# Exploratory Data analysis
#Project1, graph 4, 
#  Peter Olsen, 10/2015
rm(list=ls())
e.df <- read.table("data/household_power_consumption.txt", 
                   sep = ";",
                   header = TRUE,
                   na.strings = c("?",""))
subdf <- subset(e.df, ( Date %in% c("1/2/2007","2/2/2007")))

D <- strptime(subdf$Date, "%d/%m/%Y")
subdf$dateTime <- as.POSIXct(paste(D, subdf$Time), format="%Y-%m-%d %H:%M:%S")

png( "proj1/ExData_Plotting1/plot4.png", width = 480, height = 480)
#png("proj1/ExData_Plotting1/Plot4.png", width = 480, height=480, type="window")
par(mfrow = c(2,2))  #mar  # oma

#row 1, column 1
plot(subdf$dateTime, subdf$Global_active_power, xlab = "", ylab =  "Global Active Power (kilowatts)", type="l")

#row 1, column 2

plot(subdf$dateTime, subdf$Voltage, pch = "|", ylab = "Voltage", xlab = "datetime")

#row 2, column 1
plot(subdf$dateTime, subdf$Sub_metering_1, xlab = "", ylab =  "Energy sub Metering", type="l")
lines(subdf$dateTime, subdf$Sub_metering_2, col = "red")
lines(subdf$dateTime, subdf$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1",
                                                                        "Sub_metering_2",
                                                                        "Sub_metering_3"))

#row 2, Column 2
plot(subdf$dateTime, subdf$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()