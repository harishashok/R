-- To replace variable names with aliases

library(data.table)

setnames(data,old=c("X17.99", "X0.1184", "X0.2776"),new=c("radius_mean","area_mean","smooth_mean"))

 table(pati$radius_mean)
 
 --To import a dataset in Github into R console
 
 library(foreign)
> url<-"https://github.com/stedy/Machine-Learning-with-R-datasets/blob/master/wisc_bc_data.csv"
> disproportionality.data <- getURL(url)
> disproportionality.data <- read.csv(textConnection(disproportionality.data))
> str(disproportionality.data)

-- Creating a normalization functionto rescale all the variables to a standard range of values

normalize  =  function(x) {
return((x-min(x))/(max(x)-min(x)))
}

-- lapply() takes a list and applies the function to each item in the list
>pati_n = as.data.frame(lapply(pati[2:31],normalize))

--scale() will rescore the values using Z-scale standardization
>pati_Z=as.data.frame(scale(pati[-1]))
>summary(pati_z$area_mean)--> z-scale standardized values

--to display a scatterplot & with more information 
pairs(insurance[c("age","bmi","children","charges")])
>
library(psych)
>pairs.panels(insurance[c("age","bmi","children","charges")])

------------------------------------------------------------------------------------
-- To add ggplots
library(ggplot2)
***Make sure the ggplot has the following paramerters. 1) Data 2) Aesthetic property (shape,color ..) 3) Geometric Property(lines,boxes..)**
scatterPlot= ggplot(WHO, aes(x= var1, y= var2))
scatterPlot + geom_point()   -- Plots with points
scatterPlot + geom_line()    -- Plots with lines
scatterPlot + geom_point(color = "blue", size = 3, shape = 17)   -- to create plots with properties (17= triangles)
            + ggtitle("name")

-- TO save the plot to a file
Load the plot command into a variable
pdf("Myplot.pdf")
print(plotname)
dev.off() -- to close the file

# Make a heatmap:
ggplot(DayHourCounts, aes(x = Hour, y = Var1)) + geom_tile(aes(fill = Freq))
# Change the label on the legend, and get rid of the y-label:
ggplot(DayHourCounts, aes(x = Hour, y = Var1)) + geom_tile(aes(fill = Freq)) + scale_fill_gradient(name="Total MV Thefts") + theme(axis.title.y = element_blank())
# Change the color scheme
ggplot(DayHourCounts, aes(x = Hour, y = Var1)) + geom_tile(aes(fill = Freq)) + scale_fill_gradient(name="Total MV Thefts", low="white", high="red") + theme(axis.title.y = element_blank())









