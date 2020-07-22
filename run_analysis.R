#Read in training set, training subject IDs, activity numbers, and features(column names)
train_set <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
train_activities <- read.table("./UCI HAR Dataset/train/y_train.txt")
features <- read.table("./UCI HAR Dataset/features.txt"); features <- features[,2]

#Combine training data into one date frame
#Add the subjects and activities variables to the training set
train_set <- cbind(train_subjects, train_activities, train_set)
#Change column names
colnames(train_set) <- c("subject", "activity", features)

#Keep only columns with the subject IDs, activities, means, and standard deviations
train_set <- train_set[,grep("subject|activity|mean\\(|std\\(", names(train_set))]

#Read in test set, test subject IDs, and test activities
test_set <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
test_activities <- read.table("./UCI HAR Dataset/test/y_test.txt")

#Combine test data into one data frame
#Add subjects and activities variables to test set
test_set <- cbind(test_subjects, test_activities, test_set)
#Change column names
colnames(test_set) <- c("subject", "activity", features)

#Keep only columns with the subject IDs, activities, means, and standard deviations
test_set <- test_set[,grep("subject|activity|mean\\(|std\\(", names(test_set))]

#Bind the train and test sets into one set
mergedData <- rbind(train_set, test_set)

#Replace activity numbers with descriptive names
library(plyr)
#read in activity labels
labels <- read.table("./UCI HAR Dataset/activity_labels.txt"); labels <- labels[,2]
#Convert activity column to factor variable
mergedData$activity <- as.factor(mergedData$activity)
#Remap the values of the activities variable to the labels
mergedData$activity <- mapvalues(mergedData$activity, from = levels(mergedData$activity), to = tolower(labels))

#Clean up column names
library(stringr)
#Remove unnecessary parentheses
newNames <- gsub("\\()", "", names(mergedData))
#Replace dashes with underscores
newNames <- gsub("-", "_", newNames)
#Separate "t" and "f" at the beginning of each column name with an underscore
newNames <- str_replace_all(newNames, c("^t" = "t_", "^f" = "f_"))
#Fix error in some column names where Body is written twice
newNames <- gsub("BodyBody", "Body", newNames)

#apply new column names to mergedData
colnames(mergedData) <- newNames

#Create new data set with the average of each variable for each activity and each subject
#detach plyr since it interferes with dplyr summarize function
detach("package:plyr", unload = TRUE)
library(dplyr)
#the names of the variables to be summarized
variables <- names(mergedData)[3:68]
#Group by subject and activity and then summarize the mean of each variable
groupedMeans <- mergedData %>%
    group_by(subject, activity) %>%
    summarize_at(variables, mean)

#Write the new data set to a text file called groupedMeans.txt    
write.table(groupedMeans, file = "./groupedMeans.txt", row.names = FALSE)