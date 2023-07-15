create database portfolio_project;
use portfolio_project;

select * from `owid-covid vaccinations`
order by 3,4;
select * from `owid-covid-data1`
order by 3,4;
select Location,date,total_cases,new_cases,total_deaths,population from `owid-covid-data1`
order by 1,2;
-- looking at total_cases vs total_deaths
select Location,date,total_cases,total_deaths,(total_deaths/total_cases)  * 100 as deathpercentage from `owid-covid-data1` 
order by 1,2;

-- looking at total cases vs population
select Location,date,total_cases,population,(total_cases/population) * 100 as deathpercentage from `owid-covid-data1` 
order by 1,2;
-- looking at countries with highest infection rate compared to population
select Location,population,max(total_cases) as highestinfectioncount,max(total_cases/population)  * 100 as percentagepopulation 
from `owid-covid-data1` group by location,population
order by percentagepopulation desc;

-- showing countries with highest death count per population
select Location,max(total_deaths) as totaldeathcount
from `owid-covid-data1` group by location
order by totaldeathcount desc;

-- lets break thinks down by continent
select continent,max(cast(total_deaths)) as totaldeathcount
from `owid-covid-data1` group by continent
order by totaldeathcount desc;

-- global numbers
select date,total_cases,total_deaths,(total_deaths/total_cases)  * 100 as deathpercentage
from `owid-covid-data1` where continent is not null 
order by 1,2;

select * from `owid-covid vaccinations`
join `owid-covid-data1`;
