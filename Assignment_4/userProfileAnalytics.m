M = readtable('usersha1-profile.csv', 'delimiter', '\t');

M.Properties.VariableNames = {'id' 'sex' 'age' 'country' 'date'};

M = M(~(strcmp(M.sex, '') | isnan(M.age) | strcmp(M.country, '')), :);

M = M(M.age > 7, :);

M = M(M.age < 120, :);

ageRanges = [0 18; 18 25; 25 35; 35 45; 45 60; 60 120];

countAge = zeros(size(ageRanges,1),1);
for i = 1:size(ageRanges,1)
    countAge(i) = height(M(M.age > ageRanges(i,1) & M.age < ageRanges(i,2), :));
end

ageGroups = {'<18', '18-25', '25-35', '35-45', '45-60', '60+'};

figure
bar(countAge)
set(gca, 'XTick', 1:size(ageGroups,2), 'XTickLabel', ageGroups);
title('Age distribution')
xlabel('Age Group')
ylabel('Number of users')

