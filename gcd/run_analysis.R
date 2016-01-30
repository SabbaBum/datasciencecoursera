# # # # # # # # # # # # # # # # # # # # # # # # #
#
# FILE: run_analysis.R
#
# COURSE PROJECT: Getting and cleaning data
#
# TASKS: 1-5 (in order # 2,4,1,3,5)
#
# # # # # # # # # # # # # # # # # # # # # # # # #

require(data.table)
require(dplyr)

# save the current dir
c_start_dir <- getwd()
# get the dir where the R script resides and set it as working
c_work_dir <- dirname(sys.frame(1)$ofile)
setwd(c_work_dir)

# check if there is a fresh ZIP with data
if(!file.exists("UCI_HAR_Dataset.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip","UCI_HAR_Dataset.zip")
}

# unpack the ZIP file if it wasn't done before
if(!file.exists("UCI HAR Dataset")) {
    unzip("UCI_HAR_Dataset.zip")
}

# set the prefix for unzipped data files
c_prefix <- "UCI HAR Dataset/"

#
# now time to read in all data we've got
#

# first, read the names of measurements from codebook
ds_features <- fread(paste0(c_prefix,'features.txt'))
# and make a numeric vector with positions of those who have -mean( or -std( in their name
n_features <- grep("-((mean)|(std))\\(", ds_features$V2)

# COURSE PROJECT TASK #2
#
# read both train and test data files, but only the necessary columns
ds_train_x <- fread(paste0(c_prefix,'train/X_train.txt'), select = n_features)
ds_test_x <- fread(paste0(c_prefix,'test/X_test.txt'), select = n_features)

# COURSE PROJECT TASK #4
#
# get and clean up the feature names, so they can be used later
c_features <- ds_features$V2[n_features]
c_features <- make.names(c_features)
# names with dots in the end and/or multiple dots look ugly, getting rid of them
c_features <- gsub("[.]+$","",c_features)
c_features <- gsub("[.]+",".",c_features)
# do fix the column names in temporary datasets
names(ds_train_x) <- c_features
names(ds_test_x) <- c_features

# read the activity labels to be used in factor variables
ds_activity <- fread(paste0(c_prefix,'activity_labels.txt'))
# read the files with activity codes for main datasets
ds_train_y <- fread(paste0(c_prefix,'train/y_train.txt'))
ds_test_y <- fread(paste0(c_prefix,'test/y_test.txt'))
# read the files with test subject identifiers for main datasets
ds_train_s <- fread(paste0(c_prefix,'train/subject_train.txt'))
ds_test_s <- fread(paste0(c_prefix,'test/subject_test.txt'))

# COURSE PROJECT TASK #1
#
# Combining all source data into the one big dataset
# rbind - puts train and test data rows one after the other
# cbind parts - puts together type, subject, activity and sensor data for each part
HAR_Dataset = rbind(
    cbind(
        setID = factor(1, labels="train"),
        subjectID = ds_train_s$V1,
        activity = as.factor(ds_train_y$V1),
        ds_train_x
    ),
    cbind(
        setID = factor(2, labels="test"),
        subjectID = ds_test_s$V1,
        activity = as.factor(ds_test_y$V1),
        ds_test_x
    )
)

# COURSE PROJECT TASK #3
#
# Putting descriptive activity names as text labels for levels of factor variable
levels(HAR_Dataset$activity) <- ds_activity$V2

# COURSE PROJECT TASK #5
#
# *** Creating an independent data set
# for each activity and each subject (group_by)
# with the average of each variable (summarize_each - mean)
# NB: except for "setID" which is intentionaly left in HAR_Dataset
# for data reference purposes, but not needed in this tidy dataset

HAR_Average <- HAR_Dataset %>%
            group_by(activity,subjectID) %>%
            summarize_each(funs(mean), -setID)

# Dump all data to external files
write.table(HAR_Dataset,"UCI_HAR_TIDY_Dataset.csv", row.names = FALSE)
write.table(HAR_Average,"UCI_HAR_TIDY_Averages.csv", row.names = FALSE)

# Restore working directory
setwd(c_start_dir)

# Time for cleanup !!!
# there is no need for source data anymore, deleting it
rm(list = ls(pattern = "ds_"))
# take care of temporary vars
rm(c_start_dir, c_work_dir, c_prefix, n_features, c_features)

#
# The end!
#
