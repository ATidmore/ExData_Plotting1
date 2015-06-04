#Plot2.R

setwd("~/Training/CourseraDataScience/4Exploratory/Week1")

quick <- read.table("./powerconsumption/household_power_consumption.txt", sep=";",  header=TRUE, stringsAsFactors = FALSE)


#subset the data based on dates in question
dataset <- quick[quick$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

dataset_dtm <- cbind(dataset, datetime)

dataset_dtm$Global_active_power <- as.numeric(dataset_dtm$Global_active_power)
dataset_dtm$Global_reactive_power <- as.numeric(dataset_dtm$Global_reactive_power)
dataset_dtm$Voltage <- as.numeric(dataset_dtm$Voltage)
dataset_dtm$Sub_metering_1 <- as.numeric(dataset_dtm$Sub_metering_1)
dataset_dtm$Sub_metering_2 <- as.numeric(dataset_dtm$Sub_metering_2)
dataset_dtm$Sub_metering_3 <- as.numeric(dataset_dtm$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow =c(2,2))

plot(dataset_dtm$datetime, dataset_dtm$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dataset_dtm$datetime, dataset_dtm$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dataset_dtm$datetime, dataset_dtm$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dataset_dtm$datetime, dataset_dtm$Sub_metering_2, type="l", col="red")
lines(dataset_dtm$datetime, dataset_dtm$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dataset_dtm$datetime, dataset_dtm$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
