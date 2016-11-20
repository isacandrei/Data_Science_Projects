% Import CSV file into MatLab as table
M = readtable('movievalue.csv');

% Remove $ signs and convert values to doubles
M.ProductionBudget = strrep(M.ProductionBudget, '$', '');
M.ProductionBudget = str2double(M.ProductionBudget);

M.DomesticGross = strrep(M.DomesticGross, '$', '');
M.DomesticGross = str2double(M.DomesticGross);

M.WorldwideGross = strrep(M.WorldwideGross, '$', '');
M.WorldwideGross = str2double(M.WorldwideGross);

% Convert values to date format
M.ReleaseDate = datetime(M.ReleaseDate,'InputFormat','MM/dd/yyyy');

% Replace unknown characters
M.Movie = strrep(M.Movie, '—', '-');
M.Movie = strrep(M.Movie, '’', char(39));

% Get information from API and join them to table
Extension = FetchFromAPI(M,1100);
M = join(M, Extension);


