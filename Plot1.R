# Read data
tab<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

# Subset data only from 2007-02-01 and 2007-02-02
days<-c("1/2/2007","2/2/2007")
tab<-tab[tab$Date %in% days,]

# Plot 1 - Histogram of Global Active Power
png(file="Plot1.png")
hist(as.numeric(as.character(tab$Global_active_power)),
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red")
dev.off()
