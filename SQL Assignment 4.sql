# ASSIGNMENT 4 Querying Data
# Creating Database list
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
 
 select DISTINCT Country_name from Persons;
 
 SELECT  *, CONCAT(Fname,' ', Lname) AS Fullname
 FROM Persons;
 
 select * from Persons where Rating > 4;
 
 select Country_name from Persons where Population > 1000000;
 
 select Fname,Lname from Persons where Country_name = 'USA';
 
 SELECT * FROM Persons WHERE Country_name IS NULL;

select fname from Persons where Country_name IN ('USA', 'Canada', 'UK'); 
 
select * from Persons where Country_name NOT IN ('India', 'Australia'); 

SELECT * from Persons WHERE Population BETWEEN 500000 AND 2000000;

SELECT * FROM Persons WHERE Country_name NOT LIKE 'C%';

 