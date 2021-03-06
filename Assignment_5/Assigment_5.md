Assignment 5 (Group 16)
===============================================

**Andrei Isac (S3257053) - David Pavlov (S3187330) - Win Leong Xuan (S3208435)**

**Introduction to Data Science**

**December 22, 2016**

1. Agglomerative Clustering
----------------------------
For this assignment we have considered a combination of Matlab and R for their already build libraries. 

#### 1.1 Difficulties (Big dataset, Large distance matrix,too much computational time)
Because of the large dataset (330000 records) of the type double, the distance matrix (330000 x 330000) would be too large to store in memory. therefore we have sampled the data with the Matlab function `datasample`, which ensures random sapling of the data. The computational time for the `clusteddata` function is also to big for the whole dataset. 

#### 1.2 Solutions (uniformly sample from dataset, change linkage method to ward?)
We have sampled the data with the Matlab function `datasample`, which ensures random sapling of the data. The data used consists of 10% of the initial dataset. Of course, different linkage methods reflect different running times, the most effective one being the `ward`. (Please correct me if not.)
#### 1.3 
Well, the obvious difference between the 2 sets of data is that the 3d data represents points in space, while the 6d data represents points in space with their corresponding vector of speed and direction. 
The hopkins analysis was performed in this [*script*](Assign1.R) for both 3d and 6d data using R `clustertend` library. The results are:

`0.01340395` for the 3d data taking 1000 samples from the data set. 
`0.05771323` for the 6d data taking 1000 samples from the data set. 

The hopkins analysis is very computationally expensive, running it for 1000 samples took over 6 hours for each data set. Also these results are not favourable for clustering, both are less than 0.5 => the data is randomly distributed.

#### 1.4 Plots

The dendograms were created using 33.000 random data entries form the initial data set. The folowing Linkages were generated: Average, Centroid, Complete, Single Link and Ward. The differences between them will be outlined in section 1.5.


#### Single Linkage

![] (images/single.png)
![] (images/single6d.png)

#### Complete Linkage

![] (images/complete.png)
![] (images/complete6D.png)

#### Average Linkage

![Average Linkage Dendogram - 3D] (images/average_3d.png)
![Average Linkage Dendogram - 6D] (images/average_6d.png)

#### Cetroid Linkage

![] (images/centroid.png)
![] (images/centroid6d.png)

#### Ward Linkage

![] (images/ward.png)
![] (images/ward6d.png)


#### 1.5 Linkages

The dendograms were considered as the representation of 5 different Linkages: average, centroid, complete, single, ward. All the dendodrams were generated with the same randomly sampled data set.

The complete link, as opposed to single link, considers the distance between the two most distant points in the data, therefore this gives better results then the single link method. 

Another method for cluster validation is the average link, which computes the averages of all the distances between the points of two clusters before merging them, this can be seen as an improvement to the complete link, but it is more computationally expensive.

We consider that the Ward method gives the most interesting results based on the dendograms, because it has the biggest differences between the clusters, meaning the clusters are better defined, that the link did not merge clusters that are not similar.

2. K-Means Clustering
----------------------------
#### 2.1. Proof of convergence 
In order to prove the convergence of the K-Means algorithm let us first look at some of its properties:

1. There are k<sup>N</sup> possible assignments
2. On each iteration the closest point to a centroid is assigned to the cluster it represents
3. The positions of the centroids are recalculated
  
At each iteration the algorithm performs number of assignments. A point can be either assigned to a new cluster or left in the old one. As a result the centroid may change or may remain the same. If the centroid changes it reduces the distance to the members of the cluster it represents. Since there is a finite number of possible assignments the algorithm will either enter a cycle where individual points will switch between neighbour cluster (especially in case of high density data),in which case there will be small changes in the SSE for the different clusters, or will not change at all. Hence the algorithm will converge in finite time.

#### 2.2. Difference between 3D and 6D data
The following two plots represent the visual difference between the 3D and 6D data.

![Scatter plot of the 3D Data](images/scatter3d.jpg)

