# Assignment 10 Triggers
create database School;
use School;

CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(50),
    experience INT,    
    salary DECIMAL(10, 2)
);
INSERT INTO teachers (id, name, subject, experience, salary) VALUES
(1, 'Alice Johnson', 'Mathematics', 5, 55000.00),
(2, 'Bob Smith', 'Science', 8, 62000.00),
(3, 'Charlie Brown', 'English', 4, 50000.00),
(4, 'Diana Prince', 'History', 6, 58000.00),
(5, 'Ethan Hunt', 'Art', 3, 45000.00),
(6, 'Fiona Apple', 'Music', 7, 60000.00),
(7, 'George Washington', 'Physical Education', 10, 70000.00),
(8, 'Hannah Montana', 'Computer Science', 2, 52000.00);

select * from teachers;

# Before Insert trigger
DELIMITER //

CREATE TRIGGER before_insert_teacher
BEFORE INSERT ON teachers
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END; //

DELIMITER ;

# After Insert Trigger
CREATE TABLE teacher_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    action VARCHAR(50),
    timestamp DATETIME,
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
);

DELIMITER //

CREATE TRIGGER after_insert_teacher
AFTER INSERT ON teachers
FOR EACH ROW
BEGIN
    INSERT INTO teacher_log (teacher_id, action, timestamp) 
    VALUES (NEW.id, 'insert', NOW());
END; //

DELIMITER ;

# Create before Delete Trigger
DELIMITER //

CREATE TRIGGER before_delete_teacher
BEFORE DELETE ON teachers
FOR EACH ROW
BEGIN
    IF OLD.experience > 10 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cannot delete teacher with more than 10 years of experience';
    END IF;
END; //

DELIMITER ;

# after delete trigger
DELIMITER //

CREATE TRIGGER after_delete_teacher
AFTER DELETE ON teachers
FOR EACH ROW
BEGIN
    -- Insert a log entry into the teacher_log table
    INSERT INTO teacher_log (teacher_id, action, timestamp) 
    VALUES (OLD.id, 'delete', NOW());
END; //

DELIMITER ;
