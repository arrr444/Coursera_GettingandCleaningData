run_analysis <- function (){
#getting and cleaning data course project
#-----------------------
#reads the list of features (which is the variable names)
features <- read.table(".\\features.txt", sep="")

#reads the lisf of activites to be performed by the subject ( there are 6 activities)
activity_labels <- read.table(".\\activity_labels.txt", sep="")

#changes the column names of the Activities table
names(activity_labels) <- c("ActivityNum","Activity_label")

#reads the Test set data
testdata <- read.table(".\\test\\X_test.txt", sep="")
#change the default column names of the Test Set data to have the proper feature variable name
names(testdata) <- features[,2]

  #read the Train Set data
  traindata <- read.table(".\\train\\X_train.txt", sep="")
  #change the default column names of the Train Set data to have the proper feature variable name
  names(traindata) <- features[,2]

#reads the test subjects who performed the activities
ytestdata <- read.table(".\\test\\y_test.txt", sep="")
#change the column name of the ytestdata dataframe
#this dataframe contains only one column, that is the ID of the activity performed by the test subject
names(ytestdata) <- "y_test"
#replace the Activity ID with the Proper activity name in the test Set dataframe
ytestdata$Activity_label <- activity_labels$Activity_label[match(ytestdata$y_test,activity_labels$ActivityNum)]

  #reads the train subjects who performed the activities
  ytraindata <- read.table(".\\train\\y_train.txt", sep="")
  #change the column name of the ytraindata dataframe
  #this dataframe contains only one column, that is the ID of the activity performed by the train subject
  names(ytraindata) <- "y_train"
  #replace the Activity ID with the Proper activity name in the train Set dataframe
  ytraindata$Activity_label <- activity_labels$Activity_label[match(ytraindata$y_train,activity_labels$ActivityNum)]

#similarly reads the test set subject who performed the activity
subjecttestdata <- read.table(".\\test\\subject_test.txt", sep="")
#change column name from the default and calls it "subject"
names(subjecttestdata) <- "subject"

  #similarly reads the train set subject who performed the activity
  subjecttraindata <- read.table(".\\train\\subject_train.txt", sep="")
  #change column name from the default and calls it "subject"
  names(subjecttraindata) <- "subject"

#concatinate the columns of the 3 dataframes to be included in one single Test set dataframe
testdata <- cbind(subjecttestdata,ytestdata,testdata)
#concatinate the columns of the 3 dataframes to be included in one single Train set dataframe
traindata <- cbind(subjecttraindata,ytraindata,traindata)

#Extracts only the measurements on the mean and standard deviation for each measurement of Test Set
filteredtestdf <- testdata[,grepl( "subject|Activity_label|mean\\(\\)|std\\(\\)" , names( testdata ) )]
#Extracts only the measurements on the mean and standard deviation for each measurement of Train Set
filteredtraindf <- traindata[,grepl( "subject|Activity_label|mean\\(\\)|std\\(\\)" , names( traindata ) )]

#Merges the training and the test sets to create one data set.
newdf <- merge(filteredtestdf,filteredtraindf,all.y=T,all.x=T)

#Reshape the Dataframe to have the long and skinny dataframe grouped by subject,ActivityLable & the feature 
cmelt <- melt(newdf,id=c("subject","Activity_label"))

#independent tidy data set with the average of each variable for each activity and each subject
#but on the long and skinny dataframe
#####longskinny_tidydf <- ddply(cmelt,.(subject,Activity_label,variable),summarize,Average=mean(value))

#Reshape the data frame back to include only 
#independent tidy data set with the average of each variable for each activity and each subject
short_tidydf <- dcast(cmelt,subject+Activity_label ~ variable,mean)

#write the dataframe to the "tidydata.txt" file
write.table(short_tidydf,file="tidydata.txt",row.name=FALSE)
#------------------

}