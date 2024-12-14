# ASSIGNMENT 5 SORTING AND GROUPING DATA
# Creating Database Listt
create database listt;
use listt;
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
Rating int,
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
 
 select * from Country;
 
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

select SUBSTRING(Country_name, 1, 3) AS FirstThreeCharacters from Country;

select CONCAT(Fname, ' ', Lname) AS FullName from Persons;

select COUNT(DISTINCT Country_name) AS UniqueCountryCount from Persons;

select MAX(Population) AS MaxPopulation from Country;

select min(Population) as MinPopulation from Country;

INSERT INTO Persons (Id,Fname,Lname,Population,Rating,Country_Id,Country_name)
values ('11','John', NULL, 99952882,'8','77', 'USA'),
       ('12','Jane', NULL, 5699522,'4','44','Canada')
       
select COUNT(Lname) AS CountLname from Persons;       

select COUNT(*) AS TotalRows from Persons;

select * from Country LIMIT 3;

select * from Country ORDER BY RAND() LIMIT 3;

select * from Persons ORDER BY Rating DESC;

select Country_name, SUM(Population) AS TotalPopulation
from Persons
GROUP BY Country_name;

SELECT Country_name, SUM(Population) AS TotalPopulation
from Persons
GROUP BY Country_name
HAVING SUM(Population) > 50000;

select Country_name, COUNT(*) AS TotalPersons, AVG(Rating) AS AverageRating
from Persons
GROUP BY Country_name
HAVING COUNT(*) > 2
ORDER BY AverageRating ASC;


