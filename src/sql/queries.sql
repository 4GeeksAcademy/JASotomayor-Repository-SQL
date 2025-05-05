-- queries.sql
-- Complete each mission by writing your SQL query below the instructions.
-- Don't forget to end each query with a semicolon ;


SELECT 
    regions.name,
    regions.country,
    COUNT(DISTINCT species.id) AS total_species
FROM observations
JOIN species ON observations.species_id = species.id
JOIN regions ON observations.region_id = regions.id
GROUP BY regions.name, regions.country
ORDER BY total_species DESC;

SELECT 
    STRFTIME('%m', observations.observation_date) AS month,
    COUNT(*) AS total_observations
FROM observations
GROUP BY month
ORDER BY total_observations DESC;

SELECT
    species.common_name,
    COUNT(*) AS total_individuals
FROM Observations
    JOIN species ON observations.species_id = species.id
GROUP BY species.id
HAVING COUNT(*) < 2
ORDER BY total_individuals ASC;

SELECT
    regions.name,
    COUNT (DISTINCT observations.species_id) AS total_species
FROM observations
JOIN regions ON observations.region_id = regions.id
GROUP BY regions.name
ORDER by total_species DESC
LIMIT 1;

SELECT
    species.common_name,
    COUNT(*) AS total_observations
    FROM observations
JOIN species ON observations.species_id = species.id
GROUP BY species.id
ORDER BY total_observations DESC
LIMIT 5;

SELECT 
    observations.observer,
    COUNT(*) AS total_observations
FROM observations
GROUP BY observations.observer
ORDER BY total_observations DESC
LIMIT 5;

SELECT
    species.common_name
FROM species
LEFT JOIN observations ON species.id = observations.species_id
WHERE observations.species_id IS NULL;

SELECT 
    observations.observation_date,
    COUNT(DISTINCT species_id) AS total_species
FROM observations
GROUP BY observations.observation_date
ORDER BY total_species DESC
LIMIT 5;

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;