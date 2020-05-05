library(tidyverse)

Data <- read.table("./data/household_power_consumption.txt", sep = ";", 
                   header = TRUE, stringsAsFactors = FALSE)

#Datos que ocuparemos
Data <- Data[Data$Date == "1/2/2007" | Data$Date == "2/2/2007",]

#Convirtiendo a clases correspondientes
Data$Date <- Data$Date %>% paste(Data$Time) %>%
  strptime(format = "%d/%m/%Y %H:%M:%S")

Data[,3:9]<-sapply(Data[,3:9],as.numeric)


#Plot2
png(file = "plot2.png", width = 480, height = 480)

plot(Data$Date, Data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
