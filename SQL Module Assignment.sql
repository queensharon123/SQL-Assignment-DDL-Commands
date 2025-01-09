CREATE DATABASE library;

-- Use the library database
USE library;

-- Create the Branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main Street, Springfield', '5551234'),
(2, 102, '456 Elm Street, Springfield', '5555678'),
(3, 103, '789 Maple Ave, Springfield', '5558765');

select * from Branch;

-- Create the Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'John Doe', 'Librarian', 50000.00, 1),
(2, 'Jane Smith', 'Assistant Librarian', 35000.00, 2),
(3, 'Emily Johnson', 'Technician', 40000.00, 1),
(4, 'Michael Williams', 'Manager', 60000.00, 3),
(5, 'Olivia Brown', 'Intern', 25000.00, 2);

select * from Employee;

-- Create the Books table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'), -- 'yes' if book available, 'no' if not available
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES 
('978-3-16-148410-0', 'The Great Gatsby', 'Fiction', 2.99, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
('978-0-06-112008-4', 'To Kill a Mockingbird', 'Fiction', 3.49, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
('978-1-86197-876-9', '1984', 'Dystopian', 2.49, 'no', 'George Orwell', 'Secker & Warburg'),
('978-0-452-28423-4', 'Pride and Prejudice', 'Romance', 2.99, 'yes', 'Jane Austen', 'T. Egerton'),
('978-0-7432-7356-5', 'The Alchemist', 'Adventure', 3.89, 'yes', 'Paulo Coelho', 'HarperOne');

select * from Books;

-- Create the Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES 
(1, 'John Doe', '123 Main St, Anytown, India', '2020-01-01'),
(2, 'Jane Smith', '456 Elm St, Othertown, USA', '2020-02-02'),
(3, 'Bob Johnson', '789 Oak St, Anytown, Canada', '2020-03-03'),
(4, 'Alice Brown', '321 Maple St, Othertown, London', '2020-04-04'),
(5, 'Mike Davis', '901 Pine St, Anytown, Netherland', '2020-05-05');

select * from Customer;

-- Create the IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    ISBN_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, ISBN_book)
VALUES 
(1, 1, 'The Great Gatsby', '2023-01-15', '978-3-16-148410-0'),
(2, 2, 'To Kill a Mockingbird', '2023-01-16', '978-0-06-112008-4'),
(3, 3, '1984', '2023-01-17', '978-1-86197-876-9'),
(4, 4, 'Pride and Prejudice', '2023-01-18', '978-0-452-28423-4'),
(5, 5, 'The Alchemist', '2023-01-19', '978-0-7432-7356-5');

select * from IssueStatus;

-- Create the ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    ISBN_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (ISBN_book2) REFERENCES Books(ISBN)
);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, ISBN_book2)
VALUES 
(1, 1, 'The Great Gatsby', '2023-02-01', '978-3-16-148410-0'),
(2, 2, 'To Kill a Mockingbird', '2023-02-02', '978-0-06-112008-4'),
(3, 3, '1984', '2023-02-03', '978-1-86197-876-9'),
(4, 4, 'Pride and Prejudice', '2023-02-04', '978-0-452-28423-4'),
(5, 5, 'The Alchemist', '2023-02-05', '978-0-7432-7356-5');

select * from ReturnStatus;

# 1 Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';

# 2  List the employee names and their respective salaries in descending order of salary. 
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

# 3 Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title, c.Customer_name
FROM IssueStatus iss
JOIN Books b ON iss.ISBN_book = b.ISBN
JOIN Customer c ON iss.Issued_cust = c.Customer_Id;

# 4 Display the total count of books in each category. 
SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

# 5 Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

# 6 List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT c.Customer_name
FROM Customer c
LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE c.Reg_date < '2022-01-01' AND i.Issue_Id IS NULL;

# 7 Display the branch numbers and the total count of employees in each branch.
SELECT b.Branch_no, COUNT(e.Emp_Id) AS Total_Employees
FROM Branch b
LEFT JOIN Employee e ON b.Branch_no = e.Branch_no
GROUP BY b.Branch_no;

# 8 Display the names of customers who have issued books in the month of June 2023. 
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE i.Issue_date >= '2023-06-01' AND i.Issue_date < '2023-07-01';

# 9 Retrieve book_title from book table containing history. 
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

# 10 Retrieve the branch numbers along with the count of employees for branches having more than 5 employees
SELECT e.Branch_no, COUNT(e.Emp_Id) AS Employee_Count
FROM Employee e
GROUP BY e.Branch_no
HAVING COUNT(e.Emp_Id) > 5;

# 11 Retrieve the names of employees who manage branches and their respective branch addresses
SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Emp_Id = b.Manager_Id;

# 12 Display the names of customers who have issued books with a rental price higher than Rs. 25
SELECT DISTINCT c.Customer_name
FROM Customer c
JOIN IssueStatus iss ON c.Customer_Id = iss.Issued_cust
JOIN Books b ON iss.ISBN_book = b.ISBN
WHERE b.Rental_Price > 25;