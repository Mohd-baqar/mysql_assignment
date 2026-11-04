

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
-- Q1. Add PRIMARY KEY on departments.department_id
-- =========================================

ALTER TABLE departments
ADD CONSTRAINT pk_departments PRIMARY KEY (department_id);

-- =========================================
-- Q2. Add PRIMARY KEY on employees.employee_id
-- =========================================

ALTER TABLE employees
ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);

-- =========================================
-- Q3. Add location column
-- =========================================

ALTER TABLE departments
ADD COLUMN location VARCHAR(100);

-- =========================================
-- Q4. Rename dept_name to department_name
-- =========================================

ALTER TABLE departments
CHANGE COLUMN dept_name department_name VARCHAR(80) NOT NULL;

-- =========================================
-- Q5. Modify salary to DECIMAL(12,2) NOT NULL
-- =========================================

ALTER TABLE employees
MODIFY COLUMN salary DECIMAL(12,2) NOT NULL;

-- =========================================
-- Q6. Set default value of status to Active
-- =========================================

ALTER TABLE employees
ALTER COLUMN status SET DEFAULT 'Active';

-- =========================================
-- Q7. Add UNIQUE constraint on employees.email
-- =========================================

ALTER TABLE employees
ADD CONSTRAINT uq_employees_email UNIQUE (email);

-- =========================================
-- Q8. Rename employees table to staff
-- =========================================

RENAME TABLE employees TO staff;

-- =========================================
-- Q9. Add FOREIGN KEY on staff.department_id
-- =========================================

ALTER TABLE staff
ADD CONSTRAINT fk_staff_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

-- =========================================
-- Q10. Drop UNIQUE constraint from staff.email
-- =========================================

ALTER TABLE staff
DROP INDEX uq_employees_email;

-- =========================================
-- Q11. Drop FOREIGN KEY
-- =========================================

ALTER TABLE staff
DROP FOREIGN KEY fk_staff_department;

-- =========================================
-- Q12. Drop PRIMARY KEY from staff
-- =========================================

ALTER TABLE staff
DROP PRIMARY KEY;

-- =========================================
-- Q13. Add PRIMARY KEY back on staff.employee_id
-- =========================================

ALTER TABLE staff
ADD CONSTRAINT pk_staff PRIMARY KEY (employee_id);

-- =========================================
-- Q14. Drop location column
-- =========================================

ALTER TABLE departments
DROP COLUMN location;

-- =========================================
-- Q15. Move tables to company_management
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
