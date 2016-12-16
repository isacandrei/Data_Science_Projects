data = readtable('start_3d.txt', 'delimiter', ' ');

data = table2array(data);

c = clusterdata(data, 'linkage', 'ward','savememory', 'on', 'maxclust', 4);

figure(1)
scatter3(c(:,1), c(:,2), c(:,3));

data(4,:)=c(1,:);

data1 = data((data(:,4) == 1),:);
data2 = data((data(:,4) == 2),:);
data3 = data((data(:,4) == 3),:);
data4 = data((data(:,4) == 4),:);

scatter3(data1(:,1),data1(:,2),data1(:,3))
hold on;
scatter3(data2(:,1),data2(:,2),data2(:,3))
scatter3(data3(:,1),data3(:,2),data3(:,3))
scatter3(data4(:,1),data4(:,2),data4(:,3))


data = readtable('start_3d.txt', 'delimiter', ' ');
d = datasample(data, 30000);
wss(table2array(d),100)

data2 = readtable('stars_6d.txt', 'delimiter', ' ');

data2 = table2array(data2);

d = datasample(data2, 30000);



