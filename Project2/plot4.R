
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Subset coal combustion related NEI data
combustR <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coalR <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 

combustSCC <- SCC[(combustR & coalR),]$SCC
combustNEI <- NEI[NEI$SCC %in% combustSCC,]

# Plot 4
png("plot4.png")

ggplot(combustNEI,aes(x = factor(year),y = Emissions/10^5)) +
    geom_bar(stat="identity", fill ="#FF9999", width=0.75) +
    labs(x="year", 
         y=expression("Total PM"[2.5]*" Emission (10^5 Tons)"), 
         title=expression("PM"[2.5]*" Coal Combustion Source 
                          Emissions Across US from 1999-2008"))

dev.off()