-- LINK : https://en.wikibooks.org/wiki/SQL_Exercises/Employee_management
SET SQL_SAFE_UPDATES = 0;

-- 2.1 Select the last name of all employees.
SELECT LastName FROM Employees;	

-- 2.2 Select the last name of all employees, without duplicates.
SELECT DISTINCT LastName FROM Employees;

-- 2.3 Select all the data of employees whose last name is "Smith".	
SELECT * FROM Employees
WHERE LastName = 'Smith';

-- 2.4 Select all the data of employees whose last name is "Smith" or "Doe".
SELECT * FROM Employees
WHERE LastName IN ('Smith','Doe');

-- 2.5 Select all the data of employees that work in department 14.
SELECT * FROM Employees
WHERE Department = 14;

-- 2.6 Select all the data of employees that work in department 37 or department 77.
SELECT * FROM Employees
WHERE Department IN ('37','77');

-- 2.7 Select all the data of employees whose last name begins with an "S".
SELECT * FROM Employees
WHERE LastName LIKE 'S%';

-- 2.8 Select the sum of all the departments' budgets.
SELECT SUM(Budget)
FROM Departments;

-- 2.9 Select the number of employees in each department (you only need to show the department code and the number of employees).
SELECT Departments.Code, COUNT(Employees.Name) AS NumberOfEmployee
FROM Employees
INNER JOIN Departments ON Departments.Code = Employees.Department
GROUP BY Code;

-- 2.10 Select all the data of employees, including each employee's department's data.
SELECT * FROM Employees
INNER JOIN Departments
ON Departments.Code=Employees.Department;

-- 2.11 Select the name and last name of each employee, along with the name and budget of the employee's department.
SELECT Employees.Name,Employees.LastName,Departments.Name AS DepartmentName,Departments.Budget FROM Employees
INNER JOIN Departments
ON Employees.Department=Departments.Code;


-- 2.12 Select the name and last name of employees working for departments with a budget greater than $60,000.
SELECT Employees.Name,LastName FROM Employees
INNER JOIN Departments 
ON Employees.Department=Departments.Code
WHERE Departments.Budget > '60000';


-- 2.13 Select the departments with a budget larger than the average budget of all the departments.
SELECT Budget, Name FROM Departments
WHERE Budget >  (SELECT AVG(Budget) FROM Departments);

-- 2.14 Select the names of departments with more than two employees.
SELECT DISTINCT COUNT(Employees.Department),Departments.Name
FROM Employees
INNER JOIN Departments
ON Departments.Code=Employees.Department
GROUP BY Department
HAVING COUNT(Employees.Department)>2;

-- 2.15 Very Important - Select the name and last name of employees working for departments with second lowest budget.
SELECT Employees.Name,LastName,Departments.Budget AS SecondLowestBudget 
FROM Employees
INNER JOIN Departments ON Departments.Code=Employees.Department
AND Departments.Budget=
(SELECT Budget 
FROM Departments
ORDER BY Budget ASC
LIMIT 1 OFFSET 1);

-- 2.16  Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. 
-- And Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.
INSERT INTO Departments(Code,Name,Budget) VALUES(11,'Quality Assurance',40000);
INSERT INTO Employees(SSN,Name,LastName,Department) VALUES(847-21-9811,'Mary','Moore',11);

-- 2.17 Reduce the budget of all departments by 10%.
UPDATE Departments
SET Budget= Budget-(Budget/100)*10;

-- 2.18 Reassign all employees from the Research department (code 77) to the IT department (code 14).
UPDATE Employees
SET Employees.Department =14
WHERE Employees.Department=77;

-- 2.19 Delete from the table all employees in the IT department (code 14).
DELETE FROM Employees
WHERE Employees.Department=14;

-- 2.20 Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.
DELETE FROM Employees
WHERE Department IN (
    SELECT Department
    FROM Departments
    WHERE Budget >= 60000
);

-- DONE--
