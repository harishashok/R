--Reading the dataset into R console
kos=read.csv("dailyKos.csv")

--Calculating the Euclidean distance for the variables
kosDist=dist(kos[2:1545],method="euclidean")

--Generating the hierarchial clustering model 
kosModel= hclust(kosDist, method="ward.D")
plot(kosModel) --plotting the Dendrogram and identifying the potential clusters

--To split the data into clusters and to compute the cluster number
groups=cutree ( kosModel, k=7)

--use the subset function 7 times to split the data into the 7 clusters
clust1=subset(dailyKos,groups==1)
clust2=subset(dailyKos,groups==2)
clust3=subset(dailyKos,groups==3)
clust4=subset(dailyKos,groups==4)
clust5=subset(dailyKos,groups==5)
clust6=subset(dailyKos,groups==6)
clust7=subset(dailyKos,groups==7)

--Alternative method to split the data into clusters
clust=split(dailyKos,groups)
clust[1],clust[2] --can be used to find the observations in the respective clusters

--To find the top 6 words in each cluster 
tail(sort(colMeans(clust1)))


