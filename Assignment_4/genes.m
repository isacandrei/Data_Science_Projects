%read + clean data
G = readtable('genes.csv', 'delimiter', '\t');
G(1,:) = [];
gene = G(:,2); 
G(:,[1,2,3]) = [];
clones = G.Properties.VariableNames;

%generate matrix for both underexpressed and overexpressed genes (same matrix)
noGenes = height(G);
matrix = zeros(2*noGenes,300);

tic; %Measure time needed to run code

for i = 1:noGenes
    for j = 1:300
        if (G{i,j} < -0.2)
            matrix(i+noGenes,j) = 1;
        elseif (G{i,j} > 0.2)
            matrix(i,j) = 1;
        end
    end
end

time = toc

matrix = transpose(matrix);

%setup algorithm parameters
minSup = 0.01;
minConf = 0.2;
nRules = 1000;
sortFlag = 1;
fname = 'GenesRules'; 

for s = 1:noGenes
    labels{s} = ['Gene ' gene.NAME{s} ' high'];
end
for s = 1:noGenes
    labels{s+noGenes} = ['Gene ' gene.NAME{s} ' low'];
end

tic; %Measure time needed to run code

%run algorithm
[Rules, FreqItemsets, RuleConf, RuleSup] = findRules(matrix, minSup, minConf, nRules, sortFlag, labels, fname);

time = toc

noUp = 0;
for i = 1:size(RuleConf,1)
    if(Rules{1}{i} > noGenes || Rules{2}{i} > noGenes)
        noUp = noUp + 1;
    end
end

%consider only the overexpressed genes
newMatrix = matrix(:, (1:noGenes));
labelsUp = labels(:,(1:noGenes));

%setup algorithm parameters

minSup = 0.1;
minConf = 0.8;
nRules = 10000;
sortFlag = 1;
fname = 'GenesRulesUpNames'; 

tic; %Measure time needed to run code
%run algorithm

[RulesUp, FreqItemsetsUp, RuleConfUp, RuleSupUp] = findRules(newMatrix, minSup, minConf, nRules, sortFlag, labelsUp, fname);

time = toc

%generate over/undexexpressed genes frequent item sets
V = FreqItemsets(:,3);
V = vertcat(V{:});
M = array2table(V);
M.Properties.VariableNames = {'a' 'b' 'c'};

