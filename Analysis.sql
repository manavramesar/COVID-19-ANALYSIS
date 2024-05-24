-- Global Data

-- Total Cases VS Total Deaths

SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
GROUP BY 1
ORDER BY 1;

-- Infection rate (Top 50 countries)

SELECT location, ROUND(MAX(total_cases / population) * 100, 2) AS infection_rate
FROM  covid_deaths
WHERE continent IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 50;

-- Daily total cases, total deaths and death percentage

SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent IS NOT NULL
GROUP BY 1
ORDER BY 1,2;

-- total population vs vaccinations
WITH A as(
SELECT location, MAX(population) AS total_population
    FROM covid_deaths 
    GROUP BY location),
b AS (
    SELECT location, MAX(new_vaccinations) AS total_vaccinations
    FROM covid_vaccinations 
    GROUP BY location)
SELECT 
    a.location, a.total_population AS total_population, b.total_vaccinations AS total_vaccinations
FROM a
JOIN b ON a.location = b.location
WHERE a.total_population IS NOT NULL 
AND b.total_vaccinations IS NOT NULL;

-- Continental Data --

-- North America Data 

-- Total cases vs total deaths --

SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "North America"
GROUP BY 1
ORDER BY 1;

-- Infection rate per country in NA

SELECT location, CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") AS infection_rate,  DENSE_RANK () OVER(ORDER BY CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") DESC)
FROM  covid_deaths
WHERE continent IS NOT NULL 
AND continent = "North America"
GROUP BY 1;

-- Max deaths per country

SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "North America"
GROUP BY 1
ORDER BY 2 DESC;


-- Daily total cases, total deaths and death percentage in NA

SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "North America"
GROUP BY 1
ORDER BY 1,2;

-- total population vs vaccinations

WITH a AS (
    SELECT location, continent, MAX(population) AS total_population
	FROM covid_deaths 
	GROUP BY 1,2),
b AS (
    SELECT location, MAX(new_vaccinations) AS total_vaccinations
    FROM covid_vaccinations 
    GROUP BY location)
SELECT a.location, a.total_population, b.total_vaccinations
FROM a
JOIN b ON a.location = b.location
WHERE a.total_population 
AND b.total_vaccinations IS NOT NULL
AND continent = "North America";

-- Total daily cases --

SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "North America"
GROUP BY 1
ORDER BY 1;

----------------------------------------------------------------------------------------------------------------------------------------------------------

-- South America Data 

-- Total cases vs total deaths --

SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "South America"
GROUP BY 1
ORDER BY 1;

-- Infection rate per country in SA

SELECT location, CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") AS infection_rate,  DENSE_RANK () OVER(ORDER BY CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") DESC)
FROM  covid_deaths
WHERE continent IS NOT NULL 
AND continent = "South America"
GROUP BY 1;

-- Max deaths per country

SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "South America"
GROUP BY 1
ORDER BY 2 DESC;

-- Daily total cases, total deaths and death percentage in SA

SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "South America"
GROUP BY 1
ORDER BY 1,2;

-- total population vs vaccinations

WITH a AS (
    SELECT location, continent, MAX(population) AS total_population
	FROM covid_deaths 
	GROUP BY 1,2),
b AS (
    SELECT location, MAX(new_vaccinations) AS total_vaccinations
    FROM covid_vaccinations 
    GROUP BY location)
SELECT a.location, a.total_population, b.total_vaccinations
FROM a
JOIN b ON a.location = b.location
WHERE a.total_population 
AND b.total_vaccinations IS NOT NULL
AND continent = "South America";

-- Total daily cases --

SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "South America"
GROUP BY 1
ORDER BY 1;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Asia Data 

-- Total cases vs total deaths --

SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "Asia"
GROUP BY 1
ORDER BY 1;

-- Infection rate per country in Asia

SELECT location, CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") AS infection_rate,  DENSE_RANK () OVER(ORDER BY CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") DESC)
FROM  covid_deaths
WHERE continent IS NOT NULL 
AND continent = "Asia"
GROUP BY 1;

-- Max deaths per country

SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "Asia"
GROUP BY 1
ORDER BY 2 DESC;


-- Daily total cases, total deaths and death percentage in NA

SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "Asia"
GROUP BY 1
ORDER BY 1,2;

-- total population vs vaccinations

WITH a AS (
    SELECT location, continent, MAX(population) AS total_population
	FROM covid_deaths 
	GROUP BY 1,2),
