# ASSIGNMENT 6 JOINS AND UNION
# creating database list 
create database list;
use list;
create table Country(
Id int primary key,
Country_name varchar(50),
Population int,
Area int
);
create table Persons(
Id int primary key,
Fname varchar(50),
Lname varchar(50),
Population int,
Rating DOUBLE,
Country_Id int,
Country_name varchar(50)
);
insert into Country (Id,Country_name,Population,Area) values
 ('1','America','334700000','3809525'),
 ('2','India','1456578583',3287263),
 ('3','United Kingdom','68400000','243610'),
 ('4','Germany','84552242','357596'),
 ('5','Australia','27204809','7688287'),
 ('6','Italy','59255461','302073'),
 ('7','Canada','40528396','9984670'),
 ('8','Turkey','40528396','87473805'),
 ('9','China','1419321278','3700000'),
 ('10','Israel','9444395','20770')
 
 select * from country;
 
  insert into Persons(Id,Fname,Lname,Population,Rating,Country_Id,Country_name) values
 ('1','Arvind','A','334700000','4','45','America'),
 ('2','Anamika','A','1456578583','8','54','India'),
 ('3','Remya','S','68400000','6','006','UK'), 
 ('4','Soorya','M','84552242','3','23','Germany'), 
 ('5','Soorya','M','84588242','0','55','Australia'), 
 ('6','Adrin','I','89952242','2','87',NULL), 
 ('7','Amina','M','89956','5','33','Luxembourg'), 
 ('8','Summayya','I','99952882','5','77','USA'), 
 ('9','Azeela','I','5699522','4','44','Canada'), 
 ('10','Rohini','I','7865402','8','22',NULL)
 
 select * from Persons;
 
 ## INNER JOIN
 SELECT 
    Persons.Id AS PersonId,
    Persons.Fname,
    Persons.Lname,
    Persons.Population AS PersonPopulation,
    Persons.Rating,
    Country.Id AS CountryId,
    Country.Country_name,
    Country.Population AS CountryPopulation,
    Country.Area
FROM 
    Persons
INNER JOIN 
    Country 
ON 
    Persons.Country_Id = Country.Id;
    
## LEFT JOIN    
    SELECT 
    Persons.Id AS PersonId,
    Persons.Fname,
    Persons.Lname,
    Persons.Population AS PersonPopulation,
    Persons.Rating,
    Country.Id AS CountryId,
    Country.Country_name,
    Country.Population AS CountryPopulation,
    Country.Area
FROM 
    Persons
LEFT JOIN 
    Country 
ON 
    Persons.Country_Id = Country.Id;
    
## RIGHT JOIN
  SELECT 
    Country.Id AS CountryId,
    Country.Country_name,
    Country.Population AS CountryPopulation,
    Country.Area,
    Persons.Id AS PersonId,
    Persons.Fname,
    Persons.Lname,
    Persons.Population AS PersonPopulation,
    Persons.Rating
FROM 
    Country
RIGHT JOIN 
    Persons 
ON 
    Persons.Country_Id = Country.Id;  
    
## List all distinct country names from both the Country and Persons tables.  
  
SELECT DISTINCT Country_name AS CountryName
FROM Country

UNION

SELECT DISTINCT c.Country_name AS CountryName
FROM Persons p
JOIN Country c ON p.Country_Id = c.Id;

## List all country names from both the Country and Persons tables, including duplicates. 
SELECT Country_name AS CountryName
FROM Country

UNION ALL

SELECT c.Country_name AS CountryName
FROM Persons p
JOIN Country c ON p.Country_Id = c.Id;

## Round the ratings of all persons to the nearest integer in the Persons table.

USE SAFE CODE
SET SQL_SAFE_UPDATES = 0;

UPDATE Persons
SET Rating = ROUND(Rating);