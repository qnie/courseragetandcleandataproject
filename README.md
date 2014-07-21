courseragetandcleandataproject
==============================
Course project of get and clean data

First change directory to "D:/UCI HAR Dataset"

To obtain "Merges the training and the test sets to create one data set" I set work directory to train and read all three txt files. and the same for files in test. Then rbind X_train and X_test, Y_train and Y_text, subject_train and subject_test. Finally cbind all of them to be a dataframe.

2, for step 2 "Extracts only the measurements on the mean and standard deviation for each measurement." Read features. txt file first, then use grepl to extract the measurements on mean and std.

3, for step 3 "Uses descriptive activity names to name the activities in the data set" read activity labels file then use merge function to merge data from step1 with activity lables.

4, for step 4 rename

5, for step 5 create a tidy data with the average of each variable for each activity and each subject. And then save it in tidy_data.txt
