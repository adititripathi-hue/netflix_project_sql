-- Netflix Project
drop table netflix;
CREATE TABLE netflix
(
show_id varchar(6),
type varchar(10),
title varchar(150),
director varchar(210),
casts varchar(1000),
country varchar(150),
date_added varchar(50),
release_year  INT,
rating varchar(10),
duration varchar(50),
listed_in varchar(150),
description varchar(250)
); 
SELECT COUNT(*) AS total_content
From netflix;
-- distinct types
SELECT DISTINCT TYPE FROM netflix;


select * from netflix; 

--14 Business Problems

 -- 1. Count the number of Movies vs TV Shows
Select 
type,
count(*) as total_content
from netflix
Group by type

--2. Find the most common rating for movies and TV shows
select type, rating FROM(

Select 
type, 
rating,
COUNT(*),
RANK() OVER(PARTITION BY type ORDER BY COUNT(*) DESC) as ranking
from netflix
group by 1, 2
) as t1
where 
ranking = 1;

--3. List all movies released in a specific year (e.g., 2020)
select * from netflix
where type = 'Movie'
AND
release_year = 2020

--4. Find the top 5 countries with the most content on Netflix
select UNNEST(STRING_TO_ARRAY(country, ',')) as new_country,
COUNT(show_id) as total_content
from netflix
Group by 1 ORDER BY 2 DESC LIMIT 5;

Select 
UNNEST(STRING_TO_ARRAY(country, ',')) as new_country
from netflix

--5. Identify the longest movie
SELECT * FROM netflix
WHERE
type = 'Movie'
AND
duration = (SELECT MAX(duration) From netflix)

--6. Find content added in the last 5 years
SELECT *
FROM netflix 
WHERE
TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years'

--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
SELECT * FROM netflix
WHERE director ILike '%Rajiv Chilaka%'

--8. List all TV shows with more than 5 seasons
SELECT *
FROM netflix
WHERE
type = 'TV Show'
AND
SPLIT_PART(duration, ' ', 1):: numeric > 5 

--9. Count the number of content items in each genre
SELECT
Unnest(STRING_TO_ARRAY(listed_in, ',')) as genre,
COUNT (show_id) as total_content
From netflix
Group by 1

--10.Find each year and the average numbers of content release in India on netflix, return top 5 year with highest avg content release!

SELECT 
EXTRACT(YEAR FROM TO_DATE(date_added, 'Month DD, YYYY')) as year,
COUNT(*),
COUNT(*):: numeric /(SELECT COUNT(*) FROM netflix WHERE country = 'India')::numeric * 100 as average
FROM netflix
where country = 'India'
Group by 1

--11. List all movies that are documentaries
SELECT * FROM netflix
WHERE 
listed_in ILIKE '%Documentaries%'

--12. Find all content without a director
SELECT * FROM netflix
WHERE 
director IS NULL

--13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
SELECT * FROM netflix
WHERE
casts ILIKE '%Salman Khan%'
AND 
release_year > EXTRACT(YEAR FROM CURRENT_DATE) - 10

--14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
  SELECT 
  UNNEST(STRING_TO_ARRAY(casts, ',')) as actors,
  COUNT(*) as total_content
  from netflix
  where country ILIKE '%India%'
  group by 1
  order by 2 Desc Limit 10

--15.Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
--the description field. Label content containing these keywords as 'Bad' and all other 
--content as 'Good'. Count how many items fall into each category.
With new_table
as (
SELECT *, 
CASE
WHEN
description ILIKE'%kill%' OR
description ILIKE '%violence' THEN 'Bad'
  ELSE 'Good'
  End category
  FROM netflix
) 
SELECT
category,
COUNT(*) as total_content From new_table
Group by 1