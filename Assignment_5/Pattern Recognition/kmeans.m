function je= kmeans(data ,k,kpp)

close all;
[r, f]=size(data); % get the number of rows and features
p=zeros(k,r);
%if explicitly said then use kmeans++ initialization
if kpp==true()
    
    idx=randsample(r,1);
    init_clust=zeros(k,f);
    init_clust(1,:)=data(idx,:);
    sample=data;
    sample(idx,:)=[];
    [sr sc]=size(sample);
    dist=zeros(sr,1);
    %compute distances for cluster 1
    sumdist=0;
    for i=1:sr   
      dist(i)=pdist2(init_clust(1,:),sample(i,:),'euclidean');   
      sumdist=sumdist+dist(i);
    end;
    %calc probabilities for cluster 1
    %p=zeros(length(sample),1);
    p(:,idx)=[];
    for i=1:sr
        p(1,i)=dist(i)/sumdist;
    end;
    %proceed defining the other clusters
    for i=2:k
        %prob=min(dist)/sum(dist);
        %randsample(sr,
        %idx=find(rand<cumsum(sum(p(i-1,:))),1,'first');
        idx=randsample(sr,1,true,dist);
        init_clust(i,:)=sample(idx,:);
        sample(idx,:)=[];
        [sr sc]=size(sample);
        p(:,idx)=[];
        dist=zeros(sr,1);
        sumdist=0;
        for j=1:sr
           dist(j)=pdist2(init_clust(i,:),sample(j,:),'euclidean');    
           sumdist=sumdist+dist(j);
        end;
        %calculate the probabilities
        for j=1:sr
            p(i,j)=dist(j)/sumdist;
        end;
    end;
    
    %normalize probabilities
    for a=1:length(p)
        csum=sum(p(:,a));
        for b=1:k
            p(b,a)=p(b,a)/csum;
        end;
    end;
    
else   
%initialize means using the simple kmeans initialization
    ids = randperm(r,k); 
    init_clust(length(ids),f)=zeros(); 
    for i=1:k
        init_clust(i,1:f)=data(ids(i),:);
    end;         
end;

m=init_clust;
cluster_assign=zeros(r,1);
assignment = true();
counter=0;

while assignment==true()
    counter=counter+1;
    for i=1:r
        assignment=false();
        temp_dist = length(m);
        
        for j=1:k
         D=pdist2(data(i,:),m(j,:),'euclidean');
         temp_dist(j)=D;
        end; 
        
        [~, b]=min(temp_dist);
        
        if b~=cluster_assign(i)
           cluster_assign(i)=b;
           assignment=true();
        end;
    end; 
    %recalculate the means
    for j=1:k
        temp_m=zeros(1,2);
        
        %get the ids of all elements from cluster j
        t= find(cluster_assign==j);
        for z=1:length(t)
           temp_m(1,:)=temp_m(1,:)+data(t(z),:);
        end;
        m(j,:)=temp_m/length(t);
    end;
   
end;

plot_results(k,cluster_assign,data,init_clust,m);

je=0;
je=je+calc_error(k,cluster_assign,data,m);
