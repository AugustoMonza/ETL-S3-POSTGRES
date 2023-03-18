--Top 10 de actores considerando ambas plataformas. Se optó por buscar entre 2020 hasta la actualidad con respecto a la columna 
CREATE TABLE actores(
 actor TEXT)
SELECT * FROM actores

INSERT INTO actores
SELECT table_type_disney.cast
	   FROM  fact_table 
JOIN table_type_disney ON fact_table.show_id = table_type_disney.show_id 
WHERE fact_table.release_year BETWEEN '2020' AND '2023' 

SELECT * FROM actores


INSERT INTO actores
SELECT table_type_netflix.cast
	   FROM  fact_table 
JOIN table_type_netflix ON fact_table.show_id = table_type_netflix.show_id
WHERE fact_table.release_year BETWEEN '2020' AND '2023' 

SELECT * FROM actores


CREATE TABLE top_ten_actors(
	actor TEXT)
 
SELECT * FROM top_ten_actors


INSERT INTO top_ten_actors
SELECT unnest(string_to_array(actores.actor, ','))as actor FROM actores

SELECT * FROM top_ten_actors

SELECT actor, 
	   COUNT(actor) AS contador FROM top_ten_actors GROUP BY actor ORDER BY contador DESC
LIMIT 10
