function KmeansPlot(inputdata,k)
close all;
result=kmeans(inputdata,k);
[m,n]=size(inputdata);
if n==3
hold on;
for i=1:k
idx=find(result==i);
scatter3(inputdata(idx,1),inputdata(idx,2),inputdata(idx,3));
end;
end;