data3d = readtable('stars_3d.txt', 'delimiter', ' ');

data3d = table2array(data3d);

%data3d = datasample(data3d, 33000, 'Replace', false);

GMModel = fitgmdist(data3d, 35, 'Start', 'plus', 'RegularizationValue', 0.1);

[P,~] = posterior(GMModel,data3d);
scatter3(data3d(:,1),data3d(:,2),data3d(:,3),10,P(:,1));
hb = colorbar;

x=P>0.7;
a=sum(x,1);
max_cluster=find(a==max(a));
q = find(P(:,max_cluster)>0.7);

 dlmwrite('assign3_3_3d.txt',q)
 
 %-------------------------------------------------------
 
data6d = readtable('stars_6d.txt', 'delimiter', ' ');

data6d = table2array(data6d);

%data3d = datasample(data3d, 33000, 'Replace', false);

GMModel = fitgmdist(data6d, 50, 'Start', 'plus', 'RegularizationValue', 0.1);

[P,~] = posterior(GMModel,data6d);
quiver3(data6d(:,1),data6d(:,2),data6d(:,3),data6d(:,4),data6d(:,5),data6d(:,6),10,P(:,1));
hb = colorbar;

x=P>0.7;
a=sum(x,1);
max_cluster=find(a==max(a));
q = find(P(:,max_cluster)>0.7);

 dlmwrite('assign3_3_6d.txt',q)

 
 

