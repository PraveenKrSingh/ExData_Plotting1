
               #reading the data
a<-read.csv("household_power_consumption.txt",sep = ";",colClasses="character")

               #subsetting required obervations
b<-a[a$Date=="1/2/2007"|a$Date=="2/2/2007",]

               #opening png device 
png(file="plot1.png")

               #drawing the histogram
hist(as.numeric(b$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power(Kilowatts)",ylab="Frequency")
               
              #closing the deive
dev.off()