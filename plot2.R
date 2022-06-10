household_power_consumption <- read_delim(
        "household_power_consumption.txt",
        ";",
        escape_double = FALSE,
        trim_ws = TRUE
)
df <- subset(household_power_consumption,
             Date %in% c("1/2/2007", "2/2/2007"))

df$week<-as.POSIXct(paste(as.Date(df$Date,'%d/%m/%Y'),df$Time))

png(filename = "Plot2.png", width = 480, height = 480)
p <- plot(
        df$week,df$Global_active_power,type = "l",
        ylab = "Global Active Power (kilowatts)",
      xlab = ""
)
dev.off()

