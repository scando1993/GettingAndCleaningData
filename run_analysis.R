library(plyr)

# Before starting the analysis we should make the script portable
# In this way we make the current directory the directory where the
# files are managed

this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

# Reads data from the train datasets
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Reads data from the test datasets
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# We have to bind the data from xtrain and xtest 
# for both *_data and *_data
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

# We have to bind the data from subject_train and subject_test 
subj_data <- rbind(subject_train, subject_test)

# Now we have to read the features data
features <- read.table("features.txt")

# Filter the dataset with only the words mean and std
mean_and_std <- grep( pattern = "-(mean|std)\\(\\)", x = features[, 2])

# Subset and Correct the dataset
x_data <- x_data[, mean_and_std]
names(x_data) <- features[mean_and_std, 2]

# Upload the activity labels into memory
act_labls <- read.table("activity_labels.txt")

# Subset and correct
y_data[, 1] <- act_labls[y_data[, 1], 2]
names(y_data) <- "activity"

# Correct the subset with the right names
names(subj_data) <- "subject"

# Bind together the data 
complete_data <- cbind(x_data, y_data, subj_data)

# Create the average data for the dataset
avg_data <- ddply(complete_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

# Write the data to the file
write.table(avg_data, "averages_data.txt", row.name=FALSE)