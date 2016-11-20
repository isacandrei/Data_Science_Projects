function [result] = FetchFromAPI( movieTable,n )

% Initialize variables
names = movieTable.Movie;
ryear = year(movieTable.ReleaseDate);
size = height(movieTable);
rating = zeros(size,1);
votes = zeros(size,1);
genre = cell(size,1);
rank = 1:1:size;        % Common variable for joining tables

for k=1:n
    
    % Construct URL for query
    url = 'http://www.omdbapi.com/?t=#{movie}&y=#{ryear}&plot=short&r=json'; 
    url = strrep(url,'#{movie}',names{k});
    url = strrep(url,'#{ryear}',num2str(ryear(k)));
    
    % Extract data from JSON
    try
    matlab_results = webread(url); 
    rating(k) = str2double(matlab_results.imdbRating);
    votes(k) = str2double(matlab_results.imdbVotes);
    genre{k} = matlab_results.Genre;
    
    catch ME
       warning(strcat('Error occurred while trying to process : ',names{k})) ;
       genre{k}='';          
    end 
end

% Create table with variable retained from API
result = table(genre,rating,votes,rank','VariableNames',{'Genre','Rating','Votes','Rank'});

end

