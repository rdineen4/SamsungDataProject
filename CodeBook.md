---
title: "Code Book for groupedMeans"
author: "Raymond Dineen"
---
### Overview

This data is from a [study](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) carried out with a group of 30 volunterr in the age bracket of 19-48 years. They perform a variety of activities while wearing a Samsung Galaxy S II on their waist. The data is recorded using readings from the smartphone's embedded accelerometer and gyroscope. For each record there is provided: 

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
- Triaxial Angular velocity from the gyroscope.  
- An activity label.  
- An identifier of the subject who carried out the experiment.

### Variables

The first two variables of the table are:  

- subject: Subject ID number  
- activity: One of six activities the subjects carried out. The activities are: walking, walking upstairs, walking downstairs, sitting, standing, and laying.  

The following variables are mean values of the variable from the original data set. The mean is taken from all the observations where each individual subject performed each individual activity. Each variable is structured into 4 parts separated by underscores:  

- domain signal: t or f meaning time domain signal or frequency domian signal  
- sensor signal: Each signal can be from either the gravitational (Gravity) or body motion (Body) components of the sensor. The sensor signals can be either from accelerometer (Acc) or gyroscope (Gyro). "Jerk" refers to Jerk signals and Mag refers to measurements or magnitude.  
- mean/std: Mean or standard deviation. Note that all values in this table are means of these values from the grouped observations. So the variable t_BodyAccMag_mean is the mean of the mean values of t_BodyAccMag and t_BodyAccMag_std is the mean of the standard deviation values for t_bodyAccMag.  
- X/Y/Z: Denotes 3-axial signals in the X, Y, and Z directions. Not present in all variables.

The following is a list of all the variables in the table. There is a mean and std for each:

- t_BodyAcc_X,Y,Z  
- t_GravityAcc_X,Y,Z  
- t_BodyAccJerk_X,Y,Z  
- t_BodyGyro_X,Y,Z  
- t_BodyGyroJerk_X,Y,Z  
- t_BodyAccMag  
- t_GravityAccMag  
- t_BodyAccJerkMag  
- t_BodyGyroMag  
- t_BodyGyroJerkMag  
- f_BodyAcc_X,Y,Z  
- f_BodyAccJerk_X,Y,Z  
- f_BodyGyro_X,Y,Z  
- f_BodyAccMag  
- f_BodyAccJerkMag  
- f_BodyGyroMag  
- f_BodyGyroJerkMag  





