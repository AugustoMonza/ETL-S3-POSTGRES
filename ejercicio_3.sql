CREATE TABLE peliculas(
 duration TEXT,
 title TEXT)
 

INSERT INTO peliculas
SELECT SUBSTRING(fact_table.duration, 0, POSITION(' ' IN fact_table.duration)) AS duration, table_type_disney.title
FROM fact_table 
JOIN table_type_disney ON fact_table.show_id = table_type_disney.show_id
WHERE table_type_disney.type = 'Movie'

SELECT * FROM peliculas

INSERT INTO peliculas
SELECT SUBSTRING(fact_table.duration, 0, POSITION(' ' IN fact_table.duration)) AS duration, table_type_netflix.title
FROM fact_table 
JOIN table_type_netflix ON fact_table.show_id = table_type_netflix.show_id
WHERE table_type_netflix.type = 'Movie'

SELECT DISTINCT(title), duration FROM peliculas ORDER BY duration DESC LIMIT 5