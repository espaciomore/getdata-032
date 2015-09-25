get_activities <- function(){
  ta <- read.table("activity_labels.txt")
  data_frame(Activity = ta$V2)
}
activities <- get_activities()

get_features <- function(){
  tf <- read.table("features.txt")
  data_frame(Feature = tf$V2)
}
features <- get_features()


### TEST
get_test_subjects <- function(){
  tts <- read.table("test/subject_test.txt")
  data_frame(SubjectId = tts$V1)
}
test_subjects <- get_test_subjects()

### TRAIN
get_train_subjects <- function(){
  tts <- read.table("train/subject_train.txt")
  data_frame(SubjectId = tts$V1)
}
train_subjects <- get_train_subjects()
