Actor = 'Zoe Saldana';
Avg_rating = 0;
Other_rating = 0;
C1 = 0;
C2 = 0;

% Find movies starring Actor
App = strfind(M.Actors, Actor);

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

Avg_rating = Avg_rating / C1;

% Find indices of the rest
i_rest = find(not(App));

% Compute Average Rating of the rest
for l=1:length(i_rest)
   
    % Skip value if value is NaN
    if isnan(M.imdbRating(i_rest(l)))      
    else
        Other_rating = Other_rating + M.imdbRating(i_rest(l));
    	C2 = C2 + 1;
    end
end

Other_rating = Other_rating / C2;