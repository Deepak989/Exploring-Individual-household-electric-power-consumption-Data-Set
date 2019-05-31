library(dplyr)
library(lubridate)
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE, 
                colClasses = c("character","character","real","real","real",
                               "real","real","real","real"),na.strings = "?")
hpc<-as_tibble(hpc)
hpc<- filter(hpc, Date=='1/2/2007' | Date=='2/2/2007')
hpc<- mutate(hpc, Date_Time= with(hpc,paste(Date,Time,sep = " ")%>%dmy_hms()))
png(file="ln_enrg_sub_mtr.png")
plot(hpc$Date_Time,hpc$Sub_metering_1,type='n',ylab = "Energy sub metering",
     xlab="")
points(hpc$Date_Time,hpc$Sub_metering_1,type='l')
points(hpc$Date_Time,hpc$Sub_metering_2,type='l',col="red")
points(hpc$Date_Time,hpc$Sub_metering_3,type='l',col="blue")
legend("topright",pch = NA,col = c('black','red','blue'),legend = 
               c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1))
dev.off()