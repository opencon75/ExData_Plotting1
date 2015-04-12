Plot4 <-function () {
  
  ## Reading only needed rows
  data<-read.csv("household_power_consumption.txt",sep=";",nrows=2880,skip=66636)  
  ## Reading the names of cols
  namesofcols<-colnames(read.csv("household_power_consumption.txt",sep=";",nrows=1))  
  names(data)<-namesofcols
  
  
  
  ddata<-cbind(data,strptime(data$Date,"%e/%m/%Y"))
  names(ddata)<-c(namesofcols,"day")
  
  ## Openning device
  png(filename="Plot4.png",
      width = 480, 
      height = 480,
      units = "px")

  
  par(mfrow=c(2,2))
  ## Plot  1
  plot(ddata$Global_active_power,
       type="S",
       ylab="Global Active Power",
       xlab="",
       xaxt='n'
  )
  axis(1,   at=c(1,1440,2880),lab=c("Thu","Fri","Sat"))
  
  
  ## Plot  2
  plot(ddata$Voltage,
       type="S",
       ylab="Voltage",
       xlab="",
       xaxt='n'
  )
  axis(1,   at=c(1,1440,2880),lab=c("Thu","Fri","Sat"))
  
  
  ## Plot  3
  plot(ddata$Sub_metering_1,
       type="S",
       ylab="Energy sub metering",
       xlab="",
       xaxt='n'
  )
  lines(ddata$Sub_metering_2, col="red")
  lines(ddata$Sub_metering_3, col="blue")
  
  
  axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),pch=95,col=c("black","red","blue"))
  
  
  ## Plot  4
  plot(ddata$Global_reactive_power,
       type="S",
       ylab="Global Reactive Power",
       xlab="",
       xaxt='n'
  )
  axis(1,   at=c(1,1440,2880),lab=c("Thu","Fri","Sat"))
  
  ## Close device
  dev.off()
  
}
