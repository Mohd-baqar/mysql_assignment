drop database if exists  company_training ;
create database company_training ;
use company_training;

create table departments(
department_id int not null ,
department_name varchar (80) not null,
city varchar(60)
);
create table employees(
employee_id int not null,
employee_name varchar(100) not null,
email varchar(120),
department_id int not null,
salary decimal(10,2),
status varchar(20)
);
select * from departments;
 select * from employees;
 
 
 ### Q1. Add a PRIMARY KEY constraint on departments.department_id.
ALTER TABLE departments
ADD CONSTRAINT pk_departments PRIMARY KEY (department_id);

### Q2. Add a PRIMARY KEY constraint on employees.employee_id.
ALTER TABLE employees
ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);

### Q3. Add a new column named location to the departments table.
ALTER TABLE departments
ADD COLUMN location VARCHAR(100);

### Q4. Rename department_name to dept_name.
ALTER TABLE departments
CHANGE COLUMN department_name dept_name VARCHAR(80) NOT NULL;


### Q5. Modify employees salary to DECIMAL(12,2) and make it NOT NULL.
ALTER TABLE employees
MODIFY COLUMN salary DECIMAL(12,2) NOT NULL;


### Q6. Set the default value of employees.status to Active.
ALTER TABLE employees
ALTER COLUMN status SET DEFAULT 'Active';


### Q7. Add a UNIQUE constraint on employees.email.
ALTER TABLE employees
ADD CONSTRAINT uq_employees_email UNIQUE (email);


### Q8. Rename the employees table to staff.
RENAME TABLE employees TO staff;


### Q9. Add a FOREIGN KEY constraint on staff.department_id.
ALTER TABLE staff
ADD CONSTRAINT fk_staff_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);


### Q10. Drop the UNIQUE constraint on staff.email.
ALTER TABLE staff
DROP INDEX uq_employees_email;


### Q11. Drop the FOREIGN KEY constraint without dropping department_id.
ALTER TABLE staff
DROP FOREIGN KEY fk_staff_department;


### Q12. Drop the PRIMARY KEY from staff while retaining employee_id.
ALTER TABLE staff
DROP PRIMARY KEY;


### Q13. Add the PRIMARY KEY back on staff.employee_id.
ALTER TABLE staff
ADD CONSTRAINT pk_staff PRIMARY KEY (employee_id);

### Q14. Drop the location column from departments.
ALTER TABLE departments
DROP COLUMN location;


### Q15. Rename the database to company_management using supported MySQL operations.
CREATE DATABASE if not exists company_management;
DROP TABLE IF EXISTS company_management.staff;
DROP TABLE IF EXISTS company_management.departments;

RENAME TABLE
    company_training.departments
    TO company_management.departments,
    company_training.staff
    TO company_management.staff;



-- Drop the old empty database
DROP DATABASE company_training;

 
 USE company_management;
SHOW TABLES;
 
 SELECT * FROM departments;
SELECT * FROM staff;
 
describe departments;
describe staff;