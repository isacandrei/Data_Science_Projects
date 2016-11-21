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
By referring to our main code, the Release Date feature is converted to date/time data format where the year will be used to query the API for additional data. The Movie feature will be left as it is which is the string data type. The Production Budget, Domestic Gross and Worldwide Gross was cleaned up by removing the '$' sign and the values were converted to doubles where it can later be used for data analysis easier. The Genre will also be of string data type. The imdb Rating, imdb Votes and tomato Rating will be also converted from strings to doubles for further data analysis. Lastly, the Actors and Country are strings. It is also good to mention, due to movie titles not matching accordingly to the titles on the omd API, we cannot query the correct information provided by the CSV file. Also, a few of the release years also do not match with omdb API. Therefore, sometimes no data or wrong data is obtained from the API.

| Features | Data Type|
|----------|----------|
| Release Date | Date |
| Movie | String |
| Production Budget | Double |
| Domestic Gross | Double |
| Worldwide Gross | Double |
| Genre | String |
| imdb Rating | Double |
| imdb Votes | Double |
| Actors | String |
| Country | String |

1.3 Data Science Projects
-------------------------
  a)
  Average gross per year for 1200 movies
    ![] (images/avgGrossPerYear.jpg) 
  Movies released per year
    ![] (images/moviesPerYear.jpg)
    
   b)
   Movie rank vs worldwide gross
    ![] (images/RankGross.jpg)

1.4 Bonus
---------
a)

|Country|Id|
|-----------|:-----------:|
    |Argentina|1|
    |Australia|2|
    |Bahamas|3|
    |Belgium|4|
    |Brazil|5|
    |Bulgaria|6|
    |Canada|7|
    |China|8|
    |Czech Republic|9|
    |Denmark|10|
    |Finland|11|
    |France|12|
    |Germany|13|
    |Hong Kong|14|
    |Hungary|15|
    |Iceland|16|
    |India|17|
    |Ireland|18|
    |Italy|19|
    |Japan|20|
    |Malta|21|
    |Morocco|22|
    |Netherlands|23|
    |New Zealand|24|
    |Norway|25|
    |Paraguay|26|
    |Peru|27|
    |Poland|28|
    |Portugal|29|
    |Romania|30|
    |Russia|31|
    |Singapore|32|
    |Slovakia|33|
    |Slovenia|34|
    |South Africa|35|
    |Spain|36|
    |Sweden|37|
    |Switzerland|38|
    |Taiwan|39|
    |Tunisia|40|
    |UK|41|
    |USA|42|
    |United Arab Emirates|43|
    |Uruguay|44|

b)

It seems like if one of the following actors starring in a movie, will most likely lead to higher ratings. The code used for this exercise is the following. The average rating is calculated of all of the movies that was given within the CSV list and the starring average rating is calculated from all the movies that the actor was starring in.

[Actor Rating](Rating_Actor.m)

| Actors | Starring Average Rating | Average Rating|
|----------|:----------:|:-----------:|
| 'Bernd Eichinger' | 9.2 | 6.4 |
| 'Donald Arthur' | 9.2 | 6.4 |
| 'Michael Ende'| 9.2 | 6.4 |
| 'Richard S. Castellano' | 9.2 | 6.4 |
| 'Robert Easton' | 9.2 | 6.4 |
| 'Ali Astin' | 8.9 | 6.4 |
| 'David Aston' | 8.9 | 6.4 |
| 'E.G. Marshall' | 8.9 | 6.4 |
| 'Laura Lovelace' | 8.9 | 6.4 |
| 'Noel Appleby' | 8.85 | 6.4 |

1.5 Running instructions
---------
In order to run the code open [Assign1.m](Assign1.m) and set value for *n*, where *n* is the number of movies for which the evaluation should be performed. Once the value is execute the file.

In the bonus section, for the [Rating_Actor.m](Rating_Actor.m) code, the table M needs to be imported which is generated by the code [Assign1.m](Assign1.m).
