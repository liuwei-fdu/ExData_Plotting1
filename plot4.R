household_power_consumption <- read_delim(
        "household_power_consumption.txt",
        ";",
        escape_double = FALSE,
        trim_ws = TRUE
)
df <- subset(household_power_consumption,
             Date %in% c("1/2/2007", "2/2/2007"))

df$week<-as.POSIXct(paste(as.Date(df$Date,'%d/%m/%Y'),df$Time))

png(filename = "Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(df, {
        plot(Global_active_power~week, type="l", 
             ylab="Global Active Power", xlab="")
        plot(Voltage~week, type="l", 
             ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~week, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~week,col='Red')
        lines(Sub_metering_3~week,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~week, type="l", 
             ylab="Global_reactive_power",xlab="datatime")
})
dev.off()

