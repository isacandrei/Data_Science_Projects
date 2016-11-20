Assignment 1: Hollywood Data Science (Group 16)
===============================================

**Andrei Isac (Sxxxxxxx) - David Pavlov (Sxxxxxxx) - Win Leong Xuan (S3208435)**

1.1 Collect it...Link it!
-------------------------
For this assignment, we were provided with a CSV file of movies names. The data in the CSV file needs to be cleaned up for further data analysis. Additional information will also be queried from the internet in order to enrich the data collection. The variables provided by the CSV are Rank, Release Date, Movie name, Production Budget, Domestic Gross and Worldwide Gross. Afterwards, 3 additional variables will be appended to the data set which are Genre, imdb Rating and imdb Votes. The programming language of our choice will be MatLab.

The CSV file will be imported to MatLab as a table where we will clean and collect additional data to append to this table. After importing the CSV file, we cleaned up the unecessary special characters and convert the variable to the corresponding data type. The additional data will be then queried from http://www.omdapi.com where to data will be provided in a JSON format. By using the movie name and the release year, we are able to query the data for each movie individually.
