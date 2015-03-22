## 
## Summary of task: Based on the documentation for the lab, there exists two sets of information
## stored by "test" and "train".  The following code goes by aggregating all test-related observations,
## and then train-related observations.  Later, it merges the test and train observations joining them on
## activity and subject.  Even though the subject identifiers are not common between Tests/Train, it's important
## to join them on 'subject' variable because we have to aggregate the observations by 'subject'. This also 
## means that we will have an alternate pattern of NA (for Test/Train) when we group by subject.
## 
## 
##
##
##


run_analysis <- function(){
  
  ##Read activity labels
  activityLbl <- read.table("activity_labels.txt")
  
  
  ##-----------Manage TEST data-----------####
  
  ##Read TEST\Y_test.txt (Activity Label)
  print("Reading Test::Y_test.txt.  Please wait...");
  tst_Y_test <- read.table("test\\y_test.txt");
  tst_Y_test <- merge(tst_Y_test, activityLbl, by="V1")
  
  print("Reading Test::Y_test.txt.  Please wait...");
  subject_test <- read.table("test\\subject_test.txt");
  
  ##Read TEST\X_test.txt
  print("Reading Test::X_test.txt.  Please wait...");
  tmpDf <- read.table("test\\X_test.txt");
  TestDF <- data.frame(Mean = rowMeans(tmpDf), SD = rowSds(as.matrix(tmpDf)));
  tmpDf = NULL;
  
  ##Bind activity label with base X_test info (mean/standard dev)
  testBaseDf <- cbind(subject_test, tst_Y_test, TestDF)  

  colnames(testBaseDf) <- c("Subject", "ActivityId", "ActivityName","Test_X.Mean", "Test_Y.SD");
  
  ##Generate Test-Inertial Signal dataset
  print("Reading Test::InertialSignals::body_acc_x_test.txt.  Please wait...");

  ##Load Acc X/Y/Z
  testBaseDf <- returnMean_SD("test\\Inertial Signals\\body_acc_x_test.txt", testBaseDf, 
                              "Body.AccXtest_Mean", "Body.AccXtest_Sd");
  
  testBaseDf <- returnMean_SD("test\\Inertial Signals\\body_acc_y_test.txt", testBaseDf, 
                              "Body.AccYtest_Mean", "Body.AccYtest_Sd");

  testBaseDf <- returnMean_SD("test\\Inertial Signals\\body_acc_z_test.txt", testBaseDf, 
                              "Body.AccZtest_Mean", "Body.AccZtest_Sd");
  
  ##Load Gyro X/Y/Z
  testBaseDf <- returnMean_SD("test\\Inertial Signals\\body_gyro_x_test.txt", testBaseDf, 
                              "Body.GyroXtest_Mean", "Body.GyroXtest_Sd");
  
  testBaseDf <- returnMean_SD("test\\Inertial Signals\\body_gyro_y_test.txt", testBaseDf, 
                              "Body.GyroYtest_Mean", "Body.GyroYtest_Sd");

  testBaseDf <- returnMean_SD("test\\Inertial Signals\\body_gyro_z_test.txt", testBaseDf, 
                              "Body.GyroZtest_Mean", "Body.GyroZtest_Sd");
  
  ##Load Total Acc X/Y/Z
  testBaseDf <- returnMean_SD("test\\Inertial Signals\\total_acc_x_test.txt", testBaseDf, 
                              "Total.AccXtest_Mean", "Total.AccXtest_Sd");
  
  testBaseDf <- returnMean_SD("test\\Inertial Signals\\total_acc_y_test.txt", testBaseDf, 
                              "Total.AccYtest_Mean", "Total.AccYtest_Sd");
  
  testBaseDf <- returnMean_SD("test\\Inertial Signals\\total_acc_z_test.txt", testBaseDf, 
                              "Total.AccZtest_Mean", "Total.AccZtest_Sd");
  
  
  ##-----------Manage TRAIN data-----------####  
  ##Read train\Y_test.txt (Activity Label)
  print("Reading Train::Y_test.txt.  Please wait...");
  tst_Y_train <- read.table("train\\y_train.txt");
  tst_Y_train <- merge(tst_Y_train, activityLbl, by="V1")
  
  
  
  print("Reading Train::Y_train.txt.  Please wait...");
  subject_train <- read.table("train\\subject_train.txt");
  
  ##Read train\X_train.txt
  print("Reading Train::X_train.txt.  Please wait...");
  tmpDf <- read.table("train\\X_train.txt");
  trainDF <- data.frame(Mean = rowMeans(tmpDf), SD = rowSds(as.matrix(tmpDf)));
  tmpDf = NULL;
  
  ##Bind activity label with base X_train info (mean/standard dev)
  trainBaseDf <- cbind(subject_train, tst_Y_train, trainDF)  
  
  
  colnames(trainBaseDf) <- c("Subject2", "ActivityId2","ActivityName2","Train_X.Mean", "Train_Y.SD");
  
  ##Generate Train-Inertial Signal dataset
  print("Reading Train::InertialSignals::body_acc_x_train.txt.  Please wait...");
  
  ##Load Acc X/Y/Z
  trainBaseDf <- returnMean_SD("train\\Inertial Signals\\body_acc_x_train.txt", trainBaseDf, 
                              "Body.AccXtrain_Mean", "Body.AccXtrain_Sd");
  
  trainBaseDf <- returnMean_SD("train\\Inertial Signals\\body_acc_y_train.txt", trainBaseDf, 
                              "Body.AccYtrain_Mean", "Body.AccYtrain_Sd");
  
  trainBaseDf <- returnMean_SD("train\\Inertial Signals\\body_acc_z_train.txt", trainBaseDf, 
                              "Body.AccZtrain_Mean", "Body.AccZtrain_Sd");
  
  ##Load Gyro X/Y/Z
  trainBaseDf <- returnMean_SD("train\\Inertial Signals\\body_gyro_x_train.txt", trainBaseDf, 
                              "Body.GyroXtrain_Mean", "Body.GyroXtrain_Sd");
  
  trainBaseDf <- returnMean_SD("train\\Inertial Signals\\body_gyro_y_train.txt", trainBaseDf, 
                              "Body.GyroYtrain_Mean", "Body.GyroYtrain_Sd");
  
  trainBaseDf <- returnMean_SD("train\\Inertial Signals\\body_gyro_z_train.txt", trainBaseDf, 
                              "Body.GyroZtrain_Mean", "Body.GyroZtrain_Sd");
  
  ##Load Total Acc X/Y/Z
  trainBaseDf <- returnMean_SD("train\\Inertial Signals\\total_acc_x_train.txt", trainBaseDf, 
                              "Total.AccXtrain_Mean", "Total.AccXtrain_Sd");
  
  trainBaseDf <- returnMean_SD("train\\Inertial Signals\\total_acc_y_train.txt", trainBaseDf, 
                              "Total.AccYtrain_Mean", "Total.AccYtrain_Sd");
  
  trainBaseDf <- returnMean_SD("train\\Inertial Signals\\total_acc_z_train.txt", trainBaseDf, 
                              "Total.AccZtrain_Mean", "Total.AccZtrain_Sd");

  ##Write aggregate dataset
  write.csv(trainBaseDf, file="SamsungData.csv")
  
  
  ##Result of merged data from TEST and TRAIN
  mergeData <- merge(testBaseDf, trainBaseDf, by.x = "Subject", by.y = "Subject2", ALL=TRUE, all.x = TRUE, all.y = TRUE)
  mergeData <- full_join(testBaseDf, trainBaseDf, by = c("Subject" = "Subject2", "ActivityId" = "ActivityId2"))
  
  
  ##Removing ActivityId from the output, since activity description is already there.
  mergeData1 <- select (mergeData, -ActivityId)     
  mergeData1[is.na(mergeData1$ActivityName),]$ActivityName <- mergeData1[is.na(mergeData1$ActivityName),]$ActivityName2  
  write.table(mergeData1, file="SamsungData.txt", row.name=F)
  
  
  ##subset the dataset by Activity
  ##mergedDsByAct <- subset (mergeData, select = -c(Subject, ActivityName2))
  mergedDsByAct <- select (mergeData1, -Subject)
  mergedDsByAct <- aggregate(mergedDsByAct, by = list(mergedDsByAct$ActivityName), FUN=mean, na.rm=T)
  mergedDsByAct$ActivityName <- NULL
  colnames(mergedDsByAct)[1] <- "ActivityName"
  write.table(mergedDsByAct, file="SamsungDataByActivity.csv", row.name=F)
  
  ##subset the dataset by Subject
  mergedDsBySbj <- subset (mergeData1, select = -c(ActivityName))
  mergedDsBySbj <- aggregate(mergedDsBySbj[, 3:ncol(mergedDsBySbj)], list(mergedDsBySbj$Subject), mean,na.rm=TRUE)
  colnames(mergedDsBySbj)[1] <- "Subject"
  write.table(mergedDsBySbj, file="SamsungDataBySubject.csv", row.name=F)
  
  
}
  
returnMean_SD <- function(fileName, mainDF, meanColname, sdColName){
  tmDf <- read.table(fileName)
  tmDf <- data.frame(meanColname = rowMeans(tmDf), sdColName = rowSds(as.matrix(tmDf)));
  colnames(tmDf) <- c(meanColname,sdColName);
  mainDF <- cbind(mainDF, tmDf)
  
  mainDF
}