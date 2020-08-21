library(tidyverse)

SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Prevents histogram from printing in scientific notation
NEI <- NEI %>%
    filter(fips == '24510')

# Plot 3
png(filename='plot3.png')

ggplot(NEI,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +
    facet_grid(.~type,scales = "free",space="free") + 
    labs(x="year", 
         y=expression("Total PM"[2.5]*" Emission (Tons)"), 
         title=expression("PM"[2.5]*" Emissions, 
                          Baltimore City 1999-2008 by Source Type"))

dev.off()