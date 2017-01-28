# Coursera
# Data Science Specialization
# Course 4 
# Week 1 Project
# Plot 2

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
png(filename="Plot2.png", height=480, width=480)

## Create a plot for the variable "Global_active_power"
## label the y-axis with ylab="Global Active Power (kilowatts)"
## change the data points from open circles to a continuous line with type = "l"
with(hpc3, plot(DateTime,Global_active_power, 
      ylab="Global Active Power (kilowatts)", 
      type = "l"))

## Close the graphics device
dev.off()
