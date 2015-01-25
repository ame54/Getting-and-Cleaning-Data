This file describes the variables, the data, and any transformations or work done to clean up the retrieved data.

- The main data source:
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

- The original data set:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

- The data features provided in the original data set, for each record are listed below ('-XYZ' denotes the 3-axial  signals in the X, Y and Z directions):
	tBodyAcc-XYZ
	tGravityAcc-XYZ
	tBodyAccJerk-XYZ
	tBodyGyro-XYZ
	tBodyGyroJerk-XYZ
	tBodyAccMag
	tGravityAccMag
	tBodyAccJerkMag
	tBodyGyroMag
	tBodyGyroJerkMag
	fBodyAcc-XYZ
	fBodyAccJerk-XYZ
	fBodyGyro-XYZ
	fBodyAccMag
	fBodyAccJerkMag
	fBodyGyroMag
	fBodyGyroJerkMag
	
- Measurments computed as an average per test subject and activity: 
	Mean: Mean value
	Std: Standard deviation

- The analysis script does the following:
	1- Obtain labels from the "activity_labels.txt".
	2- Obtain the lables from "features.txt".
	3- Obtain data from the "X_train.txt", "y_train.txt" and "subject_train.txt" from the "train" folder into data frames
	4- Obtain and Assign the lables obtained previously to appropriate data sets.
	5- Concatenates the "train" feature measurements, activities, and subject data frames into a single data frame [7352 x 563].
	6- Obtain the files "X_test.txt", "y_test.txt" and "subject_test.txt" from the "test" folder into data frames
		Obtain and Assign the lables 'feature' column labels accordingly, and stores them into corresponding variables.
	7- Concatenates the "test" feature measurements, activities, and subject data frames into a single data frame [2947 x 563].
	8- Merge the "train" and "test" data frames into a single data frame [10299 x 563].
	9- Determines the columns of the data frame containing the required 'Mean' and 'Standard Deviation' feature measurements, based on the 'feature' labels.
	10- Extracts only those columns from the combined data frame, along with the activity and subject columns.
	11- Merges the resulting data frame with the 'activities' labels, to assign the corresponding activity name to each record, and removes the column containing the activity ids.
	12- Cleans up the feature measurements column labels, by removing the "()" and "-" characters, and capitalizing the first letter of "Mean" and "Std".
	13- Writes the merged and cleaned data frame into the text file 'merged_data.txt'.
	14- Groups the data frame by subject and activity.
	15- Summarizes the data frame by applying the 'mean' function on each of the non-grouping columns, computing an average of the "Mean" and "Std" measurements per subject and activity. This produces a data frame of [180 x 68] dimensions.
	16- Writes the resulting data frame into the text file 'tidy_data.txt'.
