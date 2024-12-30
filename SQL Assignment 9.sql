# Assignment 9 
create database School;
use School;
create table Worker(
 Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
    );
INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) VALUES
(1, 'John', 'Doe', 50000, '2022-01-15', 'Engineering'),
(2, 'Jane', 'Smith', 60000, '2021-06-10', 'Marketing'),
(3, 'Alice', 'Johnson', 70000, '2020-03-22', 'Sales'),
(4, 'Bob', 'Brown', 55000, '2019-12-05', 'IT'),
(5, 'Emma', 'Davis', 62000, '2021-11-30', 'HR'),
(6, 'Michael', 'Wilson', 58000, '2022-04-17', 'Engineering'),
(7, 'Sophia', 'Martinez', 72000, '2020-05-25', 'Sales'),
(8, 'James', 'Anderson', 64000, '2019-09-15', 'Marketing'),
(9, 'Olivia', 'Thomas', 69000, '2022-02-20', 'IT'),
(10, 'William', 'Taylor', 50000, '2021-08-10', 'HR');    
    
select * from Worker;    

DELIMITER //
CREATE PROCEDURE AddWorker(
    IN p_Worker_Id INT,
    IN p_FirstName CHAR(25),
    IN p_LastName CHAR(25),
    IN p_Salary INT,
    IN p_JoiningDate DATETIME,
    IN p_Department CHAR(25)
)
BEGIN
    INSERT INTO Worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department) 
    VALUES (p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
END //
DELIMITER ;

call AddWorker(11, 'Liam', 'Garcia', 57000, '2023-10-01', 'Engineering');
    
SELECT * FROM Worker; 

# Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.

DELIMITER //

CREATE PROCEDURE GetWorkerSalary(
    IN p_Worker_Id INT,   
    OUT p_Salary INT     
)
BEGIN
    SELECT Salary INTO p_Salary 
    FROM Worker 
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;   

SET @WorkerId = 1; 
SET @Salary = 0;  
CALL GetWorkerSalary(@WorkerId, @Salary);
SELECT @Salary AS Salary;

# Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. It should update the department of the worker with the given ID. Then make a procedure call
DELIMITER //

CREATE PROCEDURE UpdateWorkerDepartment(
    IN p_Worker_Id INT,        
    IN p_Department CHAR(25)   
)
BEGIN
    UPDATE Worker 
    SET Department = p_Department 
    WHERE Worker_Id = p_Worker_Id;
END //

DELIMITER ;

SET @WorkerId = 1;            
SET @NewDepartment = 'Marketing'; 
CALL UpdateWorkerDepartment(@WorkerId, @NewDepartment);
SELECT * FROM Worker WHERE Worker_Id = @WorkerId;

#  Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call.
DELIMITER //

CREATE PROCEDURE GetWorkerCountByDepartment(
    IN p_Department CHAR(25),  -- Input parameter for department
    OUT p_workerCount INT       -- Output parameter for returning the worker count
)
BEGIN
    -- Retrieve the count of workers in the given department
    SELECT COUNT(*) INTO p_workerCount 
    FROM Worker 
    WHERE Department = p_Department;
END //

DELIMITER ;

SET @Department = 'Sales';
SET @WorkerCount = 0;      
CALL GetWorkerCountByDepartment(@Department, @WorkerCount);
SELECT @WorkerCount AS WorkerCount; 

# Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure.
  DELIMITER //

CREATE PROCEDURE GetAverageSalaryByDepartment(
    IN p_Department CHAR(25),
    OUT p_avgSalary DECIMAL(10, 2) 
)
BEGIN
    SELECT AVG(Salary) INTO p_avgSalary 
    FROM Worker 
    WHERE Department = p_Department;
END //

DELIMITER ;

SET @Department = 'Engineering';
SET @AvgSalary = 0;              
CALL GetAverageSalaryByDepartment(@Department, @AvgSalary);
SELECT @AvgSalary AS AverageSalary;  


