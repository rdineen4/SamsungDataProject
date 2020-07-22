---
title: "README for SamsungDataProject"
author: "Raymond Dineen"
---

### run_analysis.R and run_analysis_with_download.R

These two scripts can be used to take the data from a [Human Activity Recognition test](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) using Samsung smartphones and convert it into a tidy data set that shows the averages of various variables grouped by the test subject performing the test and then by the specific activity being performed. The only difference between the two scripts is that run_analysis_with_download.R will download the data and unzip it into your working directory while run_analysis.R assumes you already have the unzipped data present in the working directory. The final outputs are two tidy data sets, mergedData and groupedMeans. groupedMeans is saved to the working directory as a .txt file.

The scripts work by first reading in the data from the various files that make up the training set and combining them into one data frame as well as properly naming each column. The only variables kept are the subject number, the activities, and means and standard deviations of data from the tested features. All other variables are removed. The same process is repeated for the test set data. The test and training sets are then merged together into one complete set, mergedData.

From there, a few things are done to clean up the columns. First it replaces the activities column, which is currently numbers, with the actual names of the corresponding activity. Next, it removes the unnecessary "()" from the ends of the features' column names and replaces the dashes with underscores for clarity. It then separates the t/f (indicating time or frequency domain signal) at the beginning of each column name with an underscore. I felt this was better than making the t/f a separate variable since this method stays true to keeping each row as a single observation. Separating out the t/f would create two rows for each observation. The last change is to fix an error in some of the column names with "Body" is written twice as "BodyBody". The features_info.txt file in the raw data writes it as a single "Body" so I think it's a safe assumption that it is incorrect in the data sets. 

The last part of the script is to create the groupedMeans table. This is done simply by grouping mergedData by subject and activity and then summarizing the mean value of each other variable by those groups. groupedMeans is then written to the working directory as groupedMeans.txt.