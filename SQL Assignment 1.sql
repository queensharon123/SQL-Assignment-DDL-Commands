-- Creating a Database
create database School;
use School;
-- Creating table Student

create table Student(
  Roll_No int,
  Student_name varchar(50) not null,
  Marks varchar(30),
  Grade varchar(50)
  );

desc Student;
# adding contact number column to Student
alter table Student add Contact_Number varchar(15);

desc Student;

# Renaming Student to Registered Students
rename table Student to CLASSTEN;
desc CLASSTEN;

# Adding values to the table
insert into CLASSTEN  (Roll_No, Student_name, Marks, Grade, Contact_Number) values
 ('1','Anitha','90','A','8907165345'), 
 ('2','Sunitha','92','A','8907145678'), 
 ('3','Arunima','85','B','890757341'), 
 ('4','Anamika','98','A+','890765345'), 
 ('5','Vamika','89','A','908756345'), 
 ('6','Anu','86','A','8907190754'), 
 ('7','Manu','93','A','907256783');
  
  desc CLASSTEN;
  
  # Displaying all the values in Classten table
  Select * from CLASSTEN;
  
  # Removing the Grade column from the CLASSTEN Table
  Alter table CLASSTEN drop column grade;
  desc CLASSTEN;
  Select * from CLASSTEN;
  
  # Deleting all the rows from CLASSTEN
  -- delete from CLASSTEN;
  
  -- USE SAFE CODE
  SET SQL_SAFE_UPDATES = 0;
   # Deleting all the rows from CLASSTEN
  delete from CLASSTEN;
  
select * from CLASSTEN;

-- Dropping the table
drop table CLASSTEN;

-- dropping database
drop database school;

