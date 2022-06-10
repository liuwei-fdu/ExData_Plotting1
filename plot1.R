household_power_consumption <- read_delim(
        "household_power_consumption.txt",
        ";",
        escape_double = FALSE,
        trim_ws = TRUE
)
df <- subset(household_power_consumption,
             Date %in% c("1/2/2007", "2/2/2007"))

png(filename = "Plot1.png", width = 480, height = 480)
p <- hist(
        df$Global_active_power,
        main = "Global Active Power",
        xlab = "Global Active Power (kilowatts)",
        col = "red"
)
dev.off()