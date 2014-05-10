# Load Data
source('load_data.R')
dt <- loadEPCData()

# Plot 2
png("plot2.png", width = 480, height = 480)

par(mfrow=c(1,1))

with(dt, plot(DateTime, Global_active_power, 
              ylab = "Global Active Power (kilowatts)",
              xlab = "",
              type = "l"))

dev.off()
