% 6D
%-------------------------------------------------------------------------
data = readtable('stars_6d.txt', 'delimiter', ' ');

data = table2array(data);
data = datasample(data,0.1*length(data));
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[2:10:102],'plus','sqeuclidean');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_6d_l-0_1_meth-plus_dist-sq_eucl_clust-2_102.fig');
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[40:1:60],'plus','sqeuclidean');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_6d_l-0_1_meth-plus_dist-sq_eucl_clust-40_60.fig');
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[40:1:60],'sample','sqeuclidean');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_6d_l-0_1_meth-sample_dist-sq_eucl_clust-40_60.fig');
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[40:1:60],'cluster','sqeuclidean');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_6d_l-0_1_meth-cluster_dist-sq_eucl_clust-40_60.fig');
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[40:1:60],'uniform','sqeuclidean');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_6d_l-0_1_meth-uniform_dist-sq_eucl_clust-40_60.fig');
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[25:1:35],'plus','cosine');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_6d_l-0_1_meth-plus_dist-cosine_clust-25_35.fig');
