---
author: "Sachin Kekatpuray"
date: "Sunday, March 22, 2015"
output: html_document
---
#Progam structure

##Summary of task:
Based on the documentation for the lab, there exists two sets of information
stored by "test" and "train".  The following code goes by aggregating all test-related observations,
and then train-related observations.  Later, it merges the test and train observations joining them on activity and subject.  Even though the subject identifiers are not common between Tests/Train, it's important to join them on 'subject' variable because we have to aggregate the observations by 'subject'. This also means that we will have an alternate pattern of NA (for Test/Train) when we group by subject.
 
Steps:

* Consolidate test-files by merging observations with subjects. 
* Consolidate train-files by merging it's observations with subjects.
* Merge test and train data-sets.
* Generate aggregate SamsungData.txt
* Generate seperate outputs for Samsung data by activity and by subject. 
