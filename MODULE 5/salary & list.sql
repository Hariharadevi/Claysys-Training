create table employee1(
employee_id int primary key,
emp_name varchar(50) not null,
email varchar(50) unique,
phone_number varchar(50),
department varchar(100));

select * from employee1;

insert into employee1(employee_id,emp_name,email,phone_number,department)values(1,'Hari','hari@gmail.com','8877667789','Manager');

alter table employee1
add salary int;

update employee set salary = 50000 where employee_id=1;

insert into employee1(employee_id,emp_name,email,phone_number,department,salary)values(2,'Devi','devi@gmail.com','8807667789','Marketing',45000);
insert into employee1(employee_id,emp_name,email,phone_number,department,salary)values(3,'pranav','dev@gmail.com','9977667789','HR',70000);
insert into employee1(employee_id,emp_name,email,phone_number,department,salary)values(4,'pranitha','pranitha@gmail.com','9907667789','packing',25000);

select * from employee1;

select * from employee1
where department='HR';


select max(salary)as
second_highest_salary
from employee1
where salary<(select max(salary)from employee1);

insert into employee1(employee_id,emp_name,email,phone_number,department,salary)values(5,'Deva','deva@gmail.com','9807667789','Marketing',45000);
insert into employee1(employee_id,emp_name,email,phone_number,department,salary)values(6,'pranesh','pranesh@gmail.com','9907667789','HR',70000);
insert into employee1(employee_id,emp_name,email,phone_number,department,salary)values(7,'Gowthami','gow@gmail.com','9807667789','Manager',50000);
insert into employee1(employee_id,emp_name,email,phone_number,department,salary)values(8,'Dev','de@gmail.com','7807667789','Marketing',45000);
insert into employee1(employee_id,emp_name,email,phone_number,department,salary)values(9,'Amirtha','ami@gmail.com','9077667789','HR',70000);
insert into employee1(employee_id,emp_name,email,phone_number,department,salary)values(10,'Prabha','prabha@gmail.com','9997667789','packing',25000);

select department,
count (employee_id) as number_of_employees
from employee1 group by department;

