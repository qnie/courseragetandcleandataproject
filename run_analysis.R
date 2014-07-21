courseragetandcleandataproject
==============================
## Change directory to "D:/UCI HAR Dataset"

## Step 1
setwd("train")
 Xtrain<-read.table("X_train.txt")
 Ytrain<-read.table("Y_train.txt")
 strain<-read.table("subject_train.txt")

 setwd("test")
 Xtest<-read.table("X_test.txt")
 Ytest<-read.table("Y_test.txt")
 stext<-read.table("subject_test.txt")
 stest<-read.table("subject_test.txt")

## Merge
 merge1<-rbind(Xtrain, Xtest)
 merge2<-rbind(strain, stest)
 merge3<-rbind(Ytrain, Ytest)

 data1<-cbind(merge1, merge2, merge3)



## Step 2
##read features.txt file
step2 = read.table("features.txt", col.names=c("step2_id", "step2_labels"),)
selec_step2 <- step2[grepl("mean\\(\\)", step2$step2_labels) | grepl("std\\(\\)", step2$step2_labels), ]
data2 <- merge[, c(c(1, 2, 3), selec_step2$step2_id + 3) ]


## step 3
## read file 
step3 = read.table("activity_labels.txt", col.names=c("activity_id", "activity_labels"),) 
data3 <- merge(data1, activity_labels)



## step 4
library(reshape)
library(reshape2)
step4<-rename(selec_step2, c(step2_id="Subject",step2_labels="Activity"))

 
## step 5
step5 <- dcast(step4 , Subject + Activity ~ variable, mean)
write.table(step5, file="TinyData.txt", sep = " ")
