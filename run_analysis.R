# Script should be run in the unzipped directory

# Retrieve neccessary functionality
library(data.table)
library(reshape2)

# STEP 1
## Load test and train data
test_labels    <- read.table("./test/y_test.txt")
test_subjects  <- read.table("./test/subject_test.txt")
test_data      <- read.table("./test/X_test.txt")
train_labels   <- read.table("./train/y_train.txt")
train_subjects <- read.table("./train/subject_train.txt")
train_data     <- read.table("./train/X_train.txt")

## Merge test and train data together
## Also convert some data.frames to vectors
full_labels   <- rbind(test_labels,   train_labels)$V1
full_subjects <- rbind(test_subjects, train_subjects)$V1
full_data     <- rbind(test_data,     train_data)

## Remove unused variables
rm(list = c("test_labels", "test_subjects", "test_data", "train_labels", "train_subjects", "train_data"))

# STEP 2
## Read features list and leave only columns with names contains "mean()" and "std()"
features <- read.table("features.txt", colClasses = c("numeric", "character"))
names(features)  <- c("colnum", "colname")
full_features    <- features
features         <- features[grep("(mean)|(std)\\(\\)", features$colname),]
meanstd_data <- full_data[, features$colnum]

# STEP 3
## Read activity labels and map full_labels using factor
activities <- read.table("activity_labels.txt", colClasses = c("numeric", "character"))
full_activities <- factor(full_labels, levels=activities$V1, labels=activities$V2)

# STEP 4
## Use feature labels to name columns of the data set
names(meanstd_data) <- features$colname

# Create data set with all the columns inside, remove unused variables
dataset <- cbind(full_activities, full_subjects, meanstd_data)
names(dataset)[c(1,2)] <- c("activity", "subject")
write.csv(dataset, "fulldataset.csv", row.name = FALSE)

# STEP 5
## Creating new data set with the average of each variable for each activity and each subject by melting and then casting it
newdataset <- cbind(full_activities, full_subjects, full_data)
names(newdataset) <- c(c("activity", "subject"), full_features$colname)
## Melt the data set by all the columns except activity and subject
datasetmelted <- melt(newdataset, id=c("activity", "subject"), measure.vars = full_features$colname)
## Cast the melted data set by activity and subject
datasetcasted <- dcast(datasetmelted, activity + subject ~ variable, mean)
## The casted data set contains 180 observations (30 subjects by 6 different activities) and 81 columns

# Export result to a file
write.table(datasetcasted, file = "result.txt", row.name = FALSE)