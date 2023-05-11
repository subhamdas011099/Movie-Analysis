create database movie;
use movie;
select* from movie.movie;

-- Distribution of movies across different genres

SELECT
  CASE
    WHEN genres LIKE '%Action%' THEN 'Action'
    WHEN genres LIKE '%Adventure%' THEN 'Adventure'
    WHEN genres LIKE '%Comedy%' THEN 'Comedy'
    WHEN genres LIKE '%Crime%' THEN 'Crime'
    WHEN genres LIKE '%Drama%' THEN 'Drama'
    WHEN genres LIKE '%Fantasy%' THEN 'Fantasy'
    WHEN genres LIKE '%Horror%' THEN 'Horror'
    WHEN genres LIKE '%Mystery%' THEN 'Mystery'
    WHEN genres LIKE '%Romance%' THEN 'Romance'
    WHEN genres LIKE '%Sci-Fi%' THEN 'Science Fiction'
    WHEN genres LIKE '%Thriller%' THEN 'Thriller'
    ELSE 'Other'
  END AS genre_name,
  COUNT(*) AS num_movies, ROUND(avg(gross),2) as `Average gross`
FROM movie
GROUP BY genre_name;

-- Movie genres with their average ratings

SELECT
  CASE
    WHEN genres LIKE '%Action%' THEN 'Action'
    WHEN genres LIKE '%Adventure%' THEN 'Adventure'
    WHEN genres LIKE '%Comedy%' THEN 'Comedy'
    WHEN genres LIKE '%Crime%' THEN 'Crime'
    WHEN genres LIKE '%Drama%' THEN 'Drama'
    WHEN genres LIKE '%Fantasy%' THEN 'Fantasy'
    WHEN genres LIKE '%Horror%' THEN 'Horror'
    WHEN genres LIKE '%Mystery%' THEN 'Mystery'
    WHEN genres LIKE '%Romance%' THEN 'Romance'
    WHEN genres LIKE '%Sci-Fi%' THEN 'Science Fiction'
    WHEN genres LIKE '%Thriller%' THEN 'Thriller'
    ELSE 'Other'
  END AS genre_name,
  round(avg(imdb_score),2) AS avg_rating
FROM movie
GROUP BY genre_name
order by avg_rating desc;

-- Apperance of actors in the movies 

SELECT actor_1_name, COUNT(*) as apperance 
FROM movie
GROUP BY actor_1_name
ORDER BY apperance desc;

-- Directors and their direction 

SELECT director_name, COUNT(*) as num_direction 
FROM movie
GROUP BY director_name
ORDER BY num_direction desc;

-- Directors with highest imdb_rating

SELECT director_name, round(avg(imdb_score),2) as avg_rating
 FROM movie
 GROUP BY director_name
 ORDER BY avg_rating desc
 limit 10;

--  Movies with highest profit

SELECT movie_title ,(gross-budget) as profit , budget
   FROM movie 
   ORDER BY profit desc;
   
   -- Top 250 movie 
   
  SELECT movie_title as imdb_top_250, imdb_score , num_voted_users, `language`
    FROM movie
   WHERE num_voted_users > 25000
   ORDER BY imdb_score desc 
   LIMIT 250;
   
   -- TOP 5 movies according to social media
   
   SELECT movie_title, director_name as `Director`, actor_1_name as ` Lead actor`, movie_facebook_likes as `social media likes`, imdb_score
   FROM movie
   ORDER BY  `social media likes`desc 
   LIMIT 5;
   
   -- Actors with highest grossing movies 
   
   SELECT actor_1_name, COUNT(*) as apperance, ROUND(avg(gross),2) as avg_grossing
FROM movie
GROUP BY actor_1_name
HAVING COUNT(*) > 5
ORDER BY avg_grossing desc;

-- Movie language that has produced highest rated movies 

SELECT language, COUNT(*) as num_movies,ROUND(avg(imdb_score),2) as avg_rating
FROM movie 
GROUP BY language 
ORDER BY avg_rating desc;


SELECT language, COUNT(*) as num_movies,ROUND(avg(imdb_score),2) as avg_rating
FROM movie 
GROUP BY language 
HAVING COUNT(*) > 10
ORDER BY avg_rating desc;
   



