

DROP DATABASE IF EXISTS company_training;
DROP DATABASE IF EXISTS company_management;

CREATE DATABASE company_training;
USE company_training;

CREATE TABLE departments (
    department_id INT NOT NULL,
    dept_name VARCHAR(80) NOT NULL,
    city VARCHAR(60)
);

CREATE TABLE employees (
    employee_id INT NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(120),
    department_id INT NOT NULL,
    salary DECIMAL(10,2),
    status VARCHAR(20)
);

-- =========================================
-- Q1. Add a PRIMARY KEY constraint on
-- departments.department_id.
-- =========================================

ALTER TABLE departments
ADD CONSTRAINT pk_departments PRIMARY KEY (department_id);

-- =========================================
-- Q2. Add a PRIMARY KEY constraint on
-- employees.employee_id.
-- =========================================

ALTER TABLE employees
ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);


-- =========================================
-- Q3. Add a new column named location of type
-- VARCHAR(100) to the departments table.
-- =========================================

ALTER TABLE departments
ADD COLUMN location VARCHAR(100);

-- =========================================
-- Q4. Rename the column dept_name to
-- department_name in the departments table,
-- keeping its existing data type and
-- NOT NULL requirement.
-- =========================================

ALTER TABLE departments
CHANGE COLUMN dept_name department_name VARCHAR(80) NOT NULL;

-- =========================================
-- Q5. Modify employees.salary to DECIMAL(12,2)
-- and ensure that it does not allow NULL values.
-- =========================================

ALTER TABLE employees
MODIFY COLUMN salary DECIMAL(12,2) NOT NULL;

-- =========================================
-- Q6. Set the default value of employees.status
-- to Active.
-- =========================================

ALTER TABLE employees
ALTER COLUMN status SET DEFAULT 'Active';

-- =========================================
-- Q7. Add a UNIQUE constraint on employees.email.
-- =========================================

ALTER TABLE employees
ADD CONSTRAINT uq_employees_email UNIQUE (email);

-- =========================================
-- Q8. Rename the employees table to staff.
-- =========================================

RENAME TABLE employees TO staff;

-- =========================================
-- Q9. Add a FOREIGN KEY constraint on
-- staff.department_id referencing
-- departments.department_id.
-- =========================================

ALTER TABLE staff
ADD CONSTRAINT fk_staff_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

-- =========================================
-- Q10. Drop the UNIQUE constraint added to
-- staff.email in Question 7.
-- =========================================

ALTER TABLE staff
DROP INDEX uq_employees_email;

-- =========================================
-- Q11. Drop the FOREIGN KEY constraint created
-- in Question 9 without dropping the
-- department_id column.
-- =========================================

ALTER TABLE staff
DROP FOREIGN KEY fk_staff_department;

-- =========================================
-- Q12. Drop the PRIMARY KEY constraint from
-- the staff table, retaining its
-- employee_id column.
-- =========================================

ALTER TABLE staff
DROP PRIMARY KEY;

-- =========================================
-- Q13. Add the PRIMARY KEY constraint back
-- on staff.employee_id.
-- =========================================

ALTER TABLE staff
ADD CONSTRAINT pk_staff PRIMARY KEY (employee_id);

-- =========================================
-- Q14. Drop the location column from
-- the departments table.
-- =========================================

ALTER TABLE departments
DROP COLUMN location;

-- =========================================
-- Q15. Rename the database from company_training
-- to company_management using MySQL-supported
-- DDL operations.
-- Create the new database, move both tables
-- to it, and remove the old empty database.
-- (MySQL does not support a direct
-- RENAME DATABASE command.)
-- =========================================

CREATE DATABASE company_management;

RENAME TABLE
    company_training.departments
    TO company_management.departments,
    company_training.staff
    TO company_management.staff;

DROP DATABASE company_training;

USE company_management;


SHOW TABLES;

SELECT * FROM departments;
SELECT * FROM staff;

DESCRIBE departments;
DESCRIBE staff;
