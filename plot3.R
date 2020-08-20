library(tidyverse) # Load relevant libraries

# Read in txt file
p3 <- read.table("household_power_consumption.txt", header = 1, 
                 sep =';', na.strings="?")

# mutate for preventing scientific notations
# Reset Date column
# Filter required dates
p3 <- p3 %>%
    mutate(Global_active_power = as.numeric(Global_active_power),
           Datetime = as.POSIXct(paste(Date, Time),
                                 format = "%d/%m/%Y %H:%M:%S")) %>%
    filter((Datetime >= "2007-02-01") & (Datetime < "2007-02-03"))

png("plot3.png", width=480, height=480)

## Plot 3
plot(p3$Datetime, p3$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub metering")

lines(p3$Datetime, p3$Sub_metering_2, col="red")
lines(p3$Datetime, p3$Sub_metering_3, col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()