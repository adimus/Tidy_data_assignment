## Input data sets
* test and training data sets contain measurements from subjects wearing a smartphone (samsung Galaxy SII) and performing physical activities.
* the activities are listed in the "activity_labels.txt" file.
* the subject codes are given in the "subject_test.txt" or the subject_traing.txt files in the respective folders.
* there are 561 variables in the measurement data sets.

## Analysis
* The script for processing these data sets is in the script called "run_analysis.R".
### The procedure
* Read in each data set.
* for each data set (test and training) merge the subject id and activities with the measurements.
* Then merge the test and training data sets to create one data.
* select only the mean and standard deviation values of each measurement type.
* calculate the average of each measurement type for each subject and activity type.
* output this average measurement for the subjects. The output is written to a file called output.txt 

## variables in the output.txt file
* first variable is the subject from which the measurements were collected.
* second variable is the activity the subject was performing when the measurments were taken.
* Variables 3 to 63 are the average for each subject and activity of the measurements from the accelerometer and gyroscope along 3-axial signals. The axis are XYZ. more information on these can be found in /UCI HAR Dataset/features_info.txt
