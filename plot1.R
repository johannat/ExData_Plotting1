# exploratory graphs are supposed to be "quick and dirty"
# therefore default settings are kept whenever possible

# read data from the txt file supplied
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                   dec = ".", as.is = TRUE, na.strings = "?")

# choose the dates we are interested in
# NB: contrary to the instructions, the date format is actually
#     d/m/yyyy and NOT dd/mm/yyyy
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# open the png graphic device; the default size is 480 px x 480 px
png(filename = "plot1.png")

# make the red histogram
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# close the graphic device
dev.off()
