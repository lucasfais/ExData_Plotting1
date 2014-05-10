if (!("data.table" %in% rownames(installed.packages()))){
  install.packages("data.table")  
}

library(data.table)

# Converts a date and time strings to a POSIXct object
#
toDateTime <- function(date, time) {
  as.POSIXct(strptime(paste(date, time), "%d/%m/%Y %H:%M:%S"))
}

# Downloads and extracts the ECP data files
#
downloadAndExtract <- function() {
  url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  dataFile <- "data/household_power_consumption.txt"
  zipFile <- "data/exdata-data-household_power_consumption.zip"
  
  if(!file.exists(dataFile)){
    
    if(!file.exists(zipFile)){
      if(!file.exists("data")) { dir.create("data") }
      download.file(url, method = "curl", destfile = zipFile)
    }
    
    unzip(zipfile = zipFile, exdir = "data")
  }
}

# Loads a data table with data from 2/1/2007 to 2/2/2007
#
loadEPCData <- function() {
  downloadAndExtract()
  
  filterFileCmd <- paste("head -1 data/household_power_consumption.txt;",
                         "grep '^[12]/2/2007' data/household_power_consumption.txt")
  
  dt <- fread(filterFileCmd, na.strings = '?', sep = ';')
  dt[, DateTime := toDateTime(Date, Time)]
}