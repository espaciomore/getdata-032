library(dplyr)
library(magrittr)

data_path <- "."


get_all_activities <- function(){
  ta <- read.table(paste(data_path, "activity_labels.txt", sep='/', collapse = ''))
  data_frame(Activity = ta$V2)
}
activities <- get_all_activities()

get_all_features <- function(){
  tf <- read.table(paste(data_path, "features.txt", sep='/', collapse = ''))
  data_frame(Feature = tf$V2)
}
features <- get_all_features()


get_subjects <- function(test_or_train){
  s_tbl <- read.table(paste(data_path, test_or_train, paste("subject_",test_or_train,".txt", sep = '', collapse = ''), sep='/', collapse = ''))
  s_df <- data_frame(SubjectId = s_tbl$V1)
  return(s_df)
}

get_features <- function(test_or_train){
  f_tbl <- read.table(paste(data_path, test_or_train, paste("x_",test_or_train,".txt", sep = '', collapse = ''), sep = '/', collapse = ''))
  colnames(f_tbl) <- features$Feature
  tbldf <- tbl_df(as.data.frame.matrix(f_tbl))
  return(tbldf)
}

get_activities <- function(test_or_train){
  a_tbl <- read.table(paste(data_path, test_or_train, paste("y_",test_or_train,".txt", sep = '', collapse = ''), sep = '/', collapse = ''))
  dfta <- data_frame(ActivityId = a_tbl$V1)
  dfta <- mutate(dfta, ActivityId = activities$Activity[ActivityId])
  return(dfta)
}

get_results <- function(test_or_train){
  subjects <- get_subjects(test_or_train)
  this_activities <- get_activities(test_or_train)
  this_features <- get_features(test_or_train)
  results <- this_features
  results["Subject"] <- subjects$SubjectId
  results["Activity"] <- this_activities$ActivityId
  return(results)
}


### TEST
test_results <- get_results("test")

### TRAINING
train_results <- get_results("train")


step1_tbl <- merge(test_results, train_results, all = T)
step2_tbl <- select(step1_tbl, Subject, Activity, contains("std()"), contains("mean()"))
step5_tbl <- group_by(melt(step2_tbl, id.vars=c("Subject", "Activity")), Subject, Activity)

write.table(step5_tbl, file = paste(data_path, "average.txt", sep='/', collapse = ''), row.names = FALSE)

### Steps:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
