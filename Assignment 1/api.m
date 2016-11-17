movieName = 'Avatar';

url = 'http://www.omdbapi.com/?t=#{movie}&y=&plot=short&r=json'; 
url = strrep(url,'#{movie}',movieName);

matlab_results = parse_json(urlread(url)); 
disp(matlab_results{1}.Genre)
disp(matlab_results{1}.imdbRating)
disp(matlab_results{1}.imdbVotes)