b AS (
    SELECT location, MAX(new_vaccinations) AS total_vaccinations
    FROM covid_vaccinations 
    GROUP BY location)
SELECT a.location, a.total_population, b.total_vaccinations
FROM a
JOIN b ON a.location = b.location
WHERE a.total_population 
AND b.total_vaccinations IS NOT NULL
AND continent = "Asia";

-- Total daily cases --

SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "Asia"
GROUP BY 1
ORDER BY 1;

------------------------------------------------------------------------------------------------------------------------------------------------

-- Europe Data 

-- Total cases vs total deaths --

SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "Europe"
GROUP BY 1
ORDER BY 1;

-- Infection rate per country in Europe

SELECT location, CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") AS infection_rate,  DENSE_RANK () OVER(ORDER BY CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") DESC)
FROM  covid_deaths
WHERE continent IS NOT NULL 
AND continent = "Europe"
GROUP BY 1;

-- Max deaths per country

SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "Europe"
GROUP BY 1
ORDER BY 2 DESC;


-- Daily total cases, total deaths and death percentage in Europe

SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "Europe"
GROUP BY 1
ORDER BY 1,2;

-- total population vs vaccinations

WITH a AS (
    SELECT location, continent, MAX(population) AS total_population
	FROM covid_deaths 
	GROUP BY 1,2),
b AS (
    SELECT location, MAX(new_vaccinations) AS total_vaccinations
    FROM covid_vaccinations 
    GROUP BY location)
SELECT a.location, a.total_population, b.total_vaccinations
FROM a
JOIN b ON a.location = b.location
WHERE a.total_population 
AND b.total_vaccinations IS NOT NULL
AND continent = "Europe";

-- Total daily cases --

SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "Europe"
GROUP BY 1
ORDER BY 1;

------------------------------------------------------------------------------------------------------------------------------------------------------

-- Africa Data 

-- Total cases vs total deaths --

SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "Africa"
GROUP BY 1
ORDER BY 1;

-- Infection rate per country in Africa

SELECT location, CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") AS infection_rate,  DENSE_RANK () OVER(ORDER BY CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") DESC)
FROM  covid_deaths
WHERE continent IS NOT NULL 
AND continent = "Africa"
GROUP BY 1;

-- Max deaths per country

SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "Africa"
GROUP BY 1
ORDER BY 2 DESC;


-- Daily total cases, total deaths and death percentage in Africa

SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "Africa"
GROUP BY 1
ORDER BY 1,2;

-- total population vs vaccinations

WITH a AS (
    SELECT location, continent, MAX(population) AS total_population
	FROM covid_deaths 
	GROUP BY 1,2),
b AS (
    SELECT location, MAX(new_vaccinations) AS total_vaccinations
    FROM covid_vaccinations 
    GROUP BY location)
SELECT a.location, a.total_population, b.total_vaccinations
FROM a
JOIN b ON a.location = b.location
WHERE a.total_population 
AND b.total_vaccinations IS NOT NULL
AND continent = "Africa";

-- Total daily cases --

SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "Africa"
GROUP BY 1
ORDER BY 1;

--------------------------------------------------------------------------------------------------------------------------------

-- Oceania Data 

-- Total cases vs total deaths --

SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "Oceania"
GROUP BY 1
ORDER BY 1;

-- Infection rate per country in Oceania

SELECT location, CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") AS infection_rate,  DENSE_RANK () OVER(ORDER BY CONCAT(ROUND(MAX((total_cases/population))*100,2), "%") DESC)
FROM  covid_deaths
WHERE continent IS NOT NULL 
AND continent = "Oceania"
GROUP BY 1;

-- Max deaths per country

SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "Oceania"
GROUP BY 1
ORDER BY 2 DESC;


-- Daily total cases, total deaths and death percentage in Oceania

SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "Oceania"
GROUP BY 1
ORDER BY 1,2;

-- total population vs vaccinations

WITH a AS (
    SELECT location, continent, MAX(population) AS total_population
	FROM covid_deaths 
	GROUP BY 1,2),
b AS (
    SELECT location, MAX(new_vaccinations) AS total_vaccinations
    FROM covid_vaccinations 
    GROUP BY location)
SELECT a.location, a.total_population, b.total_vaccinations
FROM a
JOIN b ON a.location = b.location
WHERE a.total_population 
AND b.total_vaccinations IS NOT NULL
AND continent = "Oceania";

-- Total daily cases --

SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "Oceania"
GROUP BY 1
ORDER BY 1;



