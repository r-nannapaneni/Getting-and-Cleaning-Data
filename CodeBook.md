#Code Book

##Introduction
This repository contains a R script and supporting files of my work done as part of a course project - **Getting & Cleaning Data on Coursera**

##Data Source
Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Full Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Raw files

The Zip file includes:
- 'README.txt' : Gives information regarding the files and raw data

- 'features_info.txt': Gives littel more detail on the mfeatures and their measurements

- 'features.txt': Mapping file for feature names and labels

- 'activity_labels.txt': Mapping file for labels and the activity names

- 'train/X_train.txt': Training data set.

- 'train/y_train.txt': labels for the training data set.

- 'test/X_test.txt': Test data set.

- 'test/y_test.txt': labels for the test data set.

##Transformations
- The measurement data is clubbed with the subject and activity data for both test and train data sets
- The train and test sets are merged to form on single data set
- The feature labels and mapping descriptive names are loaded and the features pertaining to mean and Stanadard deaviation are selected
- A subset of the merged data is selected which has measurement data of the slected features for all the subjects
- The activity labels are trabsformed to corresponding descriptive names using the acticity mapping file
- The feature names are cleaned to lower case after eliminating "-" or "()"
- The final data set is aggregated to subject and activity level with average values of each measurement

##Tidy data Description

Subject: Contains Subject id varying from 1 to 30

Activity: Contains activity name : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and  LAYING

The rest of the columns contain average mean and standard deviation measurements for a given subject id while performing a given activity of 

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag
