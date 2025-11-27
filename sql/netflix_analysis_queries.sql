CREATE TABLE netflix_titles (
    show_id VARCHAR(20) PRIMARY KEY,
    type VARCHAR(20),
    title TEXT,
    director TEXT,
    actors TEXT,
    country TEXT,
    date_added DATE,
    release_year INT,
    rating VARCHAR(20),
    duration VARCHAR(20),
    listed_in TEXT,
    description TEXT
);

select * from netflix_titles;


--1️⃣ Total Number of Titles
SELECT COUNT(*) AS total_titles FROM netflix_titles;

--2️⃣ Movies vs TV Shows
select type, count(*) as total
from netflix_titles
group by type;

--3️⃣ Top 10 Countries with the Most Netflix Content
select country, count(*) as total
from netflix_titles
where country is not null and country <> ''
group by country
order by total desc
limit 10;

--4️⃣ Number of Titles by Release Year
select release_year, count(*) as total
from netflix_titles
group by release_year
order by total desc;

--5️⃣ Top 10 Most Frequent Actors
select trim(unnest(string_to_array(actors, ','))) as actors, count(*) as appearence
from netflix_titles
where actors is not null and actors <> ''
group by actors
order by appearence desc
limit 10;

--6️⃣ Most Popular Content Rating
select rating, count(*) as total
from netflix_titles
group by rating
order by total desc
limit 10;

--7️⃣ Find Titles That Mention a Keyword (Example: "Crime")
select title, type, release_year
from netflix_titles
where description ilike '%crime%';

--8️⃣ Top 10 Directors by Content Count
select director, count(*) as total
from netflix_titles
where director is not null and director <> ''
group by director
order by total desc
limit 10;

--9️⃣ Content Released in the Last 5 Years
select title, release_year, type
from netflix_titles
where release_year >= extract(year from current_date) - 5
order by release_year desc;

--🔟 Top 10 Most Common Genres
select trim(unnest(string_to_array(listed_in, ','))) as genre, count(*) as total
from netflix_titles
group by genre
order by total desc
limit 10;

--1️⃣1️⃣ Movies Longer Than 100 Minutes
select * from netflix_titles
where duration like '%min%'
and cast(split_part(duration, ' ', 1)as int) > 100;

--1️⃣2️⃣ TV Shows with More Than 2 Seasons
SELECT *
FROM netflix_titles
WHERE duration LIKE '%Season%'
AND CAST(split_part(duration, ' ', 1) AS INT) > 2;

--1️⃣3️⃣ Most Recently Added 20 Titles
select title, type, date_added
from netflix_titles
order by date_added desc
limit 20;

--1️⃣4️⃣ Kids-Friendly Content Count
SELECT COUNT(*) AS kids_safe_content
FROM netflix_titles
WHERE rating IN ('G', 'PG', 'PG-13', 'TV-Y', 'TV-G', 'TV-Y7');

--1️⃣5️⃣ Titles Grouped by Decade
SELECT (release_year/10)*10 AS decade, COUNT(*) AS total
FROM netflix_titles
GROUP BY decade
ORDER BY decade DESC;



