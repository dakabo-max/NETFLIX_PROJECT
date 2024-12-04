SELECT * FROM netflix;

-- 15 Business Problems & Solutions

-- 1 Count the number of Movies vs TV Shows
SELECT 
   TYPE,
   COUNT("type")
FROM netflix
GROUP BY "type";

-- 2. Find the most common rating for movies and TV shows.
SELECT 
   type, 
   rating
FROM (SELECT 
        type, 
        rating,
        count(*) AS CONT,
        RANK() OVER (PARTITION BY "type" ORDER BY count(*) DESC) AS RANKING
     FROM netflix
     GROUP BY "type", rating)
WHERE RANKING = 1;




-- 3. List all movies released in a specific year (e.g., 2020)
SELECT * FROM netflix;

SELECT 
   "type", 
   title,
   release_year
FROM netflix
WHERE release_year = 2020
AND "type" = 'Movie';

-- 4. Find the top 5 countries with the most content on Netflix
SELECT * FROM netflix;
SELECT 
   UNNEST(STRING_TO_ARRAY(country, ',')) as country, 
   COUNT(show_id) AS content_num
FROM netflix
GROUP BY country
ORDER BY content_num DESC
LIMIT 5;


-- 5. Identify the longest movie
SELECT 
   * 
FROM netflix
WHERE "type" = 'Movie'
AND DURATION = (SELECT MAX(duration) FROM netflix);



-- 6. Find content added in the last 5 years
SELECT * FROM netflix;
SELECT 
    *
FROM netflix
WHERE TO_DATE(date_added, 'Month DD, YYYY') >= CURRENT_DATE - INTERVAL '5 years';


7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
8. List all TV shows with more than 5 seasons 
9. Count the number of content items in each genre
10.Find each year and the average numbers of content release in India on netflix. 
return top 5 year with highest avg content release!
11. List all movies that are documentaries
12. Find all content without a director
13. Find how many movies actor 'Salman Khan' appeared in last 10 years!
14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
15.
Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
the description field. Label content containing these keywords as 'Bad' and all other 
content as 'Good'. Count how many items fall into each category.