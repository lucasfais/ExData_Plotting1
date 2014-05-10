# Load Data
source('load_data.R')
dt <- loadEPCData()

# Plot 3
png("plot3.png", width = 480, height = 480)

par(mfrow=c(1,1))

with(dt, {
  plot(DateTime, Sub_metering_1, 
       ylab = "Energy sub metering",
       xlab = "",
       type = "l")
  
  points(DateTime, Sub_metering_2, type = "l", col = "red")
  
  points(DateTime, Sub_metering_3, type = "l", col = "blue")
  
  legend("topright",
         legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
         lty =c(1,1), col = c("black","red", "blue"))
})

dev.off()
