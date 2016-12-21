data = readtable('stars_3d.txt', 'delimiter', ' ');

data = table2array(data);
data = datasample(data,0.1*length(data));
figure
scatter3(data(:,1),data(:,2),data(:,3));

data = readtable('stars_6d.txt', 'delimiter', ' ');

data = table2array(data);
data = datasample(data,0.1*length(data));

figure
quiver3(data(:,1),data(:,2),data(:,3),data(:,4),data(:,5),data(:,6));