# Netflix SQL Data Anlysis

Overview
This project explores and analyzes a Netflix dataset using SQL. The goal is to solve real-world business questions related to Netflix content, 
including movies, TV shows, ratings, genres, countries, directors, actors, and content trends.

The project demonstrates SQL skills such as:
• Data filtering
• Aggregations
• Window functions
• Common Table Expressions (CTEs)
• String manipulation
• Date handling
• Ranking functions
• Data analysis and reporting

# Dataset Structure

The dataset contains the following fields:
Dataset Structure

The dataset contains the following fields:

• Column              
• show_id                                     	
• type	                         
• title	                         
• director          
• casts	   
• country                         
• date_added       
• release_year	                  
• rating	                         
• duration	                   
• listed_in           
• description	                 

# Business Problems Solved

1. Count Movies vs TV Shows:
Find the total number of Movies and TV Shows available on Netflix.

2. Most Common Rating:
Determine the most frequently used rating for Movies and TV Shows.

3. Movies Released in 2020:
Retrieve all movies released in the year 2020.

4. Top 5 Countries by Content:
Identify the countries producing the highest amount of Netflix content.

5. Longest Movie:
Find the movie with the maximum duration.

6. Content Added in the Last 5 Years:
Analyze recently added Netflix content.

7. Content by 'Rajiv Chilaka':
Find all Movies and TV Shows directed by Rajiv Chilaka.

8. TV Shows with More Than 5 Seasons:
Identify long-running TV series.

9. Content Count by Genre:
Calculate the number of content items in each genre.

10. Netflix India Content Analysis:
Find years with the highest percentage of content releases from India.

11. Documentary Movies:
Retrieve all documentary content available on Netflix.

12. Content Without a Director:
Identify records where director information is missing.

13. Salman Khan Content Analysis:
Find content featuring Salman Khan released in the last 10 years.

14. Top Actors in Indian Productions:
Identify actors appearing most frequently in Indian Netflix productions.

15. Content Classification (Good vs Bad):
Categorize content based on keywords such as:
Dataset Structure

The dataset contains the following fields:
• kill
• violence
• count items in each category.


# SQL Concepts Used
GROUP BY
ORDER BY
COUNT()
MAX()
RANK() OVER()
CASE 
WHEN
STRING_TO_ARRAY()
UNNEST()
SPLIT_PART()
ILIKE
TO_DATE()
EXTRACT()
Subqueries
Window Functions

# Technologies Used
PostgreSQL
