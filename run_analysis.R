## Set Working directory to UCI HAR Dataset provided by instructors.
# setwd("UCI HAR Dataset") This will depend on where you saved the UCI HAR Dataset.

# Load dplyr package
library(dplyr)

# Load featurelist from file
featurelist<-read.table("features.txt")

# Load activity labels from file
activitylabels<-read.table("activity_labels.txt",colClasses = c("numeric","character"))

# Give activitylables readable names
names(activitylabels)<-c("Index","Activity")

# Load test data from files
testsubject<-read.table("test/subject_test.txt")
x_test<-read.table("test/X_test.txt")
y_test<-read.table("test/y_test.txt")

# Load train data from files
trainsubject<-read.table("train/subject_train.txt")
x_train<-read.table("train/X_train.txt")
y_train<-read.table("train/y_train.txt")

# Mark Test subjects and training subjects
testsubject<-mutate(testsubject,DataType = "Test")
trainsubject<-mutate(trainsubject,DataType = "Train")

# Merge test and train data
totalsubj<-rbind(testsubject,trainsubject)
x_total<-rbind(x_test,x_train)
y_total<-rbind(y_test,y_train)

# Finish naming totalsubj with readable names
names(totalsubj)[1]<-"subjectID"

# Cleanup unmerged data
rm("testsubject","x_test","y_test")
rm("trainsubject","x_train","y_train")

# Idendity columns containing "mean" and "std" in them
keep_columns<-grep("mean|std",featurelist$V2)

# Reduce x_total and featurelist variables to only the columns/rows in keep_columns
x_total<-select(x_total,keep_columns)
featurelist<-featurelist[keep_columns,]

# Apply names from featurelist to x_total
names(x_total)<-featurelist$V2

# Clean names
names(x_total)<-gsub("-","",names(x_total))
names(x_total)<-gsub("\\(","",names(x_total))
names(x_total)<-gsub("\\)","",names(x_total))

# Name y_total with readable names
names(y_total)<-"Activity"

# Initialize new data frame to store converted y_test data
y_total2<-data.frame(rep("a",nrow(y_total)),stringsAsFactors = FALSE)
names(y_total2)<-"Activity"

# Convert y_test into y_test2 replacing values with named Activity type.
# Basically this is my hack version of Vlookup
for(i in 1:nrow(y_total)){
     y_total2[i,]<-activitylabels$Activity[y_total[i,]]
}

# Cleanup y_total
rm("y_total")

# Merge tables together
myData<-cbind(totalsubj,y_total2,x_total)

# Final Cleanup
rm("totalsubj","y_total2","x_total")

# Add group by index to myData
myData<-group_by(myData,DataType,subjectID,Activity)

# Summarize data columns using the mean funciton
mytidydata<-summarize_each(myData,funs(mean))

# export tidy data set to working directory
write.csv(mytidydata,file="tidydata.csv")