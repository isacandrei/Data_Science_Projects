data = readtable('stars_3d.txt', 'delimiter', ' ');

data = table2array(data);
data = datasample(data,length(data));

[clusters,c] = kmeans(data,24,'MaxIter',500,'Start','plus','Distance','cosine','Options',statset('UseParallel',1));
 dlmwrite('group_16_best_3d.txt',clusters)

 data = readtable('stars_6d.txt', 'delimiter', ' ');

data = table2array(data);
data = datasample(data,length(data));

[clusters,c] = kmeans(data,31,'MaxIter',500,'Start','plus','Distance','cosine','Options',statset('UseParallel',1));
 dlmwrite('group_16_best_6d.txt',clusters)

