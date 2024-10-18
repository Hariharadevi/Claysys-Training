CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

select * from departments;

insert into departments(department_id,department_name)values(1,'HR');
insert into departments(department_id,department_name)values(2,'IT');
insert into departments(department_id,department_name)values(3,'Manager');
insert into departments(department_id,department_name)values(4,'Marketing');
insert into departments(department_id,department_name)values(5,'Packing');

select * from departments;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department_id INT,
    salary INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

select * from employees;

insert into employees(employee_id,employee_name,email,department_id,salary)values(1,'Dharani','dhara@gmail.com',1,50000);
insert into employees(employee_id,employee_name,email,department_id,salary)values(2,'Maha','maha@gmail.com',1,50000);
insert into employees(employee_id,employee_name,email,department_id,salary)values(3,'Dhanya','dhan@gmail.com',3,25000);
insert into employees(employee_id,employee_name,email,department_id,salary)values(4,'Dhana','dhana@gmail.com',2,45000);
insert into employees(employee_id,employee_name,email,department_id,salary)values(5,'Rani','rani@gmail.com',4,20000);
insert into employees(employee_id,employee_name,email,department_id,salary)values(6,'Divya','divya@gmail.com',5,15000);

select * from employees;

SELECT e.employee_name,d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;

SELECT e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;


SELECT e.employee_name, d.department_name
FROM employees e
RIGHT JOIN departments d ON e.department_id = d.department_id;

SELECT e.employee_name, d.department_name
FROM employees e
FULL OUTER JOIN departments d ON e.department_id = d.department_id;

