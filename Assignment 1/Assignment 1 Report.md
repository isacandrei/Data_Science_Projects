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

Here below, you can find the function used for data collection.

[*Function*](FetchFromAPI.m)

1.2 Types
---------
By referring to our main code, the Release Date feature is converted to date/time data format where the year will be used to query the API for additional data. The Movie feature will be left as it is which is the string data type. The Production Budget, Domestic Gross and Worldwide Gross was cleaned up by removing the '$' sign and the values were converted to doubles where it can later be used for data analysis easier. The Genre will also be of string data type. Lastly, the imdb Rating, imdb Votes and tomato Rating will be also converted from strings to doubles for further data analysis. It is also good to mention, due to movie titles not matching accordingly to the titles on the omd API, we cannot query the correct information provided by the CSV file. Also, a few of the release years also do not match with omdb API. Therefore, sometimes no data or wrong data is obtained from the API.

1.3 Data Science Projects
-------------------------

1.4 Bonus
---------

