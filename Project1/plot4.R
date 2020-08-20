library(tidyverse) # Load relevant libraries

# Read in txt file
p4 <- read.table("household_power_consumption.txt", header = 1, 
                 sep =';', na.strings="?")

# mutate for preventing scientific notations
# Reset Date column
# Filter required dates
p4 <- p4 %>%
    mutate(Global_active_power = as.numeric(Global_active_power),
           Datetime = as.POSIXct(paste(Date, Time),
                                 format = "%d/%m/%Y %H:%M:%S")) %>%
    filter((Datetime >= "2007-02-01") & (Datetime < "2007-02-03"))

png("plot4.png", width=480, height=480)

## Plot 4

par(mfrow=c(2,2))

# Plot 1
plot(p4$Datetime, p4$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power")

# Plot 2
plot(p4$Datetime,  p4$Voltage, 
     type="l", xlab="datetime", ylab="Voltage")

# Plot 3
plot(p4$Datetime,  p4$Sub_metering_1,
     type="l", xlab="", ylab="Energy sub metering")
lines(p4$Datetime, p4$Sub_metering_2, col="red")
lines(p4$Datetime, p4$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       , lty=c(1,1)
       , bty="n"
       , cex=.5) 

# Plot 4
plot(p4$Datetime, p4$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
