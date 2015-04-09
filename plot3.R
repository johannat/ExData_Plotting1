# exploratory graphs are supposed to be "quick and dirty"
# therefore default settings are kept whenever possible

# read data from the txt file supplied
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   dec = ".", as.is = TRUE, na.strings = "?")

# choose the dates we are interested in
# NB: contrary to the instructions, the date format is actually
#     d/m/yyyy and NOT dd/mm/yyyy
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# combine date and time into one datetime
data$datetime <- strptime(with(data, paste(Date, Time, sep = " ")),
                          "%d/%m/%Y %T")

# open the png graphic device; the default size is 480 px x 480 px
png(filename = "plot3.png")

# make the line graph with three different lines and a legend
with(data, plot(datetime, Sub_metering_1, type = "n", 
                ylab = "Energy sub metering", xlab = ""))
with(data, lines(datetime, Sub_metering_1, col = "black"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), lwd = 1, 
       legend = grep("Sub", names(data), value = TRUE))

# close the graphic device
dev.off()
