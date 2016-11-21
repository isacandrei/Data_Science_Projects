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

figure(4)
plot(M.Rank(1:n),(M.WorldwideGross(1:n)));


figure(9)
T = M(1:n,:);
x = unique(T.ProductionBudget);

A=zeros(length(x),2);

A(:,1) = x;

for i=1:length(x)
    moviesPerBudget = find(T.ProductionBudget == x(i));
    l = length(moviesPerBudget);
    for j = 1:l
        %calculate the total gross of all movies released that year
        A(i,2) = A(i,2) + T.WorldwideGross(moviesPerBudget(j)) - T.ProductionBudget(moviesPerBudget(j));
    end;
    %calculate the average
    A(i,2) = A(i,2)/l;
end;

%[Y,I]=sort(A(1,:));
%B=A(:,I); %use the column indices from sort() to sort all columns of A.

bar(A(:,1), A(:,2));

