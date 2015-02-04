library("lubridate")  #incuding lubridate
                      
                      #reading the data
a<-read.csv("household_power_consumption.txt",sep = ";",colClasses="character")

                      #subsetting the required portion
b<-a[a$Date=="1/2/2007"|a$Date=="2/2/2007",]

                      #getting a combined variable for date time
d<-paste(b$Date,b$Time)
d<-dmy_hms(d)
                      #opening png device
png(file="plot2.png")
                     
                      #plotting
plot(x=d,y=as.numeric(b$Global_active_power),type="n",ylab="Global Active Power(Kilowatts)",xlab=" ")
lines(d, as.numeric(b$Global_active_power))

                      #closing the device
dev.off()