CREATE TABLE actores_netflix(
 actores_netflix TEXT)
SELECT * FROM actores_netflix

INSERT INTO actores_netflix
SELECT unnest(string_to_array(table_type_netflix.cast, ','))as actores_netflix FROM table_type_netflix

SELECT actores_netflix, COUNT(actores_netflix) as contador FROM actores_netflix GROUP BY actores_netflix ORDER BY contador desc