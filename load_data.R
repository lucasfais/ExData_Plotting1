library(data.table)

toDateTime <- function(date, time) {
  as.POSIXct(strptime(paste(date, time), "%d/%m/%Y %H:%M:%S"))
}

downloadAndExtract <- function() {
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dataFile <- "data/household_power_consumption.txt"
  zipFile <- "data/exdata-data-household_power_consumption.zip"
  
  if(!file.exists(dataFile)){
    
    if(!file.exists(zipFile)){
      if(!file.exists("data")) { dir.create("data") }
      download.file(url, method = "curl", destfile = zipFile)
    }
    
    unzip(zipfile = zipFile, exdir="data")
  }
}

loadEPCData <- function() {
  downloadAndExtract()
  
  filterFileCmd <- paste("head -1 data/household_power_consumption.txt;",
                         "grep '^[12]/2/2007' data/household_power_consumption.txt")
  
  dt <- fread(filterFileCmd, na.strings = '?', sep = ';')
  dt[, DateTime:=toDateTime(Date, Time)]
}