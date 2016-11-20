function [result] = FetchFromAPI( movieTable,n )

% Initialize variables
names = movieTable.Movie;
ryear = year(movieTable.ReleaseDate);
size = height(movieTable);
irating = zeros(size,1);
ivotes = zeros(size,1);
trating = zeros(size,1);
genre = cell(size,1);
rank = 1:1:size;        % Common variable for joining tables

for k=1:n
    
    % Construct URL for query
    url = 'http://www.omdbapi.com/?t=#{movie}&y=#{ryear}&plot=short&r=json&tomatoes=true'; 
    url = strrep(url,'#{movie}',names{k});
    url = strrep(url,'#{ryear}',num2str(ryear(k)));
    
    % Extract data from JSON
    try
    matlab_results = webread(url); 
    irating(k) = str2double(matlab_results.imdbRating);
    ivotes(k) = str2double(matlab_results.imdbVotes);
    trating(k) = str2double(matlab_results.tomatoRating);
    genre{k} = matlab_results.Genre;
    
    catch ME
       warning(strcat('Error occurred while trying to process : ',names{k})) ;
       genre{k}='';          
    end 
end

% Create table with variable retained from API
result = table(genre,irating,ivotes,trating,rank','VariableNames',{'Genre','imdbRating','imdbVotes','tomatoRating','Rank'});

end
