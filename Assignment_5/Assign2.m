data = readtable('stars_3d.txt', 'delimiter', ' ');

data = table2array(data);
data = datasample(data,0.1*length(data));
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[2:10:102],'plus','sqeuclidean');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_3d_l-0_1_meth-plus_dist-sq_eucl_clust-2_102.fig');
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[20:1:40],'plus','sqeuclidean');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_3d_l-0_1_meth-plus_dist-sq_eucl_clust-20_40.fig');
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[20:1:40],'sample','sqeuclidean');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_3d_l-0_1_meth-sample_dist-sq_eucl_clust-20_40.fig');
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[20:1:40],'cluster','sqeuclidean');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_3d_l-0_1_meth-cluster_dist-sq_eucl_clust-20_40.fig');
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[20:1:40],'uniform','sqeuclidean');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_3d_l-0_1_meth-uniform_dist-sq_eucl_clust-20_40.fig');
%-------------------------------------------------------------------------
ess=KMeansEval2(data,[2:10:102],'plus','cosine');
figure
plot(ess(:,1),ess(:,2));
xlabel('K');
ylabel('SSE');
savefig('data_3d_l-0_1_meth-plus_dist-cosine_clust-2_102.fig');


