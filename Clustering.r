******The file AirlinesCluster.csv contains information on 3,999 members of the frequent flyer program. This data comes from the textbook "Data Mining for Business Intelligence," by Galit Shmueli, Nitin R. Patel, and Peter C. Bruce. For more information, see the website for the book.*****

--Reading the dataset into the R console
airlines=read.csv("AirlinesCluster.csv")

****why should we normalize the data before clustering?????*********
****If we don't normalize the data, the clustering will be dominated by the variables that are on a larger scale.***** 

--Normalizing the data by preProcessing()
library(caret)
preProc=preProcess(airlines)  
airlinesNorm=predict(preproc,airlines)   --created a normalized data frame called "airlinesNorm"

--compute the average values for all variables in each of the clusters 
tapply(airlines$Balance, clusterGroups, mean)
tapply(airlines$QualMiles, clusterGroups, mean)
tapply(airlines$BonusMiles, clusterGroups, mean)
tapply(airlines$BonusTrans, clusterGroups, mean)
tapply(airlines$FlightMiles, clusterGroups, mean)
tapply(airlines$FlightTrans, clusterGroups, mean)
tapply(airlines$DaysSinceEnroll, clusterGroups, mean)

--Advanced Explanation:

Instead of using tapply, you could have alternatively used colMeans and subset, as follows:
colMeans(subset(airlines, clusterGroups == 1))
colMeans(subset(airlines, clusterGroups == 2))
colMeans(subset(airlines, clusterGroups == 3))
colMeans(subset(airlines, clusterGroups == 4))
colMeans(subset(airlines, clusterGroups == 5))
This only requires 5 lines of code instead of the 7 above. 

****But an even more compact way of finding the centroids would be to use the function "split" to first split the data into clusters,
and then to use the function "lapply" to apply the function "colMeans" to each of the clusters******

lapply(split(airlines, clusterGroups), colMeans)

In just one line, you get the same output as you do by running 7 lines like we do above. 
To learn more about these functions, type ?split or ?lapply in your R console. 
Note that if you have a variable named split in your R session, you will need to remove it with rm(split) before you can 
use the split 
