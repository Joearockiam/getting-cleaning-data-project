setwd("G:\\Datascience\\19062015\\UCI HAR Dataset")

##Step-1
# read all the test data set.
test_labels <- read.table("test/y_test.txt", col.names="label")
test_subjects <- read.table("test/subject_test.txt", col.names="subject")
test_data <- read.table("test/X_test.txt")

# read all the training data set
train_labels <- read.table("train/y_train.txt", col.names="label")
train_subjects <- read.table("train/subject_train.txt", col.names="subject")
train_data <- read.table("train/X_train.txt")

# merge training and test data set and create one data set with column names subject,labels,data.
data <- rbind(cbind(test_subjects, test_labels, test_data), cbind(train_subjects, train_labels, train_data))

##Step-2
# read feature data.
features <- read.table("features.txt", stringsAsFactors=FALSE)

#select the features with mean and standard deviation
features_mean_std <- features[grep("mean\\(\\)|std\\(\\)", features$V2), ]

#select only mean and standard deviation from data for each measurement
#data starts from 3rd column onwards.
data_mean_std <- data[, c(1, 2, features_mean_std$V1+2)]

## step 3
# read the activity labels
labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)

# replace labels in data with label description
data_mean_std$label <- labels[data_mean_std$label, 2]

## step 4
# first make a list of the current column names and feature names
col_names <- c("subject", "label", features_mean_std$V2)

#clear non-aplhanumeric characters
col_names<-tolower( gsub("[^[:alnum:] ]", "", col_names))

# then use the list as column names for data
colnames(data_mean_std) <- col_names

## step 5
# find the tidy data set with the average of each variable for each activity and each subject.
aggregateData <- aggregate(data_mean_std[, 3:ncol(data_mean_std)],
                       by=list(subject = data_mean_std$subject, 
                               label = data_mean_std$label),
                       mean)

# write the data to the file
write.table(format(aggregateData, scientific=T), "tidyData.txt",
            row.names=F, col.names=T, quote=2)

