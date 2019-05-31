library(dplyr)
hpc<-read.table("household_power_consumption.txt",sep=";",header=TRUE, 
                colClasses = c("character","character","real","real","real",
                               "real","real","real","real"),na.strings = "?")
hpc<-as_tibble(hpc)
hpc<- filter(hpc, Date=='1/2/2007' | Date=='2/2/2007')
png(file="hist_gl_act_pw.png")
hist(hpc$Global_active_power,col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.off()

