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
full_labels   <- rbind(test_labels,   train_labels)
full_subjects <- rbind(test_subjects, train_subjects)$V1
full_data     <- rbind(test_data,     train_data)$V1

## Remove unused variables
rm(list = c("test_labels", "test_subjects", "test_data", "train_labels", "train_subjects", "train_data"))

# STEP 2
## Read features list and leave only mean and std columns
features <- read.table("features.txt", colClasses = "character")
full_data <- full_data[, features$V1[grep("(mean)|(std)\\(\\)", features$V2)]]

# STEP 3
## Read activity labels and map full_labels using factor
activities <- read.table("activity_labels.txt", colClasses = c("numeric", "character"))
full_activities <- factor(full_labels, levels=activities$V1, labels=activities$V2)

# STEP 4
## Use feature labels to name columns of the data set
names(full_data) <- features$V2[grep("(mean)|(std)\\(\\)", features$V2)]

