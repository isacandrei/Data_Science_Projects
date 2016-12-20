data = readtable('stars_3d.txt', 'delimiter', ' ');

data = table2array(data);

data = datasample(data, 49500);

eva = evalclusters(data,'kmeans','Silhouette','Klist',[1:50]);

wss = wss(data, 50);