data = readtable('start_3d.txt', 'delimiter', ' ');

data = table2array(data);

c = clusterdata(data, 'linkage', 'ward','savememory', 'on', 'maxclust', 4);

figure(1)
scatter3(c(:,1), c(:,2), c(:,3));