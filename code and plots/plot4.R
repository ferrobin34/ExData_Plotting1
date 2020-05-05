library(tidyverse)

Data <- read.table("./data/household_power_consumption.txt", sep = ";", 
                   header = TRUE, stringsAsFactors = FALSE)

#Datos que ocuparemos
Data <- Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007",]

#Convirtiendo a clases correspondientes
Data$Date <- Data$Date %>% paste(Data$Time) %>%
  strptime(format = "%d/%m/%Y %H:%M:%S")

Data[,3:9]<-sapply(Data[,3:9],as.numeric)

#Plot4
png(file = "plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2), mar = c(4,4,2,2) )
##Parte 1
plot(Data$Date, Data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
##Parte 2
plot(Data$Date, Data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")
##Parte 3
plot(Data$Date, Data$Sub_metering_1, col = "black", type = "l",
     xlab = "", ylab = "Energy sub metering")
points(Data$Date, Data$Sub_metering_2, col = "red", type = "l")
points(Data$Date, Data$Sub_metering_3, col = "blue", type = "l")
legend("topright",lty = 1 ,col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##Parte 4
with(Data,plot(Date,Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()

