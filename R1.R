# to recreate the plots call plot1(getData())

#the below function reads in data from the file
getData <- function()
{
  # set working directory
  setwd("D:/exdata-data-household_power_consumption")
  # create a file name
  fileName <- paste(getwd(), "/", "household_power_consumption.txt", sep="")
  # create data classes to speed up reading the file
  classes = c(rep("character",2), rep("numeric",5))
  # read in the file with data
  data <- read.table(file = fileName, header=T, sep=";", colClasses = classes, na.strings = "?")
  # limit data to just two days: 2007-02-01 and 2007-02-02
  data <- data[data$Date=="1/2/2007" | data$Date=="2/2/2007", ]
  # append data with "date time" to facilitate plot creation
  data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  return(data)
}

#the below function creates plot1
#this function needs two arguments:
#   data - which is provided by running the getData() function
#   save - a boolean value (default: TRUE) that says whether to save the plot as a png file
plot1 <- function(data, save=TRUE)
{
  hist(data$Global_active_power,
       xlab="Global Active Power (kilowatts)",
       main="Global Active Power",
       col="red",
       ylim=c(0,1200))
  
  if(save)     
  {
    dev.copy(png, "plot_1.png")
    dev.off()
  }
}