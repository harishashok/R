-------------Bar Charts--------------

# Load ggplot library
library(ggplot2)

# Load the data, which lives in intl.csv
intl = read.csv("intl.csv")
str(intl)

# To make a bar plot with region on the X axis and Percentage on the y-axis.
ggplot(intl, aes(x=Region, y=PercentOfIntl)) +
  geom_bar(stat="identity") +
  geom_text(aes(label=PercentOfIntl))

# Make Region an ordered factor.  Use the re-order command and transform command. 
intl = transform(intl, Region = reorder(Region, -PercentOfIntl))


# Make the percentages out of 100 instead of fractions
intl$PercentOfIntl = intl$PercentOfIntl * 100

# Make the plot( removing the x axis labels,adjusting the lables for clarity, giving color, show labels diagonally
ggplot(intl, aes(x=Region, y=PercentOfIntl)) +
geom_bar(stat="identity", fill="dark blue") +
geom_text(aes(label=PercentOfIntl), vjust=-0.4) +
ylab("Percent of International Students") +
theme(axis.title.x = element_blank(), axis.text.x = element_text(angle = 45, hjust = 1))

------------WorldMap Plots---------------------------

# Load the ggmap package
library(ggmap)

# Load in the international student data
intlall = read.csv("intlall.csv",stringsAsFactors=FALSE)

# Lets look at the first few rows
head(intlall)

# Those NAs are really 0s, and can be replaced easily
intlall[is.na(intlall)] = 0


# Load the world map
world_map = map_data("world")
str(world_map)

# To merge intlall into world_map using the merge command
world_map = merge(world_map, intlall, by.x ="region", by.y = "Citizenship")
str(world_map)

# Plot the map
ggplot(world_map, aes(x=long, y=lat, group=group)) +
  geom_polygon(fill="white", color="black") +
  coord_map("mercator")

# Reorder the data
world_map = world_map[order(world_map$group, world_map$order),]

# Redoing the plot
ggplot(world_map, aes(x=long, y=lat, group=group)) +
  geom_polygon(fill="white", color="black") +
  coord_map("mercator")

# Looking for the exact name used for China
table(intlall$Citizenship) 

# Fixing China's name in the intlall dataset
intlall$Citizenship[intlall$Citizenship=="China (People's Republic Of)"] = "China"

# To repeat the merge and order from before
world_map = merge(map_data("world"), intlall, 
                  by.x ="region",
                  by.y = "Citizenship")
world_map = world_map[order(world_map$group, world_map$order),]

ggplot(world_map, aes(x=long, y=lat, group=group)) +
  geom_polygon(aes(fill=Total), color="black") +
  coord_map("mercator")

# Another Visually intersting plot in Maps
ggplot(world_map, aes(x=long, y=lat, group=group)) +
  geom_polygon(aes(fill=Total), color="black") +
  coord_map("ortho", orientation=c(20, 30, 0))

ggplot(world_map, aes(x=long, y=lat, group=group)) +
  geom_polygon(aes(fill=Total), color="black") +
  coord_map("ortho", orientation=c(-37, 175, 0))
