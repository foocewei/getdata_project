## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(data.table)

## Assume that UCI HAR Dataset has been unzipped into the working directory

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")[,2]

## Read in the training data
train.x <- read.table("UCI HAR Dataset/train/X_train.txt")
train.y <- read.table("UCI HAR Dataset/train/y_train.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")

## Read in the test data
test.x <- read.table("UCI HAR Dataset/test/X_test.txt")
test.y <- read.table("UCI HAR Dataset/test/y_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")

## Merge the training and test data
data.x <- rbind(train.x, test.x)
data.y <- rbind(train.y, test.y)
data.subject <- rbind(train.subject, test.subject)

## Label the headers
colnames(data.x) <- features
colnames(data.y) <- "ActivityCode"
colnames(data.subject) <- "Subject"
colnames(activity_labels) <- c("ActivityCode", "Activity")

## Only keep the data that are mean or std
data.x <- data.x[,grepl("std|mean", features)]

## Combine the mean/std data with the subject and activity
data <- cbind(data.x, data.subject, data.y)

## Lookup the activity names
data <- merge(data, activity_labels, by="ActivityCode")


## Tidy data set by activity and subject
tidy <- aggregate(data, by=list(data$Activity, data$Subject), mean)

## Remove redundant columns
tidy <- subset(tidy, select = -c(Subject, Activity))

## Rename column headers
colnames(tidy)[1] <- "Activity"
colnames(tidy)[2] <- "Subject"

## Write to file
write.table(tidy, file = "tidy.txt", row.name=FALSE)



