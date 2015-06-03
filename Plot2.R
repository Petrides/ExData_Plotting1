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

# Plot 2
png(file="Plot2.png")
plot(minutes,as.numeric(as.character(tab$Global_active_power)),
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()