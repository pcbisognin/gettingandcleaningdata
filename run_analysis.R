run_analysis <- function()
  
fileURL="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  
    if (!getwd()=="./course-project") {
    dir.create("./course-project")
  }

setwd("./course-project")
  
download.file(fileURL, destfile = "data.zip")
unzip(zipfile="data.zip")

x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table ("./UCI HAR Dataset/test/x_test.txt")
y_test <- read.table ("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(x_train)<-features[,2] #coloca como nomes das colunas de x as características que estão na segunda coluna do documento features
colnames(y_train) <- "activityId" #y_train só tem uma coluna, que se refere à atividade
colnames(subject_train) <- "subjectId"
colnames(x_test)<-features[,2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
colnames(activity_labels) <- c('activityId','ActivityType') #activity_labels tem duas colunas, por isso o nome das colunas serão tirados de um vetor com dois elementos

mrg_train <- cbind(y_train, subject_train, x_train) #coloca o y_train (activityId) na primeira coluna, o subjectId na segunda e depois os dados de x_train
mrg_test <- cbind(y_test, subject_test, x_test)
Train_and_Test <- rbind(mrg_train, mrg_test) #constrói uma tabela com todos os dados, os de treino nas primeiras 7352 linhas e os de teste nas próximas 2947 linhas seguinte

colunas <- colnames(Train_and_Test) #cria uma lista com todos os nomes das colunas
mean_and_std <- grepl("activityId",colunas) | grepl("subjectId",colunas) | grepl("mean..", colunas)| grepl("std..",colunas)
 ## o grepl vai encontrar onde os nomes das colunas são os mesmos que "activityId", "mean.."... e retornar TRUE nessas posições e FALSE nas demais
mediaEdesvio <- Train_and_Test[,mean_and_std==TRUE] #cria uma tabela com os valores médios e de desvio, com todas as linhas, mas só as colunas onde Mean_and_std eram TRUE, ou seja, 
#onde havia as palavras mean, std, subjetcId e activityId

mediaEdesvio_atividades <- merge(mediaEdesvio, activity_labels, by='activityId',all.x = TRUE)
TidyData <- aggregate(. ~subjectId + activityId, mediaEdesvio_atividades, mean)
TidyData <- TidyData[order(TidyData$subjectId, TidyData$activityId),]
write.table(TidyData, "./course-project/TidyData.txt", row.name=FALSE)
