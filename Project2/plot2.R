library(tidyverse)

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Prevents histogram from printing in scientific notation
NEI <- NEI %>%
    filter(fips == '24510') %>%
    mutate(Emissions = as.numeric(Emissions)) %>%
    group_by(year) %>%
    summarise(Emissions = sum(Emissions))

# Plot 2
png(filename='plot2.png')

barplot(NEI$Emissions, 
        names = NEI$year, 
        xlab = "Years", ylab = "Emissions", 
        main = "Emissions over the Years")

dev.off()