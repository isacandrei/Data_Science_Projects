function [matrix] = FetchFromAPI( movieTable )

names= movieTable.Movie;
matrix=zeros(height(movieTable),6);
for k=1:size(names,1)
    url = 'http://www.omdbapi.com/?t=#{movie}&y=&plot=short&r=json'; 
    url = strrep(url,'#{movie}',names{k});
    matlab_results = parse_json(urlread(url)); 
    matrix(k,1) = matlab_results{1}.imdbRating;
    matrix(k,2) = matlab_results{1}.imdbVotes;

    Genre = strsplit(matlab_results{1}.Genre,',');

    for i=1:min([size(Genre,2) 4])
        matrix(k,i+2)=Genre(i);
    end

end

end

