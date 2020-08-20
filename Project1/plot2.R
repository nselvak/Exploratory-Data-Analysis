library(tidyverse) # Load relevant libraries

# Read in txt file
p2 <- read.table("household_power_consumption.txt", header = 1, 
                   sep =';', na.strings="?")

# mutate for preventing scientific notations
# Reset Date column
# Filter required dates
p2 <- p2 %>%
    mutate(Global_active_power = as.numeric(Global_active_power),
           Datetime = as.POSIXct(paste(Date, Time),
                                 format = "%d/%m/%Y %H:%M:%S")) %>%
    filter((Datetime >= "2007-02-01") & (Datetime < "2007-02-03"))

png("plot2.png", width=480, height=480)

## Plot 2
plot(p2$Datetime,
      p2$Global_active_power,
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()
