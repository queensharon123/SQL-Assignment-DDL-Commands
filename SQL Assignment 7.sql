## ASSIGNMENT 7 FUNCTIONS
create database list;
use list;
create table Countryy(
Id int primary key,
Country_name varchar(50),
Population int,
Area int
);
create table Person(
Id int primary key,
Fname varchar(50),
Lname varchar(50),
DOB date,
Population int,
Rating DOUBLE,
Country_Id int,
Country_name varchar(50)
);
insert into Countryy (Id,Country_name,Population,Area) values
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
 select * from Countryy;
 
 insert into Person(Id,Fname,Lname,DOB,Population,Rating,Country_Id,Country_name) values
 ('1','Arvind','A','1990-01-11','334700000','4','45','America'),
 ('2','Anamika','A','1993-02-12','1456578583','8','54','India'),
 ('3','Remya','S','1996-03-13','68400000','6','006','UK'), 
 ('4','Soorya','M','1992-04-14','84552242','3','23','Germany'), 
 ('5','Soorya','M','1992-05-15','84588242','0','55','Australia'), 
 ('6','Adrin','I','1991-06-16','89952242','2','87',NULL), 
 ('7','Amina','M','1997-07-17','89956','5','33','Luxembourg'), 
 ('8','Summayya','I','1998-08-18','99952882','5','77','USA'), 
 ('9','Azeela','I','1999-09-19','5699522','4','44','Canada'), 
 ('10','Rohini','I','1995-10-21','7865402','8','22',NULL)
 
 select * from Person;
 
 ## Extract the first three characters of each country's name in the Country table. 
 select Country_name,substr(Country_name,1,3) as first_three from Countryy;
 
 ## Find the length of each country name in the Country table.
 DELIMITER //
 create function Countrynamelength ( Country_name varchar(50))
 returns int
 deterministic 
 begin 
 return length(Country_name);
 end //
 
 delimiter ;   
 
 select Country_name,Countrynamelength(Country_name) as Countrynamelength from Countryy;
  select Country_name,length(Country_name) as Countrynamelength from Countryy;
  
  SET SQL_SAFE_UPDATES = 0;
  update Countryy
set Country_name = UPPER(Country_name);
 select * from Countryy;
 
 ## Write a user-defined function to calculate age using DOB.
 DELIMITER $$

create function CalculateAge(DOB DATE) 
returns INT
DETERMINISTIC
BEGIN
    declare age INT;
    set age = YEAR(CURDATE()) - YEAR(DOB) - (DATE_FORMAT(CURDATE(), '%m%d') < DATE_FORMAT(DOB, '%m%d'));
    RETURN age;
END $$

## Write a select query to fetch the Age of all persons using the function that has been created.
DELIMITER ;

select Id, Fname, Lname, DOB, CalculateAge(DOB) as Age from Person;
 
    