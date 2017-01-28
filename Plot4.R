# Coursera
# Data Science Specialization
# Course 4 
# Week 1 Project
# Plot 4

## Read the text file into a data table called housepowcon1
housepowcon1 <-read.csv("household_power_consumption.txt", header = T, sep = ";", 
                 na.strings = "?", stringsAsFactors = F)

## Subset housepowcon1 to only read the info from 1-Feb-2007 and 2-Feb-2007
hpc2 <- housepowcon1[housepowcon1$Date %in% c("1/2/2007", "2/2/2007"), ]

## Copy hpc2 to a new dataset
hpc3 <- hpc2
## Add a new column to combine the date and time
hpc3$DateTime <- paste(hpc3$Date, hpc3$Time, sep=" ")
## change the DateTime column from character variable into date/time variable
hpc3$DateTime <- strptime(hpc3$DateTime, format="%d/%m/%Y %H:%M:%S")

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename="Plot4.png", height=480, width=480)

## We will be creating four plots in a 2 by 2 matrix
par(mfrow = c(2,2))

###  THE FIRST GRAPH
## Create a plot for the variable "Global_active_power"
## label the y-axis with ylab="Global Active Power"
## Remove the x-axis label with xlab=""
## change the data points from open circles to a continuous line with type = "l"
with(hpc3, plot(DateTime,Global_active_power, 
                ylab = "Global Active Power", 
                xlab = "",
                type = "l"))


###  THE SECOND GRAPH
## Create a plot for the variable "Voltage"
## label the y-axis with ylab="Voltage"
## Remove the x-axis label with xlab="datetime"
## change the data points from open circles to a continuous line with type = "l"
with(hpc3, plot(DateTime,Voltage, 
                ylab = "Voltage", 
                xlab = "datetime",
                type = "l"))

###  THE THIRD GRAPH
## Create a plot for the variable "Sub_metering_1"
## label the y-axis with ylab="Energy submetering"
## Remove the x-axis label with xlab=""
## change the data points from open circles to a continuous line with type = "l"
with(hpc3, plot(DateTime,Sub_metering_1, 
      ylab="Energy sub metering", 
      xlab="",
      type = "l"))

## Add a line for the variable Sub_metering_2
## Make this line red with col="red"
lines(hpc3$DateTime,hpc3$Sub_metering_2, 
      col = "red")

## Add a line for the variable Sub_metering_3
## Make this line blue with col="blue"
lines(hpc3$DateTime, hpc3$Sub_metering_3,
      col = "blue")

## Add a legend to the top right side of the plot
## indicate that the items are lines with lty=1
## determine the color of those lines with col=c("black","red","blue")
## show that those lines pertain to the variables Sub_metering_1/2/3
legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


###  THE FOURTH GRAPH
## Create a plot for the variable "Global_reactive_power"
## Remove the x-axis label with xlab="datetime"
## change the data points from open circles to a continuous line with type = "l"
with(hpc3, plot(DateTime,Global_reactive_power, 
                xlab = "datetime",
                type = "l"))



## Close the graphics device
dev.off()
