# Getting-and-Cleaning-Data

##Repo Objective
- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement.
- Use descriptive activity names to name the activities in the data set
- Appropriately label the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##The Script
- run_analysis.R will download the raw files into your working directory
- Unzip the files and perform the operations required to meet the objectives
- Sourcing the scipt by source("run_analysis.R") would check for library dependencies and install them if they are not present
- The scirpt is divided into 3 parts - Part 1 (Downloading and Unzipping files), Part 2 ( Importing and Collating Data in R), Part 3 (Tidying Data)

Please refer to the Code book to know further on the transformations or how the code works

##Library Dependencies
- dplyr
- rehaspe2
