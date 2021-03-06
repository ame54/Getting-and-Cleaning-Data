
##----------------------------------------------
## Reads file from filepath and apply the lables into a data table
##----------------------------------------------
readAndLabelData <- function (filepath, labels) 
{
  data <- read.table(filepath)    
  colnames(data) <- labels
  data
}

##----------------------------------------------
## This function merges the training and test data sets
## extracted from the "Human Activity Recognition Using Smartphones"
## data, and formats them accordingly
##----------------------------------------------
formatData <- function (directory) {
  
  ## Read activity labels
  activitylabels <- readAndLabelData("activity_labels.txt", c("activityid", "activity"))
  
  ## Read feature labels
  featurelabels <- readAndLabelData("features.txt", c("featureid", "feature"))
  
  ## Read and label the training set data frames
  trainfeatures <- readAndLabelData("train/x_train.txt", featurelabels[,"feature"])
  trainsubjects <- readAndLabelData("train/subject_train.txt", "subject")
  trainactivities <- readAndLabelData("train/y_train.txt", "activityid")
  
  ## Combine the training set data frames
  trainset <- cbind(trainsubjects, trainactivities)
  trainset <- cbind(trainset, trainfeatures)
    
  ## Read in and label the test set data frames
  testfeatures <- readAndLabelData("test/x_test.txt", featurelabels[,"feature"])
  testsubjects <- readAndLabelData("test/subject_test.txt", "subject")
  testactivities <- readAndLabelData("test/y_test.txt", "activityid")
  
  ## Combine the test set data frames
  testset <- cbind(testsubjects, testactivities)
  testset <- cbind(testset, testfeatures)
  
 
  ## ******************************************
  ## Merge the training and test sets into one data set
  ## ******************************************
  mergeddata <- rbind(trainset, testset)
  
  ## Determine column numbers indicative of these measurements
  slctfeatureids <- grep("-mean\\(\\)|-std\\(\\)", featurelabels$feature)
  
  ## Include subject and activity columns in column selection
  slctfeatureids <- c(1,2, slctfeatureids + 2)
  
  ## Extract required columns from data set
  mergeddata <- mergeddata[,slctfeatureids]
  
  ## Join the data set with the activity labels and drop the activity id column
  mergeddata <- merge(activitylabels, mergeddata, by.x="activityid", by.y="activityid", sort=FALSE)
  mergeddata$activityid <- NULL
  
  ## Assign appropriate column names to the measurement variables
  colnames(mergeddata) <- gsub("mean\\(\\)", "Mean", colnames(mergeddata))
  colnames(mergeddata) <- gsub("std\\(\\)", "Std", colnames(mergeddata))
  colnames(mergeddata) <- gsub("-", " ", colnames(mergeddata))
  
  ## Write the dataset to a txt file
  write.table(mergeddata, file="merged_data.txt", row.name=FALSE)
  
  ## Return the formatted data set
  mergeddata
}


##----------------------------------------------
## Create tidy data set of the 
##----------------------------------------------
library(dplyr)
directory <- getwd()

## Extract and clean the main data set
maindata <- formatData(directory)  

## Compute average of each variable, grouped by subject and activity
tidydata <- maindata %>% group_by(subject, activity) %>%  summarise_each(funs(mean))

## Write the dataset to a txt file
write.table(tidydata, file="tidy_data.txt", row.name=FALSE)

## Return the tidy data set
tidydata


