# Exploratory Data analysis
#Project1, graph 3, 
#  Peter Olsen, 10/2015
rm(list=ls())
e.df <- read.table("data/household_power_consumption.txt", 
                   sep = ";",
                   header = TRUE,
                   na.strings = c("?",""))
subdf <- subset(e.df, ( Date %in% c("1/2/2007","2/2/2007")))


#as.character(econsumesub$Date)

D <- strptime(subdf$Date, "%d/%m/%Y")

subdf$dateTime <- as.POSIXct(paste(D, subdf$Time), format="%Y-%m-%d %H:%M:%S")

png(file = "proj1/ExData_Plotting1/plot3.png", width = 480, height = 480)

plot(subdf$dateTime, subdf$Sub_metering_1, xlab = "", ylab =  "Energy sub Metering", type="l")
lines(subdf$dateTime, subdf$Sub_metering_2, col = "red")
lines(subdf$dateTime, subdf$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1",
                                                                        "Sub_metering_2",
                                                                        "Sub_metering_3"))

dev.off()