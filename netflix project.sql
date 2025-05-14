CREATE DATABASE Netflix;

use netflix;

SELECT * from netflix;

## Q1 find out the null values 
SELECT * from netflix
WHERE type IS NULL;
 
## Q2 determine the count of tv shows 
SELECT count(type) as count_of_tvshows 
from netflix
WHERE type = 'TV show';

## Q3 find out india based on director and total counts of director in india

SELECT director , country
from netflix 
WHERE country = 'India'
ORDER BY director , country ASC;

SELECT count(director) , country 
from netflix 
WHERE country = 'India'
GROUP BY country;

# Q4 find out count of total country as based on type

SELECT type,count(country)
FROM netflix
GROUP BY type;

## Q5 determine nil values from cast and crew
SELECT cast from 
netflix
WHERE cast = 'Nill';

## Q6 find out title based on starting letter m by using wildcard functions
SELECT title , director, country
from netflix
WHERE title LIKE 'M%' AND country like 'I%'
ORDER BY title, director, country ASC;


## Q7 determine the 1945 between 1970 year of release by common table expression  functions 
with old_records as
(
SELECT release_year as old_records  , title 
from netflix 
WHERE release_year BETWEEN 1945 and 1970
ORDER BY release_year ASC
)
;
## Q8 find out  documentaries based on listed_in by using view functions 
CREATE VIEW documentaries as 
SELECT listed_in , type , title
from netflix
WHERE listed_in = 'Documentaries'
ORDER BY listed_in ASC;

SELECT * from documentaries;

## conditional formatting by using case functions 
CREATE VIEW collections as 
SELECT release_year , title ,
CASE
	WHEN release_year BETWEEN 1920 and 1950 THEN 'old_collections'
    WHEN release_year BETWEEN 1951 and 2000 then 'mid_old_collections'
    ELSE 'recent_collections'
end as total_collections 
from netflix
ORDER BY release_year ASC;

## windows functions 
## rank functions 
SELECT release_year , title ,
RANK() OVER(PARTITION BY release_year ORDER BY title DESC ) as rank_num
from collections




