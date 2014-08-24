=====================================================
Data set for Getting and Cleaning data Course Project
=====================================================
Lev Taydakov
=====================================================

Original dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Human Activity Recognition Using Smartphones Dataset Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Then training data and test data were put together and mean was calculated for each activity and subject of all the variables.

Variables:
==========
 - "activity" represents types of activity that subject performed
 - "subject" represent number of subject that performed current activity and produced set of observations
 - ... others columns are described in a codebook of the original dataset

Steps performed:
================
# STEP 1
## Load test and train data
## Merge test and train data together
## Also convert some data.frames to vectors

# STEP 2
## Read features list and leave only columns with names contains "mean()" and "std()"

# STEP 3
## Read activity labels and map full_labels using factor

# STEP 4
## Use feature labels to name columns of the data set

# Create data set with all the columns inside, remove unused variables

# STEP 5
## Creating new data set with the average of each variable for each activity and each subject by melting and then casting it
## Melt the data set by all the columns except activity and subject
## Cast the melted data set by activity and subject
## The casted data set contains 180 observations (30 subjects by 6 different activities) and 81 columns

# Export result to a file
write.csv(datasetcasted, file = "result.csv")


License of the original dataset:
================================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
