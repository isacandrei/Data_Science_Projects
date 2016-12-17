Assignment 5 (Group 16)
===============================================

**Andrei Isac (S3257053) - David Pavlov (S3187330) - Win Leong Xuan (S3208435)**

**Introduction to Data Science**

**December XX, 2016**

1. Aglomerative Clustering
----------------------------
For this assigment we have considered a combination of Matlab and R for their already build libraries. 

#### 1.1 Dificulties (Big dataset, Large distance matrix,too much computational time)
Beucause of the large dataset (330000 records) of the type double, the distance matrix (330000 x 330000) would be too large to store in memor. therefore we have sampled the data with the Matlab function `datasample`, which ensures random sapling of the data. The computational time for the `clusteddata` function is also to big for the whole dataset. 

#### 1.2 Solutions (uniformly sample from dataset, change linkage method to ward?)
We have sampled the data with the Matlab function `datasample`, which ensures random sapling of the data. The data used consists of 10% of the initial dataset. Of couser, different linkeade methods reflect different running times, the most offective one beeing the `ward`. (Please correct me if not.)
#### 1.3 
Well, the obvious difference between the 2 sets of data is that the 3d data represents points in space, while the 6d data represents points in space with their corresponding vector of speed and direction. 
The hopkins analysis was performed in this [*script*](Assign1.R) for both 3d and 6d data using R `clustertend` library. The results are:

`0.01340395` for the 3d data taking 1000 samples from the data set. 
`0.05771323` for the 6d data taking 1000 samples from the data set. 

The hopkins analysis is very computationally expensive, running it for 1000 samples took over 6 hours for each data set. Also these results are not favorable for clustering, both are less than 0.5 => the data is randomly distributed.

The matlab `evalclusters`matlab eval clusters


#### 1.4 Plots
![] (Rplot03.png)

#### 1.5 ,complete - larger variance between clusters , ward - 

2. K-Means Clustering
----------------------------

3. Gaussian Mixture Model
----------------------------
