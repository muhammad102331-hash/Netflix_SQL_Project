🎬 Netflix Titles Data Analysis — SQL Project

This project explores Netflix content using PostgreSQL queries.
The dataset includes metadata such as title, type, actors, release year, duration, rating, and genre.

📌 About the Dataset
Feature	Description
Rows	~ 8,000+ Titles
Source	Netflix Catalog Dataset (cleaned version)
Format	CSV
Imported Into	PostgreSQL
🗂️ Table Schema
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

📥 Importing the Dataset into PostgreSQL
\copy netflix_titles 
FROM 'netflix_titles_analysis.csv' 
WITH (
    FORMAT csv,
    HEADER,
    DELIMITER ','
);

📊 Key SQL Analysis Queries

Some example insights from the project:

Query #	Description
01	Count total Netflix titles
02	Compare Movies vs TV Shows
05	Top 10 most frequent actors
08	Top directors
11	Movies longer than 100 minutes
15	Titles grouped by decade

Full query file is available here:
📄 sql/netflix_analysis_queries.sql

🔍 Sample Output Insights

📌 Most content on Netflix is Movies

🎭 Drama, Comedy, and International Content dominate Netflix genres

⭐ Some actors appear over 30+ times

📈 Future Enhancements

Power BI / Tableau Dashboard

Trend forecasting (time series)

Recommendation system using ML

🧑‍💻 Author

Muhammad Zahid Bhutto
🔗 GitHub: @muhammad102331-hash