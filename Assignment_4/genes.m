G = readtable('genes.csv', 'delimiter', '\t');
G(1,:) = [];
gene = G(:,1); 
G(:,[1,2,3]) = [];
clones = G.Properties.VariableNames;

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


minSup = 0.01;
minConf = 0.2;
nRules = 1000;
sortFlag = 1;
fname = 'GenesRules'; 

for s = 1:noGenes
    labels{s} = ['Gene ' gene.YORF{s} ' high'];
end
for s = 1:noGenes
    labels{s+noGenes} = ['Gene ' gene.YORF{s} ' low'];
end

% tic; %Measure time needed to run code
% 
% [Rules, FreqItemsets, RuleConf, RuleSup] = findRules(matrix, minSup, minConf, nRules, sortFlag, labels, fname);
% 
% time = toc
% 
% noUp = 0;
% for i = 1:size(RuleConf,1)
%     if(Rules{1}{i} > noGenes || Rules{2}{i} > noGenes)
%         noUp = noUp + 1;
%     end
% end

%consider only the overexpressed genes
newMatrix = matrix(:, (1:noGenes));
labelsUp = labels(:,(1:noGenes));

minSup = 0.15;
minConf = 0.8;
nRules = 10000;
sortFlag = 1;
fname = 'GenesRulesUp2'; 

tic; %Measure time needed to run code

[RulesUp, FreqItemsetsUp, RuleConfUp, RuleSupUp] = findRules(newMatrix, minSup, minConf, nRules, sortFlag, labelsUp, fname);

time = toc
