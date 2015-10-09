# Exploratory Data analysis
#Project1, graph 1, 
#  Peter Olsen, 10/2015

rm(list=ls())

if(!file.exists("data")){
        dir.create("data")
}

e.df <- read.table("data/household_power_consumption.txt", 
                   sep = ";",
                   header = TRUE,
                   na.strings = c("?",""))
subdf <- subset(e.df, ( Date %in% c("1/2/2007","2/2/2007")))

png(file = "proj1/ExData_Plotting1/plot1.png", width = 480, height = 480)
hist(as.numeric(subdf$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
