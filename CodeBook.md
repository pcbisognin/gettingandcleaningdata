# Code Book

The data used in this project can be found in: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
### variables from the data
* SubjectId <- Identifier of the subject of the experiments
* AcitivityId <- Activity performed by the subject during measurements: Walking, Walking upstairs, walking downstairs, sitting, standing, laying
* Features <- Measures of acceleration and angular velocity in all axes, feature vector with time and frequency domain variables

### variables added in the code

* mrg_train <- a table containing subjects ids, activities ids from the train set
* mrg_test <- a table containing subjects ids, activities ids from the test set
* Train_and_test <- a table containing all values for the train and test sets
* colunas <- names of all columns from the Train_and_test table
* mediaEdesvio <- table containing acitivities id, subjects id and all values for the mean and standard deviation for all characteriscs 
* mediaEdesvio_atividades <- table containing the data in the mediaEdesvio plus the activities labels


