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

%
figure(1);
bar(M.imdbRating(1:1000)-M.tomatoRating(1:1000))
% 
y=unique(year(M.ReleaseDate));
%arr[1]-production year, arr[2]-average gross, arr[3] - number of movies
arr=zeros(length(y),3);
for i=1:length(y)
    arr(i,1)=y(i);
    moviesPerYear=find(year(M.ReleaseDate)==y(i));
    arr(i,3)=length(moviesPerYear);
    for j=1:length(moviesPerYear)
        %calculate the total gross of all movies released that year
        arr(i,2)=M.WorldwideGross(i);
    end;
    %calculate the average
    arr(i,2)=arr(i,2)/arr(i,3);
end;

figure(2);
bar(arr(:,1),arr(:,3));
figure(3);
bar(arr(:,1),arr(:,2));

figure(4)
plot(M.Rank,(M.WorldwideGross));