# to recreate the plots call plot4(getData())

#the below function reads in data from the file
getData <- function()
{
  # set working directory
  setwd("D:/Exploratory Data Analysis/exdata-data-household_power_consumption")
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


#the below function creates the "Voltage" vs "date time" plot that is used to create plot 4
#this function needs two arguments:
#   data - which is provided by running the getData() function
#   save - a boolean value (default: TRUE) that says whether to save the plot as a png file
plotVoltage <- function(data, save=TRUE)
{
  plot(data$DateTime, data$Voltage,
       type="l",
       xlab="datetime",
       ylab="Voltage")
  
  if(save)
  {
    dev.copy(png, "plot_3.png")
    dev.off()    
  }
}


#the below function creates the "Global reactive power" vs "date time" plot that is used to create plot 4
#this function needs two arguments:
#   data - which is provided by running the getData() function
#   save - a boolean value (default: TRUE) that says whether to save the plot as a png file
plotGlobReaPow <- function(data, save=TRUE)
{
  plot(data$DateTime, data$Global_reactive_power,
       type="l",
       xlab="datetime",
       ylab="Global Reactive Power")
  
  if(save)
  {
    dev.copy(png, "plot_3.png")
    dev.off()    
  }
}


#the below function creates plot4
#this function needs two arguments:
#   data - which is provided by running the getData() function
#   save - a boolean value (default: TRUE) that says whether to save the plot as a png file
plot4 <- function(data, save=TRUE)
{
  par(mfrow=c(2,2)) 
  plot2(data, save=FALSE)
  plotVoltage(data, save=FALSE)
  plot3(data, save=FALSE)
  plotGlobReaPow(data, save=FALSE)
    
  if(save)     
  {
    dev.copy(png, "plot_4.png")
    dev.off()
  }
}