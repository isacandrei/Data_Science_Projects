% Generate Actor List
y = [];

for i=1:height(M)
    z = strsplit(char(M.Actors{i}), ', ');
    y = [y, z];
end;

y = unique(y);
y = transpose(y);

% Initiliaze array to store average ratings
list_avg = zeros(length(y),1);
list_all = ones(length(y),1);
All_avg = 0;

% Calculate Ratings for each Actor
for q = 1:length(y)
    
    Avg_rating = 0;
    C1 = 0;
    C2 = 0;
    
    % Find movies starring Actor
    App = strfind(M.Actors, y(q));

    % Convert cell to logical array
    App = ~cellfun(@isempty,App);

    % Find indices of movies starring Actor
    i = find(App);

    % Compute Average Rating starring Actor
    for k=1:length(i)

        % Skip value if value is NaN
        if isnan(M.imdbRating(i(k)))      
        else
            Avg_rating = Avg_rating + M.imdbRating(i(k));
            C1 = C1 + 1;
       end
    end

    list_avg(q) = Avg_rating / C1;
    
    % Filter out NaN values
    if isnan(list_avg(q))
        list_avg(q) = 0;
    end
end

% Compute Average of whole list
    for l=1:height(M)

        % Skip value if value is NaN
        if isnan(M.imdbRating(l))      
        else
            All_avg = All_avg + M.imdbRating((l));
            C2 = C2 + 1;
        end
    end

% List average rating next to Actor rating
All_avg = All_avg / C2;  
list_all = All_avg * list_all;

% Create table with Ratings
Rating_Table = table(y, list_avg, list_all, 'VariableNames',{'Actors','Starring','Average'});

Rating_Table = sortrows(Rating_Table,-2);