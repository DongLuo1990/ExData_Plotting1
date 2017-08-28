file <- "household_power_consumption/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", na.strings = "?",stringsAsFactors = FALSE)
datause <- subset(data, Date == "1/2/2007" | Date == "2/2/2007") # subset the data for use
#datause$Date <- as.Date(datause$Date, format = "%d/%m/%Y")
#datause$Time <- strptime(datause$Time, format = "%H:%M:%S")
datause$Datetime <- paste(datause$Date,datause$Time)
datause$Datetime <- strptime(datause$Datetime, format = "%d/%m/%Y %H:%M:%S")
png(filename = "plot1.png")
hist(datause$Global_active_power, col = "red", xlab = "Global Active Power 
     (kilowatts)", main = "Global Active Power")
dev.off()
