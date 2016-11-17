M = readtable('movievalue.csv');
%---------------------------------------
M.ProductionBudget = strrep(M.ProductionBudget, '$', '');
M.ProductionBudget = str2double(M.ProductionBudget);
%---------------------------------------
M.DomesticGross = strrep(M.DomesticGross, '$', '');
M.DomesticGross = str2double(M.DomesticGross);
%---------------------------------------
M.WorldwideGross = strrep(M.WorldwideGross, '$', '');
M.WorldwideGross = str2double(M.WorldwideGross);
%---------------------------------------
M.ReleaseDate = datetime(M.ReleaseDate,'InputFormat','MM/dd/yyyy');


