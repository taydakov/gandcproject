=====================================================
Data set for Getting and Cleaning data Course Project
=====================================================
Lev Taydakov
=====================================================

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The script should be run inside the unzipped original dataset

run_analysis.R
--------------
run_analysis.R does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. 

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

CodeBook.md
-----------
CodeBook.md describes the variables, the data, and any transformations or work that I made

result.csv
----------
result.csv is the tidy data set created on step 5 (see above what run_analysis.R does)