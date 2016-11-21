Assignment 1: Hollywood Data Science (Group 16)
===============================================

**Andrei Isac (Sxxxxxxx) - David Pavlov (S3187330) - Win Leong Xuan (S3208435)**

**Introduction to Data Science**

**November 22, 2016**


1.1 Collect it...Link it!
-------------------------
For this assignment, we were provided with a CSV file of movies names. The data in the CSV file needs to be cleaned up for further data analysis. Additional information will also be queried from the internet in order to enrich the data collection. The variables provided by the CSV are Rank, Release Date, Movie name, Production Budget, Domestic Gross and Worldwide Gross. Afterwards, 4 additional variables will be appended to the data set which are Genre, imdb Rating, imdb Votes and tomato Rating. The programming language of our choice will be MatLab.

The CSV file will be imported to MatLab as a table where we will clean and collect additional data to append to this table. After importing the CSV file, we cleaned up the unecessary special characters and convert the variable to the corresponding data type. The additional data will be then queried from http://www.omdbapi.com where the data will be provided in a JSON format. By using the movie name and the release year, we are able to query the data for each movie individually. For the queries, we created a function in MatLab that will return a new table with the 4 additional variable which later will be joined to the movie table. Below, you can find the code that was used for cleaning and enriching data about the movies. 

[*Main Code*](Assign1.m)
~~~~
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
M.Movie = strrep(M.Movie, 'â€”', '-');
M.Movie = strrep(M.Movie, 'â€™', char(39));

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
plot(M.Rank(1:n),(M.WorldwideGross(1:n)));
~~~~

Here below, you can find the function used for data collection.

[*Function*](FetchFromAPI.m)
~~~~
function [result] = FetchFromAPI( movieTable,n )

% Initialize variables
names = movieTable.Movie;
ryear = year(movieTable.ReleaseDate);
size = height(movieTable);
irating = NaN(size,1);
ivotes = zeros(size,1);
trating = NaN(size,1);
genre = cell(size,1);
rank = 1:1:size;        % Common variable for joining tables
actors = cell(size,1);
options = weboptions('Timeout',10);

for k=1:n
    
    % Construct URL for query
    url = 'http://www.omdbapi.com/?t=#{movie}&y=#{ryear}&plot=short&r=json&tomatoes=true'; 
    url = strrep(url,'#{movie}',urlencode(names{k}));
    url = strrep(url,'#{ryear}',num2str(ryear(k)));
    
    % Extract data from JSON
    try
    matlab_results = webread(url,options); 
    irating(k) = str2double(matlab_results.imdbRating);
    ivotes(k) = str2double(matlab_results.imdbVotes);
    trating(k) = str2double(matlab_results.tomatoRating);
    genre{k} = matlab_results.Genre;
    actors{k} = matlab_results.Actors;
    catch ME
       warning(strcat('Error occurred while trying to process : ',names{k})) ;
       genre{k}=''; 
       actors{k}='';
    end 
end

% Create table with variable retained from API
result = table(genre,irating,ivotes,trating,rank',actors,'VariableNames',{'Genre','imdbRating','imdbVotes','tomatoRating','Rank','Actors'});

end
~~~~

1.2 Types
---------
By referring to our main code, the Release Date feature is converted to date/time data format where the year will be used to query the API for additional data. The Movie feature will be left as it is which is the string data type. The Production Budget, Domestic Gross and Worldwide Gross was cleaned up by removing the '$' sign and the values were converted to doubles where it can later be used for data analysis easier. The Genre will also be of string data type. Lastly, the imdb Rating, imdb Votes and tomato Rating will be also converted from strings to doubles for further data analysis. It is also good to mention, due to movie titles not matching accordingly to the titles on the omd API, we cannot query the correct information provided by the CSV file. Also, a few of the release years also do not match with omdb API. Therefore, sometimes no data or wrong data is obtained from the API.

1.3 Data Science Projects
-------------------------

1.4 Bonus
---------

