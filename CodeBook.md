## CodeBook for FinalData.txt
# General characteristics
The file contains 180 observations of 88 variables. The first column, named "Subject" contains the
id number of the subject whose activity data was measured.
The second column contains the activity performed whereas the remaining columns contain the average of some 
selected measurements performed by the device.
Column names are provided in the file, Row names are not.
Each row contains the measurement of each variable, for each activity, performed by each subject.
The rows are ordered based on the subject and the on the activity.
# Loading the dataset on R
You can load the dataset on R using the function read.table with argument header = TRUE.
