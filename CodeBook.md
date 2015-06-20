#CodeBook
This is a code book that describes the variables, the data, and any transformations or work to clean up the data.

#Variables
* subject(1...30)
* Activity label(1...6)
* mean - mean value
* std - standard deviation

#Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The dataset includes the following files:
* features_info.txt: Shows information about the variables used on the feature vector.
* features.txt: List of all features.
* activity_labels.txt: Links the class labels with their activity name.
* train/X_train.txt: Training set.
* train/y_train.txt: Training labels.
* test/X_test.txt: Test set.
* test/y_test.txt: Test labels.

#Steps for the project work
##1. Merge the training and the test sets to create one data set.
* Read all the test and training files: y_test.txt, subject_test.txt and X_test.txt.
* Combine the files to a data frame in the form of subjects, labels, the rest of the data.

##2. Extracts only the measurements on the mean and standard deviation for each measurement. 
* Read the features from features.txt and filter out the means(mean()) or standard deviations (std()). A new data frame is then created that includes subjects, labels and the described features.

##3. Uses descriptive activity names to name the activities in the data set.
* Read the activity labels from activity_labels.txt and replace with description

##Step 4. Appropriately labels the data set with descriptive variable names. 
* replace the columns with the descriptive names without non-alphanuemric characters.

##5.creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Create a new data set by finding the mean for each combination of subject and labelusing aggregate() function

