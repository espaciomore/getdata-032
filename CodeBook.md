# Environment Info
```
Platform       i386-w64-mingw32            
Arch           i386                        
OS             mingw32                     
System         i386, mingw32                          
SVN rev        68531                        
Version        R version 3.2.1 (2015-06-18)      
Host OS        Windows 7                   
Packages       dplyr (0.4.3), plyr (1.8.3), data.table (1.9.6)
```
# Data Analisys

## Description:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. Create an independent tidy data set with the average of each variable for each activity and each subject.

The data has been downloaded from [archive.ics.uci.edu](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

### Variables

- **current_data_path** provides the root path for loading the different data files.
- **get_all_activities** returns an ordered data set of all the activities considered in the experiment.
- **get_all_features** returns an ordered data set of all the variables considered for collecting the data.
- **get_subjects** takes an experiment name and returns an ordered data set of all the subject that participated in the experiment.
- **get_features** takes an experiment name and returns an ordered data set of all the features that were used to gather data during the experiment.
- **get_activities** takes an experiment name and returns an ordered data set of all the activities performed during the experiment.
- **get_results** takes an experiment name and returns a tidy data set with information about all the activities and features performed by the subjects in the experiment.
- **compute_average** returns a tidy data set of the summary of both experiments by grouping the data according to subject and activity then averaging the values for the different features.

For cleaning the data, all of the variables for the test and training session had to be read separately then summarised into a tidy data set as described in the **run_analiys.R** script by calling the function **compute_average**().
