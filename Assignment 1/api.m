movieName = 'Avatar';
ryear = '2009';

url = 'http://www.omdbapi.com/?t=#{movie}&y=#{ryear}&plot=short&r=json&tomatoes=true'; 
url = strrep(url,'#{movie}',movieName);
url = strrep(url,'#{ryear}',ryear);

matlab_results = parse_json(urlread(url)); 
disp(matlab_results{1}.Genre)
disp(matlab_results{1}.imdbRating)
disp(matlab_results{1}.imdbVotes)