# Load Data
source('load_data.R')
dt <- loadEPCData()

# Plot 4
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

# 1
with(dt, plot(DateTime, Global_active_power, 
              ylab = "Global Active Power",
              xlab = "",
              type = "l"))

# 2
with(dt, plot(DateTime, Voltage, 
              ylab = "Voltage",
              xlab = "datetime",
              type = "l"))

# 3
with(dt, {
  plot(DateTime, Sub_metering_1, 
       ylab = "Energy sub metering",
       xlab = "",
       type = "l")
  
  points(DateTime, Sub_metering_2, type = "l", col = "red")
  
  points(DateTime, Sub_metering_3, type = "l", col = "blue")
  
  legend("topright",
         legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         lty =c(1,1), col = c("black","red", "blue"),
         bty="n")
})

# 4
with(dt, plot(DateTime, Global_reactive_power, 
              ylab = "Global_reactive_power",
              xlab = "datetime",
              type = "l"))

dev.off()
