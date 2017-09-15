## Script for Plot2

### Prepare the dataset

df<-read.csv("household_power_consumption.txt", sep=";",
             stringsAsFactors = FALSE)

# Convert to date data type
df[,1]   <- as.Date(df[,1], format = "%d/%m/%Y")

# Subset out the relevant records (dates)
df <- df[df$Date <= as.Date("2007-02-02") & df$Date >= as.Date("2007-02-01"),]

# Convert the time column to a POSIXct (including the date)
df[,2] <- as.POSIXct(strptime(paste(df[,1],df[,2],sep=" "),"%Y-%m-%d %H:%M:%S"))

# Convert the other columns to numeric
df[,3:9] <- lapply(df[,3:9], function(x) x<-as.numeric(x))



### Create the plot and save to png

# open png graphichs device (standard width and height is already 480)
png(filename = "plot2.png")

plot(df$Time, df$Global_active_power, 
     ylab = "Global Active Power (kilowats)",
     xlab = "",
     type="l")


dev.off()
