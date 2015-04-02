**Natural Text Processing technique to Automate reviews in Medicine Abstract papers**

**download dataset clinical_trial.csv at U.S. National Library of Medicine**

--Read the dataset with an extra parameter stringsAsFactors=FALSE**
trials=read.csv("clincal_trail.csv",stringsAsFactors = FALSE)

***************************************
**********DATA PREPROCESSING***************
***********************************************
--Creating a corpus(collection of documents containing the words, which needs to be preprocessed--
library(tm)
library(SnowballC)
> corpusTit=Corpus(VectorSource(trials$title))
> corpusAbs=Corpus(VectorSource(trials$abstract))
--Convert all the words to lowercase
> corpusTit=tm_map(corpusTit,tolower)
> corpusAbs=tm_map(corpusAbs,tolower)
--After conversion run the following command--
> corpusTit=tm_map(corpusTit,PlainTextDocument)
> corpusAbs=tm_map(corpusAbs,PlainTextDocument)
--Eleminate the puncuations in the dataset
> corpusAbs=tm_map(corpusAbs,removePunctuation)
> corpusTit=tm_map(corpusTit,removePunctuation)
--Remove all the stopwords in the English Language--
> corpusTit=tm_map(corpusTit,removeWords,stopwords("english"))
> corpusAbs=tm_map(corpusAbs,removeWords,stopwords("english"))
--Stem the words in both the sets
> corpusTit=tm_map(corpusTit,stemDocument)
> corpusAbs=tm_map(corpusAbs,stemDocument)
--Building a DocumentTermMatrix for both sets
> dtmTit=DocumentTermMatrix(corpusTit)
> dtmAbs=DocumentTermMatrix(corpusAbs)
--Limit the two sets to terms with sparseness of at most 95%(terms appear in atleast 5%)
> dtmTit=removeSparseTerms(dtmTit,0.95)
> dtmAbs=removeSparseTerms(dtmAbs,0.95)
--convert both sets to data frames
> dtmTit=as.data.frame(as.matrix(dtmTit))
> dtmAbs=as.data.frame(as.matrix(dtmAbs))
--To find the most frequent words in the abstract--
which.max(colSums(dtmAbs))
--some of the variables in these data frames have the same names. To fix this issue, run the following commands:
>colnames(dtmTit) = paste0("T", colnames(dtmTit))
>colnames(dtmAbs) = paste0("A", colnames(dtmAbs))
--To combine both the dtm sets run,
>dtm=cbind(dtmTit,dtmAbs)
>dtm$trial=trials$trial   --Adding our dependent variable to this dataset

********************************************
*************BUILDING THE MODEL*****************
****************************************************
--Splitting data for training and test set
library(caTools)
> set.seed(144)
> split=sample.split(dtm,SplitRatio=0.7)
> train=subset(dtm,split==TRUE)
> test=subset(dtm,split==FALSE)
--making predictions to calculate the accuracy
table(train$trial)  ---baseline accuracy

****Building CART Model****
library(rpart)
library(rpart.plot)
>CARTmod=rpart(trial~.,data=train,method="class")
> prp(CARTmod)
--Make Predictions on the training data and include only the second column--
> predTrain=predict(CARTmod,newdata=train)[,2]
> summary(predTrain)
--compute the accuracy of the prediction with threshold >0.5
>table(train$trial,predTrain>0.5)    --Yields confusion matrix
--the testing set accuracy can be computed by 
predTest=predict(CARTmod,newdata=test)[,2]
table(test$trial,predTrain>0.5)   --Yields confusion matrix
--to compute the AUC
library(ROCR)
ROCR=prediction(predTest,test$trial)
as.numeric(performance(ROCR,"auc")@y.values)   --Yields AUC value

************************************************************
#Cost associated with making a false negative prediction??
An object in Set A will be missed,affecting the quality of the results of next steps
#Cost associated with making a false positive prediction??
An object will be mistakenly added to set A, yielding additional work in step 2 but does not affect the 
quality of results of step 3
#Cost associated with making a false positive and negative prediction??
A false negative is more costly than a false positive; the decision makes should use a probability
threshold less tahn 0.5 for machine learning model.
************************************************************







