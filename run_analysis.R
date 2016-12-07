# install.packages("downloader")  ## -- uncomment if downloader package is not installed
# install.packages("reshape2")  ## -- uncomment if reshape2 package is not installed
# install.packages("dplyr")  ## -- uncomment if dplyr package is not installed
# install.packages("plyr")  ## -- uncomment if plyr package is not installed

# loading required libraries
library(downloader)
library(reshape2)
library(dplyr)
library(plyr)


## Part 1 - Downloading and Unzipping to get raw data
# checking, if directory exists else one is created
if(!dir.exists("./PGA_CP_Data")){dir.create("./PGA_CP_Data")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Downloading data from the url
download(url,dest = "./PGA_CP_Data/Data.zip",mode = "wb")
rm(url)

# Unzip the folder
unzip(zipfile = "./PGA_CP_Data/Data.zip",exdir = "./PGA_CP_Data")
## End of Part 1

## Part 2 - Importing and collating raw data into R
# Changing the Working directory to unzipped folder
list.files("./PGA_CP_Data")
setwd(paste("./PGA_CP_Data",list.files("./PGA_CP_Data")[2],sep="/"))

# Importing and collating train Data
subjects_train <- read.table("./train/subject_train.txt",stringsAsFactors = F,col.names = "subject")
train_feature_data <- read.table("./train/X_train.txt",stringsAsFactors = F)
train_activities <- read.table("./train/y_train.txt",stringsAsFactors = F,col.names = "activity")

train_data <- data.frame(subjects_train, train_activities,train_feature_data)
rm(subjects_train,train_feature_data,train_activities)

# Importing and collating test data
subjects_test <- read.table("./test/subject_test.txt",stringsAsFactors = F,col.names="subject")
test_feature_data <- read.table("./test/X_test.txt",stringsAsFactors = F)
test_activities <- read.table("./test/y_test.txt",stringsAsFactors = F,col.names = "activity")

test_data <- data.frame(subjects_test, test_activities,test_feature_data)
rm(subjects_test,test_activities,test_feature_data)
# Merging train and test sets to create one dataset
Data1 <- rbind(train_data,test_data)
rm(train_data,test_data)

## Loading feature data
features <- read.table("features.txt",stringsAsFactors = F,col.names=c("feature_id","feature"))
#Extracting only the measurements on the mean and standard deviation for each measurement.
colnames <- paste("V",features$feature_id,sep="")
Data2 <- Data1[,c("subject","activity",colnames[grepl("mean|std",features$feature)])]
features$feature_id = colnames

## converting activity number to Descriptive activity names
# loading Actitivy number to name mapping
activity_labels <- read.table("activity_labels.txt",stringsAsFactors = F,col.names=c("activity","activity_name"))
Data3 <- Data2 %>% merge(activity_labels,by="activity",all.x=T) %>% select(subject,activity_name,everything(),-activity)
rm(activity_labels,colnames)

## Adding Desccriptive Variable names
var_names <- features$feature[match(grep("V",names(Data3),value=T),features$feature_id)]
names(Data3) <- c("subject","activity",var_names)
rm(features,var_names)
## End of Part 2

## Part 3 - Tidying Data
## Tidy Data
TidyData <- Data3 %>% melt(id.vars=c("subject","activity"),variable.name = "feature",value.name="measure") %>%
                        ddply(.(subject,activity,feature),summarise,averageScore = mean(measure,na.rm=T)) %>%
                              arrange(subject,activity,feature)
write.table(TidyData,"../TidyData.txt",row.names=FALSE)
## End of part 3
