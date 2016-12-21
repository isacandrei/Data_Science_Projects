function [SSE] = KMeansEval2 (data,kvalues,clustMethod,distance)

SSE=zeros(length(kvalues),2);

for m=1:50
%For each value of K
for i=1:length(kvalues)
  [clusters,c] = kmeans(data,kvalues(i),'MaxIter',500,'Start',clustMethod,'Distance',distance,'Options',statset('UseParallel',1));
  SSE(i,1)=kvalues(i);
  [s,~]=size(c);
  for j=1:s
    idx=find(clusters==i);
    d=distance;
   for k=1:length(idx) 
       if (strcmp(distance,'sqeuclidean'))
       d='euclidean';
       end;
       SSE(i,2)=SSE(i,2)+power(pdist2(c(j,:),data(idx(k),:),d),2);
   end;
   
  end;
end;
end;
SSE(:,2)=SSE(:,2)/50;



