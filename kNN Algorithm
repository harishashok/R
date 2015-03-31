**Using the kNN algorithm to classify the dataset as Malign or Benign condition for the given dataset**

**Download the wisconsin womens cancer dataset at uci machineLearning repository**

-- Read the dataset into the variable pati

pati <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)

-- id variable conflicts with other variable,so removing it
pati<- pati[-1]     --removed

--table() shows the composition of observations
table(pati$diagnosis)

--converting the dependent variable as factors 
pati$diagnosis=factor(pati$diagnosis)

--rounding off the values and display the proportion in percentage using prop.table()
round(prop.table(table(pati$diagnosis)*100),digits=2)

--Picking three variable to be considered for the modeling
library(table.data)
setnames(pati,old=c("X17.99", "X0.1184", "X0.2776"),new=c("radius_mean","area_mean","smooth_mean"))

--normalizing the variables to rescale the range of values to be between 0 to 1
normalize <- function(x){
return((x-min(x)/((max(x)-min(x)))
}    --we created the normalize() function

-- using lapply() to apply the normalize() to a list of items 
pati_n <- as.data.frame(lapply(pati[2:31],normalize))

--to view the normalized variable enter
table(pati_n$area_mean)

--creating a training and test dataset 
pati_train=pati_n[1:469,]   --[rows,all columns]
pati_test=pati_n[470:569,]  --[rows,all columns]

--including the dependant variable to factor in column 1
train_labels=pati[1:469,1]
test_labels=pati[470:569,1]

--training the model on the data
library(class)
knn_model = knn(pati_train,pati_test,train_lablels,k=21) --k = sq(nrow(pati))

--Using Z-score standardization
pati_z = as.data.frame(scale(pati[-1]))
--normally used to see if the standard normalization is the most accurate. 

--To create a confusion matrix to compute the accuracy
CrossTable(x=test_labels,y=knn_model,prop.chisq=FALSE)


