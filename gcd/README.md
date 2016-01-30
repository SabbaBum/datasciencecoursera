---
title: "README"
author: "Dmitriy Litovchin"
date: "1/30/2016"
output: html_document
---

### Abstract

This is a short description of `run_analysis.R` script that is used as *Getting and Cleaning Data* Course Project.  
If necessary, there are more detailed, line-by-line comments in the source R file itself.

### The script does the following:

- downloads and unpacks UCI_HAR source dataset from the official website;

- reads up field names codebook, figures out the positions of *mean()* and *std()* values;
- reads up sensor data, but only the columns that carry mean or standart deviation values (based on position);

- reads up corresponding subject IDs and activity codes for each dataset record;
- reads up activity codebook for putting descriptive names for activity data;

- combines training and testing parts of the dataset;
  (please note that a special field is introduced in order to keep track of source datasets - train or test);
  
- resulting data is grouped by **activity** and **subjectID**;
- average is calculated for each column of sensor data and then is written into a second, independent dataset;

- both datasets are written to disk as `UCI_HAR_TIDY_<...>.CSV` files for further use;
- for usability purposes they both also are left in memory; 
- all other temporary variables are removed from environment.

### Notes:

1) All of file manipulations occur in the directory where the script is *saved*, 
   and **not** in the directory where it was *called* !!!
 
2) Course project required tasks are completed in the following order: 2,4,1,3,5.
   (It seemed more logical and convenient for me... :-)
   
