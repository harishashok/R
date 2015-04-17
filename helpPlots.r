A BASIC SCATTERPLOT

# Read in data

WHO = read.csv("WHO.csv")
str(WHO)


# Plot for WHO
plot(WHO$GNI, WHO$FertilityRate)

#using ggplot 

# Install and load the ggplot2 library:
install.packages("ggplot2")
library(ggplot2)

# Creating the ggplot object with the data and the aesthetic mapping:
scatterplot = ggplot(WHO, aes(x = GNI, y = FertilityRate))

# Adding the geom_point geometry
scatterplot + geom_point()

# Making a line graph instead:
scatterplot + geom_line()

# Switching back to the points:
scatterplot + geom_point()

# plot with blue triangles instead of circles:
scatterplot + geom_point(color = "blue", size = 3, shape = 17) 

# Aternative
scatterplot + geom_point(color = "darkred", size = 3, shape = 8) 

# Adding a title to the plot:
scatterplot + geom_point(colour = "blue", size = 3, shape = 17) + ggtitle("Fertility Rate vs. Gross National Income")

# Save the plot:
fertilityGNIplot = scatterplot + geom_point(colour = "blue", size = 3, shape = 17) + ggtitle("Fertility Rate vs. Gross National Income")

pdf("MyPlot.pdf")

print(fertilityGNIplot)

dev.off()



---------- MORE ADVANCED SCATTERPLOTS--------------

# Coloring the points by region: 
ggplot(WHO, aes(x = GNI, y = FertilityRate, color = Region)) + geom_point()

# Coloring the points according to life expectancy:
ggplot(WHO, aes(x = GNI, y = FertilityRate, color = LifeExpectancy)) + geom_point()

# Is the fertility rate of a country was a good predictor of the percentage of the population under 15?
ggplot(WHO, aes(x = FertilityRate, y = Under15)) + geom_point()

# log transformation:
ggplot(WHO, aes(x = log(FertilityRate), y = Under15)) + geom_point()

# Simple linear regression model to predict the percentage of the population under 15, using the log of the fertility rate:
mod = lm(Under15 ~ log(FertilityRate), data = WHO)
summary(mod)

# Adding this regression line to our plot:
ggplot(WHO, aes(x = log(FertilityRate), y = Under15)) + geom_point() + stat_smooth(method = "lm")

# 99% confidence interval
ggplot(WHO, aes(x = log(FertilityRate), y = Under15)) + geom_point() + stat_smooth(method = "lm", level = 0.99)

# No confidence interval in the plot
ggplot(WHO, aes(x = log(FertilityRate), y = Under15)) + geom_point() + stat_smooth(method = "lm", se = FALSE)

# Change the color of the regression line:
ggplot(WHO, aes(x = log(FertilityRate), y = Under15)) + geom_point() + stat_smooth(method = "lm", colour = "orange")

