These are steps to be done on "Human Activity Recognition Using Smartphones" dataset to obtain a tidy data set based on source dataset.

1. Download the data from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and unzip it into the working directory.
2. Include the run_analysis.R file in the same working directory.
3. The script is used to create the final tidy data file, based on the merged data file from the obtained data.
4. Two output files are generated in the working directory:
	- merged_data.txt (8083 KB): contains the intermediate merged and cleaned data frame [10299 x 68].
    - tidy_data.txt (219 Kb): contains the final data frame [180 x 68], of average mean and standard deviation measurements per subject and activity.
