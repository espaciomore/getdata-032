# Environment Info

*Platform*       i386-w64-mingw32            
*Arch*           i386                        
*OS*             mingw32                     
*System*         i386, mingw32                          
*SVN rev*        68531                        
*Version*        R version 3.2.1 (2015-06-18)
*Host OS*        Windows 7
*Packages*       dplyr (0.4.3), plyr (1.8.3), data.table (1.9.6)

# Data Analisys

## Analysis Procedure:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. Create an independent tidy data set with the average of each variable for each activity and each subject.

The data has been downloaded from [archive.ics.uci.edu](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

For cleaning the data, all of the variables for the test and training session had to be read separately then summarised into a tidy data set as described in the run_analiys.R script by calling the function compute_analisys().