## Getting and Cleaning Data - Course Project

### Objective:
The Course Project Objective is to prepare tidy data that can be used for analysis purpose.

### Introduction:
This assignment uses data from accelerometers from the Samsung Galaxy S smart phone.

* Dataset: UCI HAR Dataset [269 MB]
* Dataset URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Steps used to create tidy dataset:

#### Merge the training and test datasets to create one data set:
1. Downloaded the data using download.file function and unzipped it using unzip function

2. Loaded Features (features.txt) and Activity Label (activity_labels.txt) datasets in R using read.table function
* 'features.txt': List of names of all measurement variables
* 'activity_labels.txt': Links the class labels with volunteer's activity name

3. Read below mentioned files from each of train and test folders
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. (70% of Volunteers) 
* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. (30% of Volunteers) 
* 'train/X_train.txt': Training set (a 561-feature vector with time and frequency domain variables)
* 'train/y_train.txt': Training activity labels
* 'test/X_test.txt': Test set (a 561-feature vector with time and frequency domain variables)
* 'test/y_test.txt': Test activity labels

4. Created consolidated Train Dataset using cbind function on datasets created from below mentioned files
* 'train/subject_train.txt'
* 'train/y_train.txt'
* 'train/X_train.txt'

5. Created consolidated Test Dataset using cbind function on datasets created from below mentioned files
* 'test/subject_test.txt'
* 'test/y_test.txt'
* 'test/X_test.txt'

6. Combined the above two consolidated Train and Test datasets using rbind function

This completes the merging of training and test datasets to create one data set.

#### Extracting only the measurements on the mean and standard deviation for each measurement:
1. Used grep function to get column indices of merged data containing mean and standard deviation in the column names 

2. Subsetted the merged data using these column indices along with subject and activity code

This completes the extraction of only the measurements on the mean and standard deviation for each measurement.

#### Assigning descriptive activity names to name the activities in the data set:
* Merged the dataset created in last step with activity label dataset using merge function

#### Labeling the data set with descriptive variable names:
1. Used dataset created using features.txt to allocate column names to a dataset of x_train.txt and x_test.txt
* Note: This step was done while loading x_train.txt and x_test.txt in R 

#### Creating a second, independent tidy data set with the average of each variable for each activity and each subject:
1. Used melt function to restructure dataset in such a way that all measurement variables and their values will be listed in a two seperate columns across each combination of subject and activity label

2. Used dcast function to do pivoting of dataset in the required format i.e. Creating a dataset with the average of each variable for each activity and each subject

This completes the creation of a second, independent tidy data set with the average of each variable for each activity and each subject.

## This Completes the Project Assignment.