file <- "household_power_consumption/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)
datause <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") # subset the data for use
#datause$Date <- as.Date(datause$Date, format = "%d/%m/%Y")
#datause$Time <- strptime(datause$Time, format = "%H:%M:%S")
datause$Datetime <- paste(datause$Date,datause$Time)
datause$Datetime <- strptime(datause$Datetime, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot2.png")
par(mar = c(2,5,2,2))
tickposition <- seq(1, nrow(datause), length.out = 3)
plot(datause$Global_active_power, type = "l", xaxt = "n", col = "black",xlab = "", ylab = 
    "Global Active Power (kilowatts)")
axis(1,at = tickposition, labels = c("Thu","Fri","Sat"))
dev.off()
