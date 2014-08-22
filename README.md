## What is here
* "UCI HAR Dataset" is the folder containing the raw data, README file describing the experiment, variable names and information about them in files (features.txt and feature_info.txt), file called activity_labels.txt contains the activity and corresponding code. folders test and train contain the raw data sets.
* the script run_analysis.R should be run from a folder containing  the "UCI HAR Dataset".
* output file called output.txt
* CodeBook.md gives information about the variables and where to find further information.
## what the script does
* the script merges the test and training data sets, puts the subject identifiers and activity names alongside the measurements.
* adds the appropriate variable names to the data.
* extracts only the mean and standard deviation variables for each measurement type.
* calculates the average for these variables for each activity type performed by a subject.
* writes the average for the variables to a file called output.txt and saves it in the current directory. 

