# GCDataProject
Course Project of Getting and Cleaning Data (coursera)

run_analysis.R is a script that will create the required tidy data set if run when the directory "UCI HAR Dataset" is present in the working directory. The data set will be stored as a data frame in the object FinalData. The needed packages are automatically loaded when running the script. The package "plyr" must be installed before running the script.

# functioning of the script
Specifically, the script will load all the necessary data into separate objects. Y data (activities) will be added to the train and test data sets along with subject as additional columns (2nd and 1st).
The specified columns, referring to mean and standard deviation measurments will be selected.
A final data set will be created containg the mean of every measurement for each variable, for each activity, performed by each subject.
