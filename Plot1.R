# Coursera
# Data Science Specialization
# Course 4 
# Week 1 Project
# Plot 1

## Read the text file into a data table called housepowcon1
housepowcon1 <-read.csv("household_power_consumption.txt", header = T, sep = ";", 
                 na.strings = "?", stringsAsFactors = F)

## Subset housepowcon1 to only read the info from 1-Feb-2007 and 2-Feb-2007
hpc2 <- housepowcon1[housepowcon1$Date %in% c("1/2/2007", "2/2/2007"), ]

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png(filename="Plot1.png", height=480, width=480)

## Create a histogram for the variable "Global_active_power"
## make the columns red with col="red"
## label the x-axis with xlab="Global Active Power (kilowatts)"
## label the main title with  main="Global Active Power"
with(hpc2, hist(Global_active_power, 
            col = "red", 
            xlab="Global Active Power (kilowatts)", 
            main="Global Active Power"))
dev.off()
