Plot2 <-function () {
  
  ## Reading only needed rows
  data<-read.csv("household_power_consumption.txt",sep=";",nrows=2880,skip=66636)  
  ## Reading the names of cols
  namesofcols<-colnames(read.csv("household_power_consumption.txt",sep=";",nrows=1))  
  names(data)<-namesofcols
  
  
  
  ddata<-cbind(data,strptime(data$Date,"%e/%m/%Y"))
  names(ddata)<-c(namesofcols,"day")

  ## Openning device
  png(filename="Plot2.png",
      width = 480, 
      height = 480,
      units = "px")
  
  ## Plotting
  plot(ddata$Global_active_power,
       type="S",
       ylab="Global Active Power (kilowatts)",
       xlab="",
       xaxt='n'
  )
    axis(1, at=c(1,1440,2880), lab=c("Thu","Fri","Sat"))

  ## Close device
  dev.off()
  
}
