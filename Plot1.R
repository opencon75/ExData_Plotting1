Plot1 <-function () {
  
  
  data<-read.csv("household_power_consumption.txt",sep=";",nrows=5000,skip=65500)  
  namesofcols<-colnames(read.csv("household_power_consumption.txt",sep=";",nrows=1))
  
  names(data)<-namesofcols
  
  day1<-data[data$Date=="1/2/2007",]
  #head(datos1)
  day2<-data[data$Date=="2/2/2007",]
  
  daysdata <-rbind(day1, day2)
  
  rm(data,day1,day2)

  png(filename="Plot1.png",
      width = 480, 
      height = 480,
      units = "px")
  
  hist(daysdata$Global_active_power,
       xlab="Global Active Power (kilowatts)",
       col="red",main="Global Active Power")
  #title(main="Global Active Power")
  dev.off()
  #datos<-data["Date"=="01/02/2007"]
  #datos  
  
}