![6D Data plotted](images/quiver6d.jpg)

As it is seen from the figures the 3D data seems to be more dense on one of the sides and more scattered on the other. When the velocities are applied it is easy to see that the density which is observed on the 3D scatter plot is actually the galactic centre. From the two plots it is easy to see that the 3D does not bring much visual information and one can not make many assumptions about the arrangement of the stars while the 6D gives much more clearer idea what each point in the data set represents and how it is positioned compared to the others.

#### 2.3. Best number of K 
In order to select the best possible K some evaluation should be performed. The most appropriate K would be the one that minimizes the summarized square error (SSE). In finding the most appropriate value of K the following steps were followed:
  1 10% of the original data is uniformly sampled.
  2 For K values ranging from 10 to 100, increasing with step 10 the KMeans method is applied.
  3 At the end of the clustering for each cluster size is calculated the SSE.
  4 The process is repeated 50 times for different initial prototypes in order to minimize initialization errors.
  5.The final value of SSE represents the average result from running the process 50 times for each cluster size.
  
After the above described process is complete there is an initial point for analysis. After plotting the 3D data it is easy to see that there is a drastic drop in SSE for clustering of size 40. After applying the elbow criterion it may be assumed that the optimal value of K is between 20 and 40. 

The source code used for this results is `Assign2.m (for the 3D data),Assign2_2.m and Assign26D.m(for the 6D data)`

Thw following results are obtained by using kmeans++ initialization and squared euclidean distance : 
![](images/data_3d_l-0_1_meth-plus_dist-sq_eucl_clust-2_102.jpg)

In order to get more precise results the next step is to explore this region. To get these results the above described iteration is repeated, this time for K in the interval between 20-40. The following plots shows the results from the iteration.
 
![](images/data_3d_l-0_1_meth-plus_dist-sq_eucl_clust-20_40.jpg)

![](images/silhouette_3d_25_clusters.jpg)

As a result the value of K which minimizes the value of SSE is 25 which is confirmed by the silhouette plot.
 
![](images/data_6d_l-0_1_meth-plus_dist-sq_eucl_clust-40_60.jpg)

For the 6D data the it is 44.

#### 2.4. Different distances of measure
In order to achieve better results different measures can be used. The performance of the algorithm 
###Squared Euclidean

![3D Data](images/data_3d_l-0_1_meth-plus_dist-sq_eucl_clust-2_102.jpg)
![6D Data](images/data_6d_l-0_1_meth-plus_dist-sq_eucl_clust-2_102.jpg)

###Cosine
3D Data
![3D Data](images/data_3d_l-0_1_meth-plus_dust-cosine_clust-20_40.jpg)
6D Data
![6D Data](images/data_6d_l-0_1_meth-plus_dist-cosine_clust-25_35.jpg)

#### 2.5. Cluster prototype initialization
The initialization of the prototypes is of high importance in kmeans. A proper initialization may lead to faster convergence and better results.
There are different initialization methods such as : selecting k observations at random, selecting uniformly k observations at random, performing preliminary clustering of the data, etc.

###Cluster
3D Data
![3D Data](images/data_3d_l-0_1_meth-cluster_dist-sq_eucl_clust-20_40.jpg)
6D Data
![6D Data](images/data_6d_l-0_1_meth-cluster_dist-sq_eucl_clust-40_60.jpg)


###Sample
3D Data
![3D Data](images/data_3d_l-0_1_meth-sample_dist-sq_eucl_clust-20_40.jpg)
6D Data
![6D Data](images/data_6d_l-0_1_meth-sample_dist-sq_eucl_clust-40_60.jpg)

###Uniform
3D Data
![3D Data](images/data_3d_l-0_1_meth-uniform_dist-sq_eucl_clust-20_40.jpg)
6D Data
![6D Data](images/data_6d_l-0_1_meth-uniform_dist-sq_eucl_clust-40_60.jpg)

