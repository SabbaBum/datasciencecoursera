|     |  ---
title: "CodeBook"
author: "Dmitriy Litovchin"
date: "1/30/2016"
output: html_document
---

### Abstract

This codebook describes the 2 tidy datasets derived from version 1.0 of *Human Activity Recognition Using Smartphones Dataset* by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto of Smartlab (activityrecognition@smartlab.ws).

Original dataset available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full description of the project can be found on the website http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Work was done as the assignment for **Getting and Cleaning Data** *Course Project* as a part of *Johns Hopkins University* **Data Science Specialization** on *Coursera* (https://www.coursera.org/learn/data-cleaning).

### Description

There are 2 datasets sharing the same structure:

- **HAR_Dataset** - contains 10299 observations of 69 variables, a copy is saved in `UCI_HAR_TIDY_Dataset.csv`
- **HAR_Average** - contains 180 observation of 68 variables, a copy is saved in `UCI_HAR_TIDY_Averages.csv`

The main difference between datasets is - the second one contains calculated averages for each test subject and activity type, while the first one preserves the whole amount of sensor readings, each on the separate row.

### Fields

- **setID** *(present only in large dataset)* - a factor variable with 2 levels ("train" and "test"), denoting which part of source dataset the record relates to
- **subjectID** - a numeric vector which encodes real people as test subjects
- **activity** - a factor variable with 6 levels (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`), describes the real (human-decoded) activity type of subjects

The rest columns come from original 561-feature set, filtered to contain only the *mean* and *standart deviation* values.
Here is the mapping of used and original features:

|  ID  | Feature full name             |
|:----:|:----------------------------- |
|    1 | tBodyAcc-mean()-X             |
|    2 | tBodyAcc-mean()-Y             |
|    3 | tBodyAcc-mean()-Z             |
|    4 | tBodyAcc-std()-X              |
|    5 | tBodyAcc-std()-Y              |
|    6 | tBodyAcc-std()-Z              |
|   41 | tGravityAcc-mean()-X          |
|   42 | tGravityAcc-mean()-Y          |
|   43 | tGravityAcc-mean()-Z          |
|   44 | tGravityAcc-std()-X           |
|   45 | tGravityAcc-std()-Y           |
|   46 | tGravityAcc-std()-Z           |
|   81 | tBodyAccJerk-mean()-X         |
|   82 | tBodyAccJerk-mean()-Y         |
|   83 | tBodyAccJerk-mean()-Z         |
|   84 | tBodyAccJerk-std()-X          |
|   85 | tBodyAccJerk-std()-Y          |
|   86 | tBodyAccJerk-std()-Z          |
|  121 | tBodyGyro-mean()-X            |
|  122 | tBodyGyro-mean()-Y            |
|  123 | tBodyGyro-mean()-Z            |
|  124 | tBodyGyro-std()-X             |
|  125 | tBodyGyro-std()-Y             |
|  126 | tBodyGyro-std()-Z             |
|  161 | tBodyGyroJerk-mean()-X        |
|  162 | tBodyGyroJerk-mean()-Y        |
|  163 | tBodyGyroJerk-mean()-Z        |
|  164 | tBodyGyroJerk-std()-X         |
|  165 | tBodyGyroJerk-std()-Y         |
|  166 | tBodyGyroJerk-std()-Z         |
|  201 | tBodyAccMag-mean()            |
|  202 | tBodyAccMag-std()             |
|  214 | tGravityAccMag-mean()         |
|  215 | tGravityAccMag-std()          |
|  227 | tBodyAccJerkMag-mean()        |
|  228 | tBodyAccJerkMag-std()         |
|  240 | tBodyGyroMag-mean()           |
|  241 | tBodyGyroMag-std()            |
|  253 | tBodyGyroJerkMag-mean()       |
|  254 | tBodyGyroJerkMag-std()        |
|  266 | fBodyAcc-mean()-X             |
|  267 | fBodyAcc-mean()-Y             |
|  268 | fBodyAcc-mean()-Z             |
|  269 | fBodyAcc-std()-X              |
|  270 | fBodyAcc-std()-Y              |
|  271 | fBodyAcc-std()-Z              |
|  345 | fBodyAccJerk-mean()-X         |
|  346 | fBodyAccJerk-mean()-Y         |
|  347 | fBodyAccJerk-mean()-Z         |
|  348 | fBodyAccJerk-std()-X          |
|  349 | fBodyAccJerk-std()-Y          |
|  350 | fBodyAccJerk-std()-Z          |
|  424 | fBodyGyro-mean()-X            |
|  425 | fBodyGyro-mean()-Y            |
|  426 | fBodyGyro-mean()-Z            |
|  427 | fBodyGyro-std()-X             |
|  428 | fBodyGyro-std()-Y             |
|  429 | fBodyGyro-std()-Z             |
|  503 | fBodyAccMag-mean()            |
|  504 | fBodyAccMag-std()             |
|  516 | fBodyBodyAccJerkMag-mean()    |
|  517 | fBodyBodyAccJerkMag-std()     |
|  529 | fBodyBodyGyroMag-mean()       |
|  530 | fBodyBodyGyroMag-std()        |
|  542 | fBodyBodyGyroJerkMag-mean()   |
|  543 | fBodyBodyGyroJerkMag-std()    |

As noted before, `HAR_Average` keeps only the mean values for subject/activity pair, while `HAR_Dataset` holds all original data.

