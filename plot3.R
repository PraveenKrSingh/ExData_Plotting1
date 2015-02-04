library("lubridate")     #adding lubridate

                         #reading the data
a<-read.csv("household_power_consumption.txt",sep = ";",colClasses="character")
                        
                          #subsetting the required portion 
b<-a[a$Date=="1/2/2007"|a$Date=="2/2/2007",]

                          #getting a combined variable for date time
d<-paste(b$Date,b$Time)
d<-dmy_hms(d)

                          #opening png device
png(file="plot3.png")

                           #plotting
plot(x=d,y=as.numeric(b$Sub_metering_1),type="n",ylab="Energy Sub Metering",xlab=" ")
lines(x=d,y=as.numeric(b$Sub_metering_1))
lines(x=d,y=as.numeric(b$Sub_metering_2),col="red")
lines(x=d,y=as.numeric(b$Sub_metering_3),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = c("solid", "solid", "solid"))

                          #closing the device
dev.off()       