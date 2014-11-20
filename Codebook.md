Codebook
===

Refer to the README.txt in the UCI HAR Dataset folder for more information on the raw data.

run_analysis.R
---

1. Read in data from the source folder to the following objects
* activity_labels - activity_labels.txt
* features - features.txt
* train.x - X_train.txt
* train.y - y_train.txt
* train.subject - subject_train.txt
* test.x - X_test.txt
* test.y - y_test.txt
* test.subject - subject_test.txt
2. Combine the train and test data into the following objects
* data.x
* data.y
* data.subject
3. Label all the headers
4. For data.x, only keep the columns that have "std" or "mean"
5. Combine the data with the subject and activity into data object
6. Lookup the activity names
7. Aggregate means of data by activity and subject into tidy object
8. Remove the redundant subject and activity columns
9. Rename the combined column headers for subject and activity
10. Write the tidy data to the file tidy.txt
