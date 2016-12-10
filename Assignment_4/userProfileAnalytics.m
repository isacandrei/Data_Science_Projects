M = readtable('usersha1-profile.csv', 'delimiter', '\t');

M.Properties.VariableNames = {'id' 'sex' 'age' 'country' 'date'};

M = M(~(strcmp(M.sex, '') | isnan(M.age) | strcmp(M.country, '')), :);

M = M(M.age > 7, :);

M = M(M.age < 120, :);
