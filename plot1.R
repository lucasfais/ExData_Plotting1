# Load Data
source('load_data.R')
dt <- loadEPCData()

# Plot 1
png("plot1.png", width = 480, height = 480)

par(mfrow=c(1,1))

hist(dt$Global_active_power, 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()
