### Codebook

## Variable list with description

##featurelist - Stores data from the features.txt file (character)
##activitylabels - Stores data from the activitylabels.txt file (character)
##testsubject - Stores list of subject ID's from the test group (integer)
##x_test - Contains data elements for test subjects (numeric)
##y_test - Contains activity type for test subjects (integer)
##trainsubject - Stores list of subject ID's from the training group (integer)
##x_train - Contains data elements for training subjects (numeric)
##y_train - Contains activity type for training subjects (integer)
##totalsubj - Stores list of subject ID's for both groups after merging. (numeric)
   Rbind is used to join testsubject and trainsubject into one table.
##x_total - Contains data elements for both groups after merging. (numeric)
   Rbind is used to join x_test and x_train into one table.
##y_total - Contains activity type for both groups after merging. (integer)
   Rbind is used to join y_test and y_train into one table.
##y_total2 - Contains activity type for both groups after conversion. (character)
   Replaced numeric values of activity type with named value of activity type.
##keep_columns - Vector containing column locations of desired data in the data set. (integer)
   Columns identified using grep for "mean" or "str"
##myData - Single data frame for storing data after last merge.
   Cbind is used to merge totalsubj, x_total and y_total2
##mytidydata - Singe data frame for storing data after it is summarized.
   Summarize (dplyr) is used to find the mean of the data columns by subjectID and by Activity

## List of columns selected from the data set:
tBodyAccmeanX
tBodyAccmeanY
tBodyAccmeanZ
tBodyAccstdX
tBodyAccstdY
tBodyAccstdZ
tGravityAccmeanX
tGravityAccmeanY
tGravityAccmeanZ
tGravityAccstdX
tGravityAccstdY
tGravityAccstdZ
tBodyAccJerkmeanX
tBodyAccJerkmeanY
tBodyAccJerkmeanZ
tBodyAccJerkstdX
tBodyAccJerkstdY
tBodyAccJerkstdZ
tBodyGyromeanX
tBodyGyromeanY
tBodyGyromeanZ
tBodyGyrostdX
tBodyGyrostdY
tBodyGyrostdZ
tBodyGyroJerkmeanX
tBodyGyroJerkmeanY
tBodyGyroJerkmeanZ
tBodyGyroJerkstdX
tBodyGyroJerkstdY
tBodyGyroJerkstdZ
tBodyAccMagmean
tBodyAccMagstd
tGravityAccMagmean
tGravityAccMagstd
tBodyAccJerkMagmean
tBodyAccJerkMagstd
tBodyGyroMagmean
tBodyGyroMagstd
tBodyGyroJerkMagmean
tBodyGyroJerkMagstd
fBodyAccmeanX
fBodyAccmeanY
fBodyAccmeanZ
fBodyAccstdX
fBodyAccstdY
fBodyAccstdZ
fBodyAccmeanFreqX
fBodyAccmeanFreqY
fBodyAccmeanFreqZ
fBodyAccJerkmeanX
fBodyAccJerkmeanY
fBodyAccJerkmeanZ
fBodyAccJerkstdX
fBodyAccJerkstdY
fBodyAccJerkstdZ
fBodyAccJerkmeanFreqX
fBodyAccJerkmeanFreqY
fBodyAccJerkmeanFreqZ
fBodyGyromeanX
fBodyGyromeanY
fBodyGyromeanZ
fBodyGyrostdX
fBodyGyrostdY
fBodyGyrostdZ
fBodyGyromeanFreqX
fBodyGyromeanFreqY
fBodyGyromeanFreqZ
fBodyAccMagmean
fBodyAccMagstd
fBodyAccMagmeanFreq
fBodyBodyAccJerkMagmean
fBodyBodyAccJerkMagstd
fBodyBodyAccJerkMagmeanFreq
fBodyBodyGyroMagmean
fBodyBodyGyroMagstd
fBodyBodyGyroMagmeanFreq
fBodyBodyGyroJerkMagmean
fBodyBodyGyroJerkMagstd
fBodyBodyGyroJerkMagmeanFreq


