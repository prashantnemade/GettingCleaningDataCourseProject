# Calling setInternet2(TRUE) has R make use of the ‘internet2.dll’ library for Internet access, which makes use of Internet Explorer functions
setInternet2(TRUE)

# Creating data folder in working directory to download the data
if(!file.exists("./data")){dir.create("./data")}

# File url of the data to be downloaded
Fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

# Downloading file to data folder and name of the downloaded file would be Project_Data.zip. Have not used method="curl" because i am using windows operating system.
download.file(Fileurl,destfile="./data/Project_Data.zip")

# Saving the date of download
Date_Downloaded<-date()

# Unziping the downloaded file
unzip("./data/Project_Data.zip",exdir="./data")

## Exploring data folder and unzipped downloaded data folder
list.files("./data")
list.files("./data/UCI HAR Dataset")

## Loading Features file into R 
# Loading sample of features file to get metadata (Which is column names for measurement data in train and test folder)
Sample_Features <- read.table("./data/UCI HAR Dataset/features.txt",nrow=5)
str(Sample_Features)
head(Sample_Features)
## Findings from str(Sample_Features) : features data has two columns without header.
## Findings from head(Sample_Features) : First column is the serial number and second is column name for measurement data.

# Loading entire Features file
Features <- read.table("./data/UCI HAR Dataset/features.txt",col.names=c("Sr_No","Col_Name"),colClasses=rep("character",2))
str(Features)
head(Features)
tail(Features)

# Loading sample of Activity Labels file to get metadata
Sample_Activity_Label <- read.table("./data/UCI HAR Dataset/activity_labels.txt",nrow=5)
str(Sample_Activity_Label)
head(Sample_Activity_Label)
## Findings from str(Sample_Activity_Label) : activity_labels file has two columns without header.
## Findings from head(Sample_Activity_Label) : First column is the activity code and second is activity label.

# Loading entire activity label file
Activity_Label <- read.table("./data/UCI HAR Dataset/activity_labels.txt",col.names=c("Act_Code","Activity_Label"),colClasses=rep("character",2))
str(Activity_Label)
head(Activity_Label)
tail(Activity_Label)

# Removing unnecessary objects
ls()
rm("Sample_Features","Sample_Activity_Label")
ls()

## Exploring contents of train folder
list.files("./data/UCI HAR Dataset/train")

## Loading Train file for subjects into R 
# Loading sample of train subject file to get metadata
Sample_Train_Sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",nrow=5)
str(Sample_Train_Sub)
## Findings from str(Sample_Train_Sub): subject_train file has only one column without header.
head(Sample_Train_Sub)

# Loading entire train subject file
Train_Sub <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",col.names="Subject",colClasses="character")
str(Train_Sub)
head(Train_Sub)
tail(Train_Sub)

# Computing frequency of each subject in a train dataset
table(Train_Sub$Subject)

## Loading Train file for activity into R 
# Loading sample of train activity file to get metadata
Sample_Train_Act <- read.table("./data/UCI HAR Dataset/train/y_train.txt",nrow=5)
str(Sample_Train_Act)
## Findings from str(Sample_Train_Act): y_train file has only one column without header.
head(Sample_Train_Act)

# Loading entire train activity file
Train_Act <- read.table("./data/UCI HAR Dataset/train/y_train.txt",col.names="Act_Code",colClasses="character")
str(Train_Act)
head(Train_Act)
tail(Train_Act)

# Computing frequency of each activity code in a train dataset
table(Train_Act$Act_Code)

## Loading Train file for measurement into R 
# Loading sample of train measurement file to get metadata
Sample_Train_Measure <- read.table("./data/UCI HAR Dataset/train/x_train.txt",nrow=5)
str(Sample_Train_Measure)
dim(Sample_Train_Measure)
## Findings from str(Sample_Train_Measure): x_train file has 561 columns without header.
head(Sample_Train_Measure)

# Loading entire train measurement file
Train_Measure <- read.table("./data/UCI HAR Dataset/train/x_train.txt",col.names=Features[,2],colClasses=rep("numeric",561))
dim(Train_Measure)
str(Train_Measure)
head(Train_Measure)
tail(Train_Measure)

# Removing unnecessary objects
ls()
rm("Sample_Train_Act","Sample_Train_Measure","Sample_Train_Sub")
ls()

## Exploring contents of test folder
list.files("./data/UCI HAR Dataset/test")

## Loading test file for subjects into R 
# Loading sample of test subject file to get metadata
Sample_Test_Sub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",nrow=5)
str(Sample_Test_Sub)
## Findings from str(Sample_Test_Sub): subject_test file has only one column without header.
head(Sample_Test_Sub)

# Loading entire test subject file
Test_Sub <- read.table("./data/UCI HAR Dataset/test/subject_test.txt",col.names="Subject",colClasses="character")
str(Test_Sub)
head(Test_Sub)
tail(Test_Sub)

