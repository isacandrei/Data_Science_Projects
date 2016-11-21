% Import CSV file into MatLab as table
M = readtable('movievalue.csv', 'delimiter', ';');

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
M.Movie = strrep(M.Movie, '???', '-');
M.Movie = strrep(M.Movie, '???', char(39));

% Get information from API and join them to table
n=1200;
Extension = FetchFromAPI(M,n);
M = join(M, Extension);
%
figure(1);
bar(M.imdbRating(1:n)-M.tomatoRating(1:n))
% 
y=unique(year(M.ReleaseDate(1:n)));
%arr[1]-production year, arr[2]-average gross, arr[3] - number of movies
arr=zeros(length(y),3);
for i=1:length(y)
    arr(i,1)=y(i);
    moviesPerYear=find(year(M.ReleaseDate(1:n))==y(i));
    arr(i,3)=length(moviesPerYear);
    for j=1:length(moviesPerYear)
        %calculate the total gross of all movies released that year
        arr(i,2)= arr(i,2) + M.WorldwideGross(moviesPerYear(j));
    end;
    %calculate the average
    arr(i,2)=arr(i,2)/arr(i,3);
end;

figure(2);
bar(arr(:,1),arr(:,3));
figure(3);
bar(arr(:,1),arr(:,2));

%plot movie rank by worldwide gross
figure(4)
plot(M.Rank(1:n),(M.WorldwideGross(1:n)));



%Bonus Part

%plot profit / production budget
figure(9)

%crop initial table to 1200 rows
T = M(1:n,:);
% get a set of all PB 
x = unique(T.ProductionBudget);

A=zeros(length(x),2);

A(:,1) = x;

for i=1:length(x)
    %find all the movies with a certain PB
    moviesPerBudget = find(T.ProductionBudget == x(i));
    l = length(moviesPerBudget);
    for j = 1:l
        %calculate the total profit of all movies with the same PB made
        A(i,2) = A(i,2) + T.WorldwideGross(moviesPerBudget(j)) - T.ProductionBudget(moviesPerBudget(j));
    end;
    %calculate the average
    A(i,2) = A(i,2)/l;
end;
%plot the graph
bar(A(:,1), A(:,2));


figure(10)
% Convert cell to logical array
Countries = ~cellfun(@isempty,T.Country);

% Find indices of movies that have a registered country
k = find(Countries);

y = [];

% get the complete list of countries
for i=1:length(k)
    z = strsplit(char(T.Country{k(i)}), ', ');
    y = [y, z];
end;
y = unique(y);
y = transpose(y);
z = zeros(size(y));
zmax = zeros(size(y));

%iterate through all the countries
for i=1:length(y)
    %find all movies from a country
    moviesPerCountry = strfind(T.Country(k), y(i));
    moviesPerCountry = ~cellfun(@isempty,moviesPerCountry);
    moviesPerCountry = find(moviesPerCountry);
    l = length(moviesPerCountry);
    %iterate through all the movies filmed in a country
    for j = 1:l
        
        if not(isnan(moviesPerCountry(j)))
            %calculate the total gross of all movies released in that country
            z(i) = z(i) + T.WorldwideGross(moviesPerCountry(j));
            if (T.WorldwideGross(moviesPerCountry(j)) > zmax(i))
                % calculate the maximum gross of all the movies released in
                % that country
                zmax(i) = T.WorldwideGross(moviesPerCountry(j));
            end;
        end
    end;
    %calculate the average
    z(i) = z(i)/l;
end;

%plot average profit graph by country
bar(z);
%plot max profit grapt by contry
figure(11)
bar(zmax);


