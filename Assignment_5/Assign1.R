#Load into data into environment
library("clustertend")

data <- read.table("stars_6d.txt")

hopkins(data,n=1000)

data <- read.table("stars_3d.txt")

hopkins(data,n=1000)

#Determine distance matrix
#d <- dist(data, method="euclidean")

#Cluster for dendogram
#fit <- hclust(d, method="ward")