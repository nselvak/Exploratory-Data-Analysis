SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Gather the subset of the NEI data which corresponds to vehicles
c <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)

vSCC <- SCC[c,]$SCC
vNEI <- NEI[NEI$SCC %in% vSCC,]

# Subset the vehicles NEI data to Baltimore's fip
bvNEI <- vNEI[vNEI$fips=="24510",]

# PLot 5
png("plot5.png")

ggplot(bvNEI,aes(factor(year),Emissions)) +
    geom_bar(stat="identity", 
             fill ="#FF9999" ,width=0.75) +
    labs(x="year", 
         y=expression("Total PM"[2.5]*" Emission (10^5 Tons)"), 
         title=expression("PM"[2.5]*" Motor Vehicle Source Emissions
                          in Baltimore from 1999-2008"))

dev.off()