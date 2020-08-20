library(tidyverse) # Load relevant libraries

# Read in txt file
data <- read.table("household_power_consumption.txt", header = 1, 
                   sep =';', na.strings="?")

# mutate for preventing scientific notations
# Reset Date column
# Filter required dates
data <- data %>%
    mutate(Global_active_power = as.numeric(Global_active_power),
           Date = as.Date(Date, "%d/%m/%Y")) %>%
    filter((Date >= "2007-02-01") & (Date <= "2007-02-02"))



png("plot1.png", width=480, height=480)

## Plot 1
hist(data[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
