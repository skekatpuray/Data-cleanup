Progam structure
----------------

Summary of task: Based on the documentation for the lab, there exists two sets of information
stored by "test" and "train".  The following code goes by aggregating all test-related observations,
and then train-related observations.  Later, it merges the test and train observations joining them on
activity and subject.  Even though the subject identifiers are not common between Tests/Train, it's important
to join them on 'subject' variable because we have to aggregate the observations by 'subject'. This also 
means that we will have an alternate pattern of NA (for Test/Train) when we group by subject.

Mean/Standard Deviation for all observations have been performed, merged together with Activity and Subject domain info.
