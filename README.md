# gettingandcleaningdata
Getting and Cleaning Data - coursera
## How the script  works
This code will create a new folder called course-project in your working directory. Then it will download and unzip the specified files in this new folder. The tables will be read by the code, and columns names will be added to specify each variable. A new table will be made, by a combination of all the data from the train and test sets. The columns containing the activity names, subjects id, means and standard deviation will be selected to create a new table cointaining only the specified columns. The activity labels will be merged with the referred table, and a table for the tidy data will be created.


## Code Book

* Train_and_test <- a table containing all values for the train and test sets
* mediaEdesvio <- table containing acitivities id, subjects id and all values for the mean and standard deviation for all characteriscs 
* mediaEdesvio_atividades <- table containing the data in the mediaEdesvio plus the activities labels
