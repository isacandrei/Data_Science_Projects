#Load into data into environment
data <- read.table("start_3d.txt")

#Determine distance matrix
d <- dist(data, method="euclidean")

#Cluster for dendogram
fit <- hclust(d, method="ward")