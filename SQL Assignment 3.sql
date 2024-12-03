# Creating Database List
create database list;
use list;
# Creating table Managers
create table Managers(
   Manager_Id int primary key,
   First_name varchar(50),
   Last_Name varchar(50),
   DOB date,
   Gender varchar(50),
   Age int,
   CHECK (Age>=18),
   Department varchar(44),
   Salary int8 NOT NULL
   );
   
   insert into Managers (Manager_Id,First_name,Last_Name,DOB,Gender,Age,Department,Salary) values
     ('1','Anamika','A','1990-10-12','Female','34','IT','36000'),  
	 ('2','Aaliya','M','1992-5-23','Female','32','IT','10000'),
	 ('3','Arun','M','1991-10-25','Male','33','EEE','29000'),
	 ('4','Varun','M','1991-5-17','Male','33','Civil','30000'),
	 ('5','Rahul','M','1991-9-19','Male','33','EEE','60000'),
	 ('6','Rahul','M','1991-2-18','Male','33','Mechanical','80000'),
	 ('7','Aron','M','1995-5-13','Female','29','EEE','45000'),
	 ('8','Madhumitha','F','1997-9-17','Female','27','Maths','50000'),
	 ('9','Adrin','M','1999-3-16','Female','25','English','75000'),
	 ('10','Mohan','M','1989-3-16','Male','35','English','40000')
     
     select * from Managers;
     
     # query that retrieves the name and date of birth of the manager with Manager_Id 1
     select First_name,Last_Name,DOB from Managers where Manager_Id =1;
     
     # query to display the Salary of all managers.
     select First_name,Salary from Managers;
     
     # query to display records of all managers except ‘Aaliya’.
     select * from Managers where First_name!='Aaliya';
     
     # query to display details of managers whose department is IT and earns more than 25000 per month
     select * from Managers where Department = 'IT' AND Salary>'25000';
     select * from Managers;
     
     ## query to display details of managers whose salary is between 10000 and 35000
     select * from Managers where Salary BETWEEN 10000 AND 35000;
     SELECT MIN(Salary), MAX(Salary) FROM Managers;
     