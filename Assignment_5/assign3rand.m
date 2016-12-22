data3d = readtable('stars_3d.txt', 'delimiter', ' ');

data3d = table2array(data3d);

data3d = datasample(data3d, 33000, 'Replace', false);

loglike3 = zeros(100,1);

for i=1:100 
    
  GMModel = fitgmdist(data3d, i, 'Start', 'randSample', 'RegularizationValue', 0.1);
  
  loglike3(i,1) = GMModel.NegativeLogLikelihood;
   
end

figure(1)
plot([1:100], loglike3);
xlabel('K');
ylabel('Log likelihood');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

data6d = readtable('stars_6d.txt', 'delimiter', ' ');

data6d = table2array(data6d);

data6d = datasample(data6d, 33000, 'Replace', false);

loglike6 = zeros(100,1);

for i=1:100 
    
  GMModel = fitgmdist(data6d, i, 'Start', 'randSample', 'RegularizationValue', 0.1);
  
  loglike6(i,1) = GMModel.NegativeLogLikelihood;
   
end

figure(2)
plot([1:100], loglike6);
xlabel('K');
ylabel('Log likelihood');