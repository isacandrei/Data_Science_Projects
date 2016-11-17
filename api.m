T = readtable('movievalue.csv','delimiter',';');
url = 'http://www.omdbapi.com/?t=Avatar&y=&plot=short&r=json'; 
matlab_results = parse_json(urlread(url)); 
disp(matlab_results{1}.Genre) 
