data = readtable('stars_6d.txt', 'delimiter', ' ');

data = table2array(data);
data = datasample(data,0.1*length(data));

c = clusterdata(data, 'linkage', 'ward','savememory', 'on', 'maxclust', 40);
hold on;
for i=1:length(unique(c))
    idx=find(c==i);
    quiver3(data(idx,1),data(idx,2),data(idx,3),data(idx,4),data(idx,5),data(idx,6))
end;
figure(1)
scatter3(c(:,1), c(:,2), c(:,3));