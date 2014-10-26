
##Step 1: Merge data of all files
#   Files needed to be read:

# - 'features.txt': List of all features.
features = read.table("UCI HAR Dataset//features.txt", sep = " ", header = FALSE) 

# - 'activity_labels.txt': Links the class labels with their activity name.
activity_labels = read.table("UCI HAR Dataset//activity_labels.txt", sep = " ", header = FALSE) 

# - 'train/X_train.txt': Training set
train.X = read.table("UCI HAR Dataset//train//X_train.txt", header = FALSE)

# - 'train/y_train.txt': Training labels.
train.Y = read.table("UCI HAR Dataset//train//y_train.txt", header = FALSE) 

# - 'test/X_test.txt': Test set.
test.X = read.table("UCI HAR Dataset//test//X_test.txt", header = FALSE) 

# - 'test/y_test.txt': Test labels.
test.Y = read.table("UCI HAR Dataset//test//y_test.txt", header = FALSE) 

# The following files are available for the train and test data. Their descriptions are equivalent. 
# 
# - 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
train.subject_train = read.table("UCI HAR Dataset//train//subject_train.txt", header = FALSE) 

# - 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_y_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
train.internialsignal.total_acc_x = read.table("UCI HAR Dataset//train/Inertial Signals/total_acc_x_train.txt", header = FALSE) 
train.internialsignal.total_acc_y = read.table("UCI HAR Dataset//train/Inertial Signals/total_acc_y_train.txt", header = FALSE) 
train.internialsignal.total_acc_z = read.table("UCI HAR Dataset//train/Inertial Signals/total_acc_z_train.txt", header = FALSE) 

# - 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
train.internialsignal.body_acc_x = read.table("UCI HAR Dataset//train/Inertial Signals/body_acc_x_train.txt", header = FALSE) 
train.internialsignal.body_acc_y = read.table("UCI HAR Dataset//train/Inertial Signals/body_acc_y_train.txt", header = FALSE) 
train.internialsignal.body_acc_z = read.table("UCI HAR Dataset//train/Inertial Signals/body_acc_z_train.txt", header = FALSE) 

# - 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
train.internialsignal.body_gyro_x = read.table("UCI HAR Dataset//train/Inertial Signals/body_gyro_x_train.txt", header = FALSE) 
train.internialsignal.body_gyro_y = read.table("UCI HAR Dataset//train/Inertial Signals/body_gyro_y_train.txt", header = FALSE) 
train.internialsignal.body_gyro_z = read.table("UCI HAR Dataset//train/Inertial Signals/body_gyro_z_train.txt", header = FALSE) 

# - 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
test.subject_test = read.table("UCI HAR Dataset//test//subject_test.txt", header = FALSE) 

# - 'test/Inertial Signals/total_acc_x_test.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_y_test.txt' and 'total_acc_z_test.txt' files for the Y and Z axis. 
test.internialsignal.total_acc_x = read.table("UCI HAR Dataset//test/Inertial Signals/total_acc_x_test.txt", header = FALSE) 
test.internialsignal.total_acc_y = read.table("UCI HAR Dataset//test/Inertial Signals/total_acc_y_test.txt", header = FALSE) 
test.internialsignal.total_acc_z = read.table("UCI HAR Dataset//test/Inertial Signals/total_acc_z_test.txt", header = FALSE) 

# - 'test/Inertial Signals/body_acc_x_test.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
test.internialsignal.body_acc_x = read.table("UCI HAR Dataset//test/Inertial Signals/body_acc_x_test.txt", header = FALSE) 
test.internialsignal.body_acc_y = read.table("UCI HAR Dataset//test/Inertial Signals/body_acc_y_test.txt", header = FALSE) 
test.internialsignal.body_acc_z = read.table("UCI HAR Dataset//test/Inertial Signals/body_acc_z_test.txt", header = FALSE) 

# - 'test/Inertial Signals/body_gyro_x_test.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
test.internialsignal.body_gyro_x = read.table("UCI HAR Dataset//test/Inertial Signals/body_gyro_x_test.txt", header = FALSE) 
test.internialsignal.body_gyro_y = read.table("UCI HAR Dataset//test/Inertial Signals/body_gyro_y_test.txt", header = FALSE) 
test.internialsignal.body_gyro_z = read.table("UCI HAR Dataset//test/Inertial Signals/body_gyro_z_test.txt", header = FALSE) 

#Merge

##Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

##Step 3: Uses descriptive activity names to name the activities in the data set

##Step 4: Appropriately labels the data set with descriptive variable names

##Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject