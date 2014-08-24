# Load test and train data
test_labels    <- read.table("./test/y_test.txt")
test_subjects  <- read.table("./test/subject_test.txt")
test_data      <- read.table("./test/X_test.txt")
train_labels   <- read.table("./train/y_train.txt")
train_subjects <- read.table("./train/subject_train.txt")
train_data     <- read.table("./train/X_train.txt")

# Merge test and train data together
full_labels   <- rbind(test_labels,   train_labels)
full_subjects <- rbind(test_subjects, train_subjects)
full_data     <- rbind(test_data,     train_data)

# Remove unused variables
rm(list = c("test_labels", "test_subjects", "test_data", "train_labels", "train_subjects", "train_data"))