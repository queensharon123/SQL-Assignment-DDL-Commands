## ASSIGNMENT 8 SUBQUERIES AND VIEWS
Create database SchoolDB;
use SchoolDB;
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
   
#Find the number of persons in each country.   
select Country_name, Population
from Countryy;

#Find the number of persons in each country sorted from high to low.
select Country_name, Population
from Countryy
ORDER BY Population DESC;

#Find out an average rating for Persons in respective countries if the average is greater than 3.0 
select Country_name, AVG(CAST(Rating AS DECIMAL)) AS Average_Rating
from Person
where Rating IS NOT NULL
group by Country_name
having avg(CAST(Rating AS DECIMAL)) > 3.0;

# Find the countries with the same rating as the USA. (Use Subqueries) 
SELECT DISTINCT Country_name
FROM Person
WHERE Rating = (SELECT Rating FROM Person WHERE Country_name = 'USA');

# Select all countries whose population is greater than the average population of all nations.
SELECT DISTINCT Country_name
FROM Person
WHERE CAST(Population AS DECIMAL) > (SELECT AVG(CAST(Population AS DECIMAL)) FROM Person);

CREATE DATABASE Product;
USE Product;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_code VARCHAR(20),
    Country VARCHAR(100)
);
INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(1, 'John', 'Doe', 'john.doe@gmail.com', '1234567890', '123 Elm St', 'Springfield', 'IL', '62701', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@gmail.com', '2345678901', '456 Oak St', 'Lincoln', 'NE', '68508', 'UK'),
(3, 'Alice', 'Johnson', 'alice.johnson@gmail.com', '3456789012', '789 Maple St', 'Dallas', 'TX', '75201', 'India'),
(4, 'Bob', 'Brown', 'bob.brown@gmail.com', '4567890123', '321 Pine St', 'Miami', 'FL', '33101', 'USA'),
(5, 'Charlie', 'Davis', 'charlie.davis@gmail.com', '5678901234', '654 Cedar St', 'Seattle', 'WA', '98101', 'Luxemberg');

select * from Customer;

#  Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 
create VIEW customer_info as select CONCAT(First_name, ' ', Last_name) as Full_Name,Email
from Customer;
    
select * from customer_info;    

# Create a view named US_Customers that displays customers located in the US
Create view US_Customers as
select Customer_Id,CONCAT(First_name, ' ', Last_name) as Full_Name from Customer where Country = 'USA';

select * from US_Customers;     

# Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state.
create view Customer_details as
select CONCAT(First_name, ' ', Last_name) as Full_Name,Email, Phone_no,State from Customer;

select * from Customer_details;

SET SQL_SAFE_UPDATES = 0;
# Update phone numbers of customers who live in  for Customer_details view.
update Customer
set Phone_no = '123-456-7890'
where State = 'USA';

select * from Customer;

# Count the number of customers in each state and show only states with more than 5 customers.
select State,COUNT(*) AS Customer_Count from Customer group by State having COUNT(*) > 5;

#  Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.
select state, COUNT(*) AS Customer_Count from customer_details group by state;

# Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from customer_details order by state ASC;