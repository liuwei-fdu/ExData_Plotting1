household_power_consumption <- read_delim(
        "household_power_consumption.txt",
        ";",
        escape_double = FALSE,
        trim_ws = TRUE
)
df <- subset(household_power_consumption,
             Date %in% c("1/2/2007", "2/2/2007"))

df$week<-as.POSIXct(paste(as.Date(df$Date,'%d/%m/%Y'),df$Time))

png(filename = "Plot3.png", width = 480, height = 480)
plot(df$week,df$Sub_metering_1,type = "l",
        ylab = "Energy sub metering",
        xlab = ""
)

lines(df$week,df$Sub_metering_2,col='Red')
lines(df$week,df$Sub_metering_3,col='Blue')

legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

