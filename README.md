# gettingandcleaningdata
Getting and Cleaning Data - coursera
## How the script  works
This code will create a new folder called course-project in your working directory and set this new dir as the working directory. Then it will download and unzip the specified files in this new folder. 
The tables will be read by the code, and columns names will be added to specify each variable. The names are taken from these files: features.txt, activity.id and subject.id, so all the variable are completely identified. 
A new table will be made, from a combination of all the data from train and test sets. The columns containing the activity names, subjects id, means and standard deviation will be selected to create a new table cointaining only the specified columns. The activity labels will be merged with the referred table, and a table for the tidy data will be created.


