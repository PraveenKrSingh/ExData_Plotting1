library("lubridate") #getting lubridate

                     #geading the date
a<-read.csv("household_power_consumption.txt",sep = ";",colClasses="character")
                     
                      #subsetting the required portion
b<-a[a$Date=="1/2/2007"|a$Date=="2/2/2007",]

                      #getting a combined variable for date time
d<-paste(b$Date,b$Time)
d<-dmy_hms(d)

                      #opening png device
png(file="plot4.png")

                      #setting mfrow for upcoming 4 plots
par(mfrow=c(2,2))
                      
                      #plotting first plot
plot(x=d,y=as.numeric(b$Global_active_power),type="n",ylab="Global Active Power",xlab=" ")
lines(d, as.numeric(b$Global_active_power))

                      #plotting second plot
plot(x=d,y=as.numeric(b$Voltage),type="n",ylab="Voltage",xlab="datetime")
lines(d, as.numeric(b$Voltage))
                       
                      #plotting third plot
plot(x=d,y=as.numeric(b$Sub_metering_1),type="n",ylab="Energy sub metering",xlab=" ")
lines(x=d,y=as.numeric(b$Sub_metering_1))
lines(x=d,y=as.numeric(b$Sub_metering_2),col="red")
lines(x=d,y=as.numeric(b$Sub_metering_3),col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = c("solid", "solid", "solid"),bty="n")
                     
                      #plotting fourth plot
plot(x=d,y=as.numeric(b$Global_reactive_power),type="n",ylab="Global_reactive_power",xlab="datetime")
lines(d, as.numeric(b$Global_reactive_power))
                     
                      #closing the device
dev.off()


