# set wd to UCH HAR Dataset 

setwd("./UCI HAR Dataset")
# read in the test and train datasets

x_test = read.table("./test/X_test.txt")
y_test = read.table("./test/y_test.txt")
subject_test = read.table("./test/subject_test.txt")

x_train = read.table("./train/X_train.txt")
y_train = read.table("./train/y_train.txt")
subject_train = read.table("./train/subject_train.txt")

# merge the columns of x_test, y_test and the subject. also the columns of x_train, y_train and subject.

merged_test = cbind(y_test, x_test)
merged_test2 = cbind(subject_test, merged_test)
merged_train = cbind(y_train, x_train)
merged_train2 = cbind( subject_train, merged_train)

# merge the rows of merged_test2 and merged_train2

merged_data = rbind(merged_test2, merged_train2)

#read in the feature names and activity labels

features = read.table("features.txt")

activity = read.table("activity_labels.txt")

#remove charcters not necessary in column names

features[,2] = gsub("-", ".", features[,2])
features[,2] = gsub("\\()", "", features[,2])
features[,2] = gsub(",", "_", features[,2])
features[,2] = gsub("^t", "time", features[,2])
features[,2] = gsub("^f", "frequency", features[,2])
features[,2] = gsub("Acc", "Acceleration", features[,2])


#get the feature names as vector to use for column names

variable_name = features$V2

#add a column of activity type to merged_data, the number and its corresponding activity are in the activity object.

merged_data$activity = activity[match(merged_data[,2], activity$V1),2]

#drop the second column (code of activity) of merged_data, and just keep the activity.

merged_data = merged_data[,c(1,564, 3:563)]

# Assign "subject" as the variable name for the first column. assign the names in the vector variable_name as column names for the rest of columns (starting from 2nd column)

colnames(merged_data)[1] = "subject"

colnames(merged_data)[3:563] = variable_name

# select only columns containing ".mean." or ".std." in thier names. as I am asked to retain only means and standard deviations on each measurment.

#tail(grep(".mean.|.std.", names(merged_data), value = TRUE))

sub_merged_data = merged_data[,grep(".mean.|.std.", names(merged_data), value = TRUE)]

#add subject and activity colums to the subsetted data.

sub_merged_data = cbind(merged_data[,1:2], sub_merged_data)

#create a new data that gives the average of each activity for each individual



tidy_data = aggregate(.~ subject + activity, data = sub_merged_data, FUN = mean)


write.table(tidy_data, file= "../output.txt", row.names= FALSE, sep="\t", quote= FALSE)



