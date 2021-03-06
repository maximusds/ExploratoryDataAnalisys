file<-read.csv("household_power_consumption.txt",header=T,sep=";")
file$Date <- as.Date(file$Date, format="%d/%m/%Y")
filefilter<-sqldf("select * from file where Date between '1/2/2007' and '2/2/2007' order by Date")
filefilter$Global_active_power<-as.numeric(filefilter$Global_active_power)
finaltime<-strptime(paste(filefilter$Date, filefilter$Time,sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
 par(mfrow=c(2,2))
        
        ##PLOT 1
        plot(filefilter$finaltime,filefilter$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        ##PLOT 2
        plot(filefilter$finaltime,filefilter$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        ##PLOT 3
        plot(filefilter$finaltime,filefilter$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(filefilter$finaltime,filefilter$Sub_metering_2,col="red")
        lines(filefilter$finaltime,filefilter$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
        
        #PLOT 4
plot(filefilter$finaltime,filefilter$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