It is clear that each initialization method gives different results. In order to find the optimal one for given data set certain tests have to be made. Also depending on the data different methods have to be chosen in order to achieve the best possible results. For this particular data set the cosine similarity proves to be give best results. 


3. Gaussian Mixture Model
----------------------------
#### 3.1 Pseudo-code for GMM

1) Estimate θ (initial weights, means and covariance matrices) given observed data point and discrete random variable using the likelihood function

2) Estimation step: for each data point take the expectation using the current θ(m) and compute the responsibility of Gaussian k (each cluster) for each data point

3) Maximization step: for each Gaussian k (each cluster) update the θ(m+1) parameter

4) Evaluate the log likelihood value at each iteration by returning to step 2 until it stabilizes (e.g. if it does not change anymore)

#### 3.2.1 Initial covariance matrices and means
For this exercise, we have used 2 methods to initialize the initial converiance matrices and means. These methods are random and using the K-Means++ algorithm. For the random initialization, the function selects k observation of the data set as the initial means and the covariance matrices are diagonal meaning that the variance of each feature will be each diagonal feature in the covariance matrix. When using K-Means++ algorithm, K-Means++ algorithm will be executed first in order to compute k centroids as the initial means for the EM algorithm. The covariance matrices for this method will still be diagonal.

#### 3.2.2 Likelihood function values
For this exercise, we used the "datasample" function in MatLab to randomly sample data point uniformly from the data set without replacement. In our case, we used sampled 10% of the data set. Afterwards, we used the "fitgmdist" function from MatLab where it will fit the data set into k components (clusters). From this function, we will iterate for different k components and the log likelihood value is observed. The script for random initialization is called [*assign3rand.m*](assign3rand.m) and the script for K-Means++ initialization is called [*assign3plus.m*](assign3plus.m).

<center>**Random Initialization for 3D data set**</center>

![Random Initialization](images/loglike3d_rand.png)

<center>**K-Means++ Initialization for 3D data set**</center>

![K-Means++ Initialization](images/loglike3d_plus.png)

We can see that there is no significant difference between the different initializations. We can also note that around ~30-40 components, the likelihood value will not change anymore.

<center>**Random Initialization for 6D data set**</center>

![Random Initialization](images/loglike6d_rand.png)

<center>**K-Means++ Initialization for 6D data set**</center>

![K-Means++ Initialization](images/loglike6d_plus.png)

We can also note that there is no significant different between the log likelihood values from the different initialization. It is also good to note, it is not so clear to determine an optimal k components from the graphs, because from the 100 iterations, we can see that the likelihood value is still changing. We can roughly say that the optimal k components would be around ~50-60.

#### 3.3 Compare the cluster cohesion and separation
For this exercise, we generated a plot of the posterior probabilities of the components where we then filter out the the stars with a probability higher than 0.7 belonging to a cluster. Then we summed up every star in their cluster to find the largest cluster in the galaxy. Afterwards, for the biggest cluster, we will then find the corresponding indices of the stars belonging to the largest cluster. The script used for this exercise is [*Assign3_3.m*](Assign3_3.m). The indices for the largest cluster can be found in the `indices_3_3_3d.mat` and `indices_3_3_6d.mat`.

<center>**3D Data**</center>

![3D Data](images/scatter3probPlot.jpg)

<center>**6D Data**</center>

![6D Data](images/scatter6probPlot.jpg)


4. May the "best" win
----------------------
In order to achieve the best results, the methods which were explained in 2 were used. First analyze cluster sizes up to 100,starting from 2 and incrasing the step by 10, to find a region where the error drops. Once such a region is found more precise analysis is performed. In order to find the method which gives minimum error several initialization methods and distances were used. For the 3D and 6D data the combination of kmeans++ initialization and cosine distance gives the results with minimum error.For the 3D data the optimal number of clusters is 24 while for the 6D it came out to be 31. The results from the clustering can be found in files `group_16_best_3d.txt` and `group_16_best_6d.txt` where each line's number is the index of the row in the matrix and each value is the number of the cluster it is part of.
