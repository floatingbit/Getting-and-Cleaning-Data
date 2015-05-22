library(dplyr)

#Read training data into following variables
x_train = read.fwf("UCI HAR Dataset/train/X_train.txt", widths = c(rep(16,561)))
y_train = read.table("UCI HAR Dataset/train/y_train.txt", col.names = "activity_id")

#Read testing data into following variables
x_test = read.fwf("UCI HAR Dataset/test/X_test.txt", widths = c(rep(16,561)))
y_test = read.table("UCI HAR Dataset/test/y_test.txt", col.names = "activity_id")

#Merge the data with labels for test and train data individually
train_data = cbind(x_train, y_train)
test_data = cbind(x_test, y_test)

#Merge test and train data
uci_dataset = rbind(train_data, test_data)

#Extract the mean() and std() for all records
cols_of_interest = c(1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,
                     123,124,125,126,161,162,163,164,165,166,201,202,214,215,
                     227,228,240,241,253,254,266,267,268,269,270,271,345,346,
                     347,348,349,350,424,425,426,427,428,429,503,504,516,517,
                     529,530,542,543, 562)

activity_labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
                    "SITTING", "STANDING", "LAYING")

uci_dataset_features_of_interest = uci_dataset[,cols_of_interest]

uci_dataset_features_of_interest$activity_id =
    factor(uci_dataset_features_of_interest$activity_id,
           labels = activity_labels)

#Rename all the columns
col_names = c("tBodyAcc-mean()-X",
              "tBodyAcc-mean()-Y",
              "tBodyAcc-mean()-Z",
              "tBodyAcc-std()-X",
              "tBodyAcc-std()-Y",
              "tBodyAcc-std()-Z",
              "tGravityAcc-mean()-X",
              "tGravityAcc-mean()-Y",
              "tGravityAcc-mean()-Z",
              "tGravityAcc-std()-X",
              "tGravityAcc-std()-Y",
              "tGravityAcc-std()-Z",
              "tBodyAccJerk-mean()-X",
              "tBodyAccJerk-mean()-Y",
              "tBodyAccJerk-mean()-Z",
              "tBodyAccJerk-std()-X",
              "tBodyAccJerk-std()-Y",
              "tBodyAccJerk-std()-Z",
              "tBodyGyro-mean()-X",
              "tBodyGyro-mean()-Y",
              "tBodyGyro-mean()-Z",
              "tBodyGyro-std()-X",
              "tBodyGyro-std()-Y",
              "tBodyGyro-std()-Z",
              "tBodyGyroJerk-mean()-X",
              "tBodyGyroJerk-mean()-Y",
              "tBodyGyroJerk-mean()-Z",
              "tBodyGyroJerk-std()-X",
              "tBodyGyroJerk-std()-Y",
              "tBodyGyroJerk-std()-Z",
              "tBodyAccMag-mean()",
              "tBodyAccMag-std()",
              "tGravityAccMag-mean()",
              "tGravityAccMag-std()",
              "tBodyAccJerkMag-mean()",
              "tBodyAccJerkMag-std()",
              "tBodyGyroMag-mean()",
              "tBodyGyroMag-std()",
              "tBodyGyroJerkMag-mean()",
              "tBodyGyroJerkMag-std()",
              "fBodyAcc-mean()-X",
              "fBodyAcc-mean()-Y",
              "fBodyAcc-mean()-Z",
              "fBodyAcc-std()-X",
              "fBodyAcc-std()-Y",
              "fBodyAcc-std()-Z",
              "fBodyAccJerk-mean()-X",
              "fBodyAccJerk-mean()-Y",
              "fBodyAccJerk-mean()-Z",
              "fBodyAccJerk-std()-X",
              "fBodyAccJerk-std()-Y",
              "fBodyAccJerk-std()-Z",
              "fBodyGyro-mean()-X",
              "fBodyGyro-mean()-Y",
              "fBodyGyro-mean()-Z",
              "fBodyGyro-std()-X",
              "fBodyGyro-std()-Y",
              "fBodyGyro-std()-Z",
              "fBodyAccMag-mean()",
              "fBodyAccMag-std()",
              "fBodyBodyAccJerkMag-mean()",
              "fBodyBodyAccJerkMag-std()",
              "fBodyBodyGyroMag-mean()",
              "fBodyBodyGyroMag-std()",
              "fBodyBodyGyroJerkMag-mean()",
              "fBodyBodyGyroJerkMag-std()",
              "activity_label",
              "subject_id")

#Read subject_ids
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject_id")
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject_id")

subject_ids = rbind(subject_train, subject_test)

uci_dataset_features_of_interest$subject_id = subject_ids$subject_id

colnames(uci_dataset_features_of_interest) = col_names

tidy_dataset = data.frame()
for(i in seq(1:30)){

    selected_subjects = filter(uci_dataset_features_of_interest, subject_id == i)

    for(activity in activity_labels){
        selected_subject_activity = filter(selected_subjects, activity_label == activity)

        col_means = colMeans(selected_subject_activity[,1:66])
        #col_means$activity_label = activity
        #col_means$subject_id = i
        tidy_dataset = rbind(tidy_dataset, col_means)
    }
}

tidy_dataset$activity_label = activity_labels

subject_ids = list()
for(i in seq(1:30)){
    subject_ids = append(subject_ids,rep(i,6))
}


tidy_dataset$subject_id = unlist(subject_ids)

colnames(tidy_dataset) = col_names

write.table(tidy_dataset, "tidy_dataset.txt", row.names = F)