# Computing frequency of each subject in a test dataset
table(Test_Sub$Subject)

## Loading test file for activity into R 
# Loading sample of test activity file to get metadata
Sample_Test_Act <- read.table("./data/UCI HAR Dataset/test/y_test.txt",nrow=5)
str(Sample_Test_Act)
## Findings from str(Sample_Test_Act): y_test has only one column without header.
head(Sample_Test_Act)

# Loading entire test activity file
Test_Act <- read.table("./data/UCI HAR Dataset/test/y_test.txt",col.names="Act_Code",colClasses="character")
str(Test_Act)
head(Test_Act)
tail(Test_Act)

# Computing frequency of each activity code in a test dataset
table(Test_Act$Act_Code)

## Loading test file for measurement into R 
# Loading sample of test measurement file to get metadata
Sample_Test_Measure <- read.table("./data/UCI HAR Dataset/test/x_test.txt",nrow=5)
str(Sample_Test_Measure)
dim(Sample_Test_Measure)
## Findings from str(Sample_Test_Measure): x_test file has 561 columns without header.
head(Sample_Test_Measure)

# Loading entire test measurement file
Test_Measure <- read.table("./data/UCI HAR Dataset/test/x_test.txt",col.names=Features[,2],colClasses=rep("numeric",561))
dim(Test_Measure)
str(Test_Measure)
head(Test_Measure)
tail(Test_Measure)

# Removing unnecessary objects
ls()
rm("Sample_Test_Act","Sample_Test_Measure","Sample_Test_Sub")
ls()

## Checking Dimensions of different Train datasets
dim(Train_Sub)
dim(Train_Act)
dim(Train_Measure)

## These three Train data frames have equal number of rows. Hence we can combine them to get a consolidated Train dataframe
Train_Df <- cbind(Train_Sub,Train_Act,Train_Measure)
dim(Train_Df) 

## Checking Dimensions of different Test datasets
dim(Test_Sub)
dim(Test_Act)
dim(Test_Measure)

## These three Test data frames have equal number of rows. Hence we can combine them to get a consolidated Test dataframe
Test_Df <- cbind(Test_Sub,Test_Act,Test_Measure)
dim(Test_Df) 

## Merging the training and the test sets to create one data set
## Train and Test dataset has same number of columns (563 Columns) hence can be combined one below the other
Data_Df<-rbind(Train_Df,Test_Df)
dim(Data_Df)

# Removing unnecessary objects
ls()
rm("Features","Fileurl","Test_Act","Test_Measure","Test_Sub","Test_Df","Train_Act","Train_Measure","Train_Sub","Train_Df")
ls()

## Extracting only the measurements on the mean and standard deviation for each measurement
# Extracting column indices of Data_Df where column names of Data_Df contain mean or std in it.
Mean_SD_Col_Index <- grep("MEAN|STD", toupper(colnames(Data_Df)))

# Subsetting Data_Df with column indices (columns with mean and standard deviation), Subject and Act_Code
Data_Df_MeanSD <- Data_Df[,c(1,2,Mean_SD_Col_Index)]
dim(Data_Df_MeanSD)
str(Data_Df_MeanSD)

# Removing unnecessary objects
ls()
rm("Mean_SD_Col_Index")
ls()

## Assigning descriptive activity names to name the activities in the data set
Data_Df_MeanSD <- merge(Data_Df_MeanSD,Activity_Label,by.x="Act_Code",by.y="Act_Code",all.x=TRUE)
dim(Data_Df_MeanSD)
# Creating Frequency Distribution of Activity Code and Activity Label to authenticate merging of two datasets
table(Data_Df_MeanSD$Act_Code,Data_Df_MeanSD$Activity_Label)

# Removing unnecessary objects
ls()
rm("Activity_Label")
ls()

## Creating second, independent tidy data set with the average of each variable for each activity and each subject.

library(reshape2)
# Using melt function we are restructuring our dataset in such a way that all measurement variables and their values will be listed in a two seperate columns across each combination of subject and activity label
Data_Df_MeanSD_Melt <- melt(Data_Df_MeanSD, id=c("Subject", "Activity_Label"), measure.vars=names(Data_Df_MeanSD)[3:88])

# dcast function is used to do pivoting of dataset in the required format i.e. Creating a dataset with the average of each variable for each activity and each subject 
Tidy_Data <- dcast(Data_Df_MeanSD_Melt, Subject + Activity_Label ~ variable,mean,na.rm=TRUE)

# Arranging the data in a sequential order i.e. by Subject and Activity Label
library(plyr)
Tidy_Data <- arrange(Tidy_Data,Subject,Activity_Label)
dim(Tidy_Data)
head(Tidy_Data)

# Removing unnecessary objects
ls()
rm("Data_Df_MeanSD_Melt")
ls()

# Exporting tidy dataset created to data folder
write.table(Tidy_Data,"./data/Tidy_Data.txt",row.name=FALSE)