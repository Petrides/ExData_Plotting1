# Load data
tab<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

# Subset data only from 2007-02-01 and 2007-02-02
days<-c("1/2/2007","2/2/2007")
# days<-as.Date(c("2007-02-01/2007","2007-02-02"))
tab<-tab[tab$Date %in% days,]

# Convert Date and Time from factors to POSIXlt
# dates<-as.Date(tab$Date,format="%d/%m/%Y")
# times<-strptime(tab$Time,format="%H:%M:%S")
datetime<-paste(tab$Date,tab$Time)
minutes<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")

# Plot 4 - Four Figures
png(file="Plot4.png")
par(mfrow=c(2,2))
# Plot 1,1 - Global Power v. Time
plot(minutes,as.numeric(as.character(tab$Global_active_power)),
     type="l",
     xlab="",
     ylab="Global Active Power")
# Plot 1,2 - Voltage v. datetime
plot(minutes,as.numeric(as.character(tab$Voltage)),
     type="l",
     xlab="datetime",
     ylab="Voltage")
# Plot 2,1 - Sub Metering v. time
plot(minutes,tab$Sub_metering_1,type="n",
     ylim=c(0,38),
     xlab="",ylab="Energy sub metering")
lines(minutes,as.numeric(as.character(tab$Sub_metering_1)))
lines(minutes,as.numeric(as.character(tab$Sub_metering_2)),col="red")
lines(minutes,as.numeric(as.character(tab$Sub_metering_3)),col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
# Plot 2,2 - Reactive Power v. datetime
plot(minutes,as.numeric(as.character(tab$Global_reactive_power)),
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
dev.off()