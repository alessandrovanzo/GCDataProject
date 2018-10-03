##This script will process all the required data and eventually create a tidy data set stored into FinalData
##Loading required packages
library(dplyr)
##
##LOADING THE DATASETS
##
##The prerequisite is that the working directory contains the "UCI HAR Dataset" directory 
##in the original (decompressed) form
TestData <- read.table("./UCI HAR Dataset/test/X_test.txt")
TrainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
YTest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
YTrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
SubTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
SubTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
##Adding Y and subject data to X Train and X Test datasets as initial additional columns
TestData <- cbind(SubTest, YTest, TestData)
TrainData <- cbind(SubTrain, YTrain, TrainData)
#MERGING THE TWO DATA SETS
AllData <- rbind(TestData, TrainData)
##NAMING the COLUMNS
##I will assign the name in features.txt to the appropriate variables in All Data, removing prohibited characters (i.e. dash, periods, parenthesis, etc...)
##The first two columns, containing activity and subject data will be named "Subject" and "Activity"
FeatNames <- read.table("./UCI HAR Dataset/features.txt")
FeatNames <- gsub("\\-|\\(|\\)|\\,","",as.character(FeatNames[,2]))
colnames(AllData) <- c("Subject", "Activity", FeatNames)
#Extracting the columns with mean and standard deviation measurements,
#extracting columns that containt either "mean" or "std" in their names,
#regardless of the position of such string in the name (whether it is the beginning, the end or in the middle)
SelectedData <- cbind(AllData[,1:2],AllData[,grep("+[Ss][Tt][Dd]|+[Mm][Ee][Aa][Nn]",names(AllData))])
##SelectedData <- arrange(SelectedData, Subject, Activity)
#Loading activity names and naming the activities
##
##CREATING THE FINAL DATASET
##FinalData will contain the mean of the measurements for each activity performed by each player.
##First i will group SelectedData so to correctly apply the function summarize_all() that will return the mean of
##each variable for each activity performed by each player. The resulting dataframe will be assigned, ungrouped, to FinalData
FinalData <- group_by(SelectedData, Subject, Activity) %>% summarise_all(mean) %>% ungroup()
#Assigning names to each activity, based on what is contained in activity_labels.txt
ActivityNames <-read.table("./UCI HAR Dataset/activity_labels.txt")
ActivityNames <- gsub("_","", as.character(ActivityNames[,2]))
FinalData[,2] <- gsub("","",ActivityNames[unlist(FinalData[,2])])
##THE END##
