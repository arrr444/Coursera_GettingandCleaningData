Coursera_GettingandCleaningData
===============================

Intro
-----
This Repository contain explanation to the work done and how every thing fits together

Data
====
Raw data is gathered from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
its contains directory "UCI HAR Dataset" which contains the following files and folders

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


WorkDone
========
Created a run_analysis.R script file to contain all the scripts
1. Extracted the Features
2. Extracted the Test Set data
3. Extracted the Train Set data
5. Extracts only the measurements on the mean and standard deviation for each measurement. 
6. Uses descriptive activity names to name the activities in the data set
7. Appropriately labels the data set with descriptive variable names. 
8. Merges the training and the test sets to create one data set.
9. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

10. Run the R script to generate the tidy data set in the same working directory