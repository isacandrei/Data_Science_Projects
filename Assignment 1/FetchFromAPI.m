function [result] = FetchFromAPI( movieTable,n )

names= movieTable.Movie;
size = height(movieTable);
rating=zeros(size,1);
votes=zeros(size,1);
genre = cell(size,1);
rank=1:1:size;
for k=1:n
%for k=1:50
    url = 'http://www.omdbapi.com/?t=#{movie}&y=&plot=short&r=json'; 
    url = strrep(url,'#{movie}',names{k});
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
result = table(genre,rating,votes,rank','VariableNames',{'Genre','Rating','Votes','Rank'});
end

