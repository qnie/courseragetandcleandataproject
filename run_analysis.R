courseragetandcleandataproject
==============================
## Change directory to "D:/UCI HAR Dataset"

# Read in the testing and training data
subject_test  <- read.delim(file="D:/UCI HAR Dataset/test/subject_test.txt", col.names="subject")
subject_train <- read.delim(file="D:/UCI HAR Dataset/train/subject_train.txt", col.names="subject")
y_test        <- read.delim(file="D:/UCI HAR Dataset/test/y_test.txt", col.names="activity")
y_train       <- read.delim(file="D:/UCI HAR Dataset/train/y_train.txt", col.names="activity")


# Get the number of rows in the test / training sets
test_rows <- nrow(y_test)
train_rows <- nrow(y_train)

# Scan in the feature variables
raw_X_test    <- scan(file="C:/Users/Administrator/UCI HAR Dataset/test/X_test.txt", nlines=test_rows)
raw_X_train   <- scan(file="C:/Users/Administrator/UCI HAR Dataset/train/X_train.txt", nlines=train_rows)

# Read in the column names for each of the features in X
feature_names <- read.table("C:/Users/Administrator/UCI HAR Dataset/features.txt", sep=" ", col.names=c("column","name"))

# Read in the activity labels
activity_labels <- read.table("C:/Users/Administrator/UCI HAR Dataset/activity_labels.txt", sep=" ", col.names=c("level","label"))

# Get the number of features
nFeatures <- nrow(feature_names)

# Create a dataframe from the raw X features data
X_test <- as.data.frame(matrix(raw_X_test, nrow=test_rows, ncol=nFeatures, byrow=TRUE))
X_train <- as.data.frame(matrix(raw_X_train, nrow=train_rows, ncol=nFeatures, byrow=TRUE))

# Append the training data to the testing data
subject <- rbind(subject_test, subject_train)
y       <- rbind(y_test, y_train)
X_raw   <- rbind(X_test, X_train)

# Get the mean and std dev features columns
mean_std_cols <- sort(c(grep("mean\\(\\)",feature_names$name), grep("std\\(\\)",feature_names$name)))
features <- feature_names[mean_std_cols, ]

# Subset the data to only include the mean and std dev features
X <- X_raw[, mean_std_cols] 
names(X) <- features$name

# Combine the datasets
final_data <- cbind(subject, y, X)

# Change the activities to factors and set the proper labels
final_data$activity <- as.factor(final_data$activity)
levels(final_data$activity) <- activity_labels$label

# Create a tidy dataset with the average of each feature for each activity
tidy_data <- aggregate(final_data[,3:ncol(final_data)]
                       , list(final_data$activity, final_data$subject)
                       , mean)
names(tidy_data)[1] <- "activity"
names(tidy_data)[2] <- "subject"

# Save the tidy data set in the data folder as "tidy_data.txt"
write.table(tidy_data, "C:/Users/Administrator/tidy_data.txt")
