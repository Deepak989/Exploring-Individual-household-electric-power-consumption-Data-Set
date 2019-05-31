library(dplyr)
library(lubridate)
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE, 
                colClasses = c("character","character","real","real","real",
                               "real","real","real","real"),na.strings = "?")
hpc<-as_tibble(hpc)
hpc<- filter(hpc, Date=='1/2/2007' | Date=='2/2/2007')
hpc<- mutate(hpc, Date_Time= with(hpc,paste(Date,Time,sep = " ")%>%dmy_hms()))
png(file="ts_gl_ac_pw.png")
plot(hpc$Date_Time,hpc$Global_active_power,type='l',
     ylab = "Global Active Power (Kilowatts)",xlab="")
dev.off()