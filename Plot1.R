setwd("~/Training/CourseraDataScience/4Exploratory/Week1")

quick <- read.table("./powerconsumption/household_power_consumption.txt", sep=";",  header=TRUE, stringsAsFactors = FALSE)


#subset the data based on dates in question
dataset <- quick[quick$Date %in% c("1/2/2007","2/2/2007") ,]

dataset$Global_active_power <- as.numeric(dataset$Global_active_power)

png("plot1.png", width=480, height=480)

hist(dataset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power" )

dev.off()