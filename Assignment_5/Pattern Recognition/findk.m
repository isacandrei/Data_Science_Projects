function findk(kmax,iters,kpp)

load('kmeans1');
je=zeros(kmax,1);
rk=zeros(kmax,1);
dk=zeros(kmax,1);
for k=1:kmax
    temp_j=0;
    for i=1:iters
        temp_j=temp_j+kmeans(kmeans1,k,kpp);
    end; 
    je(k)=temp_j/iters;
    rk(k)=je(1)*power(k,(-2)/2);
    dk(k)=rk(k)/je(k);
end;

[~, b]=max(dk);
figure
plot(1:1:kmax,dk);
hold on;
plot(1:1:kmax,je);
plot(1:1:kmax,rk);
plot([b b],get(gca, 'ylim'))


