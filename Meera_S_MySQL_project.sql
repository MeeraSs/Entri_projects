CREATE DATABASE LIBRARY;
USE LIBRARY;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(255),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(20)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(255),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'John Doe', '123 Main St, Anytown', '2022-01-15'),
(2, 'Jane Smith', '456 Elm St, Anycity', '2022-02-20'),
(3, 'Alice Johnson', '789 Oak St, Anystate', '2022-03-25'),
(4, 'Bob Williams', '101 Pine St, Anyville', '2022-04-30'),
(5, 'Eve Brown', '202 Cedar St, Anyborough', '2022-05-05'),
(6, 'Michael Davis', '303 Maple St, Anytown', '2021-10-10'),
(7, 'Sarah Wilson', '404 Cedar St, Anycity', '2021-07-15'),
(8, 'Laura Rodriguez', '606 Elm St, Anyville', '2022-09-25'),
(9, 'Mary Jake', '404 Cedar St, Anycity', '2021-07-15'),
(10, 'Jeff Liam', '606 Elm St, Anyville', '2022-09-25')
;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
(101, 'Introduction to SQL', 'Programming', 15.99, 'yes', 'John Smith', 'TechBooks Inc.'),
(102, 'Python for Beginners', 'Programming', 19.99, 'no', 'Alice Johnson', 'CodePrints'),
(103, 'Data Structures and Algorithms', 'Computer Science', 24.99, 'yes', 'Bob Williams', 'DataTech Publishers'),
(104, 'The Great Gatsby', 'Fiction', 10.99, 'yes', 'F. Scott Fitzgerald', 'Classic Books Co.'),
(105, 'Harry Potter and the Philosopher''s Stone', 'Fantasy', 14.99, 'no', 'J.K. Rowling', 'Magic Books Ltd.'),
(106, 'Lord of the Rings', 'Fantasy', 12.99, 'yes', 'J.R.R. Tolkien', 'Fantasy Books Inc.'),
(107, 'The Art of War', 'History', 12.99, 'yes', 'Sun Tzu', 'Ancient Books Inc.'),
(108, 'Sapiens: A Brief History of Humankind', 'History', 17.99, 'yes', 'Yuval Noah Harari', 'Modern Books Co.'),
(109, '1984', 'Science Fiction', 13.99, 'no', 'George Orwell', 'Dystopian Press'),
(110, 'Pride and Prejudice', 'Romance', 10.99, 'yes', 'Jane Austen', 'Classic Books Co.');
;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES
(1, 101, '10 Oak St, Anytown', '555-1234'),
(2, 102, '20 Elm St, Anycity', '555-5678'),
(3, 103, '30 Pine St, Anystate', '555-9012'),
(4, 104, '40 Oak St, Anytown', '555-3456'),
(5, 105, '50 Elm St, Anycity', '555-6789'),
(6, 101, '60 Pine St, Anystate', '555-1234'),
(7, 102, '70 Cedar St, Anyville', '555-5678'),
(8, 103, '80 Maple St, Anyborough', '555-9012'),
(9, 102, '70 Cedar St, Anyville', '555-5678'),
(10, 103, '80 Maple St, Anyborough', '555-9012')
;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES
(201, 'Alice Smith', 'Manager', 60000.00, 1),
(202, 'Bob Johnson', 'Assistant Manager', 45000.00, 1),
(203, 'Charlie Brown', 'Clerk', 35000.00, 2),
(204, 'David Lee', 'Clerk', 35000.00, 2),
(205, 'Emma Wilson', 'Clerk', 35000.00, 3),
(206, 'Fiona Clark', 'Clerk', 35000.00, 1),
(207, 'Gregory Brown', 'Clerk', 35000.00, 2),
(208, 'Hannah White', 'Clerk', 35000.00, 1),
(209, 'Ian Harris', 'Clerk', 35000.00, 1),
(210, 'Jessica Taylor', 'Clerk', 35000.00, 1),
(211, 'Lena', 'Clerk', 35000.00, 2),
(212, 'George Brown', 'Clerk', 35000.00, 2),
(213, 'Hannah Mickey', 'Clerk', 35000.00, 2),
(214, 'Ivan Grey', 'Clerk', 35000.00, 2),
(215, 'Jessica Jose', 'Clerk', 35000.00, 2)
;

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(301, 1, 'Introduction to SQL', '2022-05-20', 101),
(302, 2, 'Data Structures and Algorithms', '2022-06-10', 103),
(303, 3, 'The Great Gatsby', '2022-07-05', 104),
(304, 4, 'Introduction to SQL', '2022-08-15', 101),
(305, 5, 'Harry Potter and the Philosopher''s Stone', '2022-09-01', 105),
(306, 8, 'Lord of the Rings', '2023-06-10', 106),
(307, 3, 'Introduction to SQL', '2023-06-15', 101),
(308, 6, 'Harry Potter and the Philosopher''s Stone', '2022-09-01', 105),
(309, 7, 'Lord of the Rings', '2023-06-10', 106),
(310, 8, 'Introduction to SQL', '2023-06-15', 101)
;

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(401, 1, 'Introduction to SQL', '2022-06-10', 101),
(402, 2, 'Data Structures and Algorithms', '2022-06-25', 103),
(403, 3, 'The Great Gatsby', '2022-07-15', 104),
(404, 4, 'Introduction to SQL', '2022-08-25', 101),
(405, 5, 'Harry Potter and the Philosopher''s Stone', '2022-09-15', 105),
(406, 8, 'Lord of the Rings', '2023-06-28', 106),
(407, 3, 'Introduction to SQL', '2023-06-30', 101),
(408, 6, 'Harry Potter and the Philosopher''s Stone', '2022-09-01', 105),
(409, 7, 'Lord of the Rings', '2023-06-10', 106),
(410, 8, 'Introduction to SQL', '2023-06-15', 101);

# 1.Retrieve the book title, category, and rental price of all available books.
SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

# 2.  List the employee names and their respective salaries in descending order of salary.
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

#3.  Retrieve the book titles and the corresponding customers who have issued those books.
SELECT b.Book_title, i.Issued_cust FROM IssueStatus i JOIN Books b ON i.Isbn_book = b.ISBN;

#4.  Display the total count of books in each category.
SELECT Category, COUNT(*) AS Total_Count FROM Books GROUP BY Category;

#5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

#6. List the customer names who registered before 2022-01-01 and have not issued any books yet.
SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

#7. Display the branch numbers and the total count of employees in each branch.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;

#8. . Display the names of customers who have issued books in the month of June 2023.
SELECT DISTINCT c.Customer_name
FROM Customer c JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust WHERE YEAR(i.Issue_date) = 2023 AND MONTH(i.Issue_date) = 6;

#9. Retrieve book_title from book table containing history. 10.Retrieve the branch numbers along with the count of employees for branches
#having more than 5 employees.
SELECT Book_title FROM Books WHERE Category = 'History';

#10.  Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no HAVING Total_Employees > 5;

drop database LIBRARY;