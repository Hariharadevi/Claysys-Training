CREATE TABLE employees1 (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    salary INT
);

CREATE TABLE new_employees1 (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    salary INT
);

MERGE INTO employees1 AS target
USING new_employees1 AS source
ON target.employee_id = source.employee_id

-- When there is a match, update the employee record
WHEN MATCHED THEN
    UPDATE SET target.first_name = source.first_name,
               target.last_name = source.last_name,
               target.email = source.email,
               target.salary = source.salary

-- When there is no match in the target, insert the new employee
WHEN NOT MATCHED BY TARGET THEN
    INSERT (employee_id, first_name, last_name, email, salary)
    VALUES (source.employee_id, source.first_name, source.last_name, source.email, source.salary)

-- When there is no match in the source, delete the employee record
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

	select * from employees1;