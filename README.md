Getting-and-Cleaning-Data
=========================

This project deals with merging the training and test datasets as found at: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

run_script.R requires data folder UCI HAR Dataset to be present in the working 
directory

The code is an implementation of the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Execute run_analysis.R ensuring that the UCI HAR Dataset folder is available in the working directory. 

Output produced: tidy_dataset.txt which contains 66 columns measuring the following along with two additional columns which contain the subject_id and the activity label corresponding to each row in the dataset (180 rows in total).