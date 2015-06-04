#Plot2.R

setwd("~/Training/CourseraDataScience/4Exploratory/Week1")

quick <- read.table("./powerconsumption/household_power_consumption.txt", sep=";",  header=TRUE, stringsAsFactors = FALSE)


#subset the data based on dates in question
dataset <- quick[quick$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

dataset_dtm <- cbind(dataset, datetime)

dataset_dtm$Global_active_power <- as.numeric(dataset_dtm$Global_active_power)

png("plot3.png", width=480, height=480)

plot(dataset_dtm$datetime, dataset_dtm$Sub_metering_1, type = "l" ,ylab = "Energy sub Metering", xlab = "")
lines(dataset_dtm$datetime, dataset_dtm$Sub_metering_2, col="red")
lines(dataset_dtm$datetime, dataset_dtm$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
        