-- Views ------------------------------------------------------- 

-- Global --  
    
-- Total Cases VS Total Deaths
CREATE VIEW total_cases_total_deaths AS(
SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
GROUP BY 1
ORDER BY 1);

-- Infection rate (Top 50 countries)
CREATE VIEW infection_rate AS(
SELECT location, CAST(ROUND(MAX(total_cases / population) * 100, 2) AS double) AS infection_rate
FROM  covid_deaths
WHERE continent IS NOT NULL
GROUP BY 1
ORDER BY 2 DESC
LIMIT 50);

-- Daily total cases, total deaths and death percentage
CREATE VIEW tc_td_dp AS(
SELECT date, SUM(new_cases) AS total_cases, SUM(CAST(new_deaths as double)) AS total_deaths, SUM(CAST(new_deaths AS double))/SUM(CAST(new_cases AS double))*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent IS NOT NULL
GROUP BY 1
ORDER BY 1,2);

-- total population vs vaccinations
CREATE VIEW tp_vs_vex AS(
WITH A as(
SELECT location, MAX(population) AS total_population
    FROM covid_deaths 
    GROUP BY location),
b AS (
    SELECT location, MAX(new_vaccinations) AS total_vaccinations
    FROM covid_vaccinations 
    GROUP BY location)
SELECT 
    a.location,
    CAST(a.total_population AS double) AS total_population,
    CAST(b.total_vaccinations AS double) AS total_vaccinations
FROM a
JOIN b ON a.location = b.location
WHERE a.total_population IS NOT NULL 
AND b.total_vaccinations IS NOT NULL);

-- Continental Data

-- North America Data 

-- Total cases vs total deaths --

CREATE VIEW na_tc_vs_td AS(
SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "North America"
GROUP BY 1
ORDER BY 1);

-- Max deaths per country

CREATE VIEW na_max_deaths AS(
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "North America"
GROUP BY 1
ORDER BY 2 DESC);


-- Daily total cases, total deaths and death percentage in NA

CREATE VIEW na_td_dp AS(
SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "North America"
GROUP BY 1
ORDER BY 1,2);

-- total population vs vaccinations

CREATE VIEW na_tp_vs_vaxx AS(
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
AND continent = "North America");

-- Total daily cases --

CREATE VIEW na_daily_case AS(
SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "North America"
GROUP BY 1
ORDER BY 1);

----------------------------------------------------------------------------------------------------------------------------------------------------------

-- South America Data 

-- Total cases vs total deaths --

CREATE VIEW sa_tc_vs_td AS(
SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "South America"
GROUP BY 1
ORDER BY 1);

-- Max deaths per country

CREATE VIEW sa_max_deaths AS(
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "South America"
GROUP BY 1
ORDER BY 2 DESC);

-- Daily total cases, total deaths and death percentage in SA

CREATE VIEW sa_tc_vs_td_dp AS(
SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "South America"
GROUP BY 1
ORDER BY 1,2);

-- total population vs vaccinations

CREATE VIEW sa_tp_vs_vaxx AS(
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
AND continent = "South America");

-- Total daily cases --

CREATE VIEW sa_daily_case AS(
SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "South America"
GROUP BY 1
ORDER BY 1);

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Asia Data 

-- Total cases vs total deaths --

CREATE VIEW asia_tc_vs_td AS(
SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "Asia"
GROUP BY 1
ORDER BY 1);


-- Max deaths per country

CREATE VIEW asia_max_deaths AS(
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "Asia"
GROUP BY 1
ORDER BY 2 DESC);


-- Daily total cases, total deaths and death percentage in NA

CREATE VIEW asia_tc_td_dp AS(
SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "Asia"
GROUP BY 1
ORDER BY 1,2);

-- total population vs vaccinations

CREATE VIEW asia_tp_vs_vaxx AS(
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
AND continent = "Asia");

-- Total daily cases --

CREATE VIEW asia_daily_case AS(
SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "Asia"
GROUP BY 1
ORDER BY 1);

------------------------------------------------------------------------------------------------------------------------------------------------

-- Europe Data 

-- Total cases vs total deaths --

CREATE VIEW eu_tc_vs_td AS(
SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "Europe"
GROUP BY 1
ORDER BY 1);

-- Max deaths per country

CREATE VIEW eu_max_deaths AS(
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "Europe"
GROUP BY 1
ORDER BY 2 DESC);


-- Daily total cases, total deaths and death percentage in Europe

CREATE VIEW eu_tc_td_dp AS(
SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "Europe"
GROUP BY 1
ORDER BY 1,2);

-- total population vs vaccinations

CREATE VIEW eu_tp_vs_vaxx AS(
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
AND continent = "Europe");

-- Total daily cases --

CREATE VIEW eu_daily_case AS(
SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "Europe"
GROUP BY 1
ORDER BY 1);

------------------------------------------------------------------------------------------------------------------------------------------------------

-- Africa Data 

-- Total cases vs total deaths --

CREATE VIEW africa_tc_vs_td AS(
SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "Africa"
GROUP BY 1
ORDER BY 1);

-- Max deaths per country

CREATE VIEW africa_max_deaths AS(
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "Africa"
GROUP BY 1
ORDER BY 2 DESC);


-- Daily total cases, total deaths and death percentage in Africa

CREATE VIEW africa_tc_td_dp AS(
SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "Africa"
GROUP BY 1
ORDER BY 1,2);

-- total population vs vaccinations

CREATE VIEW africa_tp_vs_vaxx AS(
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
AND continent = "Africa");

-- Total daily cases --

CREATE VIEW africa_daily_case AS(
SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "Africa"
GROUP BY 1
ORDER BY 1);

--------------------------------------------------------------------------------------------------------------------------------

-- Oceania Data 

-- Total cases vs total deaths --

CREATE VIEW oc_tc_vs_td AS(
SELECT location, SUM(new_cases) as total_case, SUM(new_deaths) as total_deaths
FROM  covid_deaths
WHERE new_cases IS NOT NULL
AND new_deaths IS NOT NULL
AND continent = "Oceania"
GROUP BY 1
ORDER BY 1);

-- Max deaths per country

CREATE VIEW oc_max_deaths AS(
SELECT location, MAX(total_deaths) AS TotalDeathCount
FROM  covid_deaths 
WHERE continent = "Oceania"
GROUP BY 1
ORDER BY 2 DESC);


-- Daily total cases, total deaths and death percentage in Oceania

CREATE VIEW oc_tc_td_dp AS(
SELECT date, SUM(new_cases) AS total_cases, SUM(new_deaths) AS total_deaths, SUM(new_deaths)/SUM(new_cases)*100 AS percentage_of_deaths
FROM  covid_deaths
WHERE continent = "Oceania"
GROUP BY 1
ORDER BY 1,2);

-- total population vs vaccinations

CREATE VIEW oc_tp_vaxx AS(
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
AND continent = "Oceania");

-- Total daily cases --

CREATE VIEW oc_daily_case AS(
SELECT date, SUM(new_cases) AS total_cases
FROM  covid_deaths
WHERE continent = "Oceania"
GROUP BY 1
ORDER BY 1);
