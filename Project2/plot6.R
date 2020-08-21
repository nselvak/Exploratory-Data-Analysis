SCC <- readRDS("Source_Classification_Code.rds")
NEI <- readRDS("summarySCC_PM25.rds")

# Gather the subset of the NEI data which corresponds to vehicles
c <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)

vSCC <- SCC[c,]$SCC
vNEI <- NEI[NEI$SCC %in% vSCC,]

bvNEI <- vNEI %>%
    filter(fips == '24510') %>%
    mutate(city = 'Baltimore City' )

lavNEI <- vNEI %>%
    filter(fips == '06037') %>%
    mutate(city = 'Los Angeles' )

# Combine data.tables into one data.table
bothNEI <- rbind(bvNEI,lavNEI)

# Plot 6
png("plot6.png")

ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
    geom_bar(aes(fill=year),stat="identity") +
    facet_grid(scales="free", space="free", .~city) +
    labs(x="year", 
         y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)"), 
         title=expression("PM"[2.5]*" Motor Vehicle Source Emissions 
                          in Baltimore & LA, 1999-2008"))

dev.off()
