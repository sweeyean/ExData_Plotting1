setwd("C:/Data Science/Exploratory Data Analysis")

## set the filename
filename <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"

## create folder "data"
if(!file.exists("data")) { 
   dir.create("data")
      }
      setwd("C:/Data Science/Exploratory Data Analysis/data")
         
	 ## Download the dataset:
	 if (!file.exists(filename)){
	   fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	     download.file(fileURL, filename, mode="wb")
	     }  

	     ## unzip the dataset:
	     if (!file.exists("household_power_consumption.txt")) {
	       unzip(filename) 
	       }

	       ## read the dataset 
	       ## The dataset has 2,075,259 rows and 9 columns. 
	       	All_data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")

		## convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions
			All_data$Time <- strptime(paste(All_data$Date, All_data$Time), "%d/%m/%Y %H:%M:%S")
				All_data$Date <- as.Date(All_data$Date, "%d/%m/%Y")

				## only be using data from the dates 2007-02-01 and 2007-02-02
					twodays_data <- subset(All_data, Date %in% as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d"))

					## Plot 3
						plot(twodays_data$Time, twodays_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
							lines(twodays_data$Time, twodays_data$Sub_metering_2, type="l", col="red")
								lines(twodays_data$Time, twodays_data$Sub_metering_3, type="l", col="blue")
									legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=2, col=c("black", "red", "blue"))
										

										## Saving to file
										dev.copy(png, file="plot3.png", height=480, width=480)
										dev.off()	
