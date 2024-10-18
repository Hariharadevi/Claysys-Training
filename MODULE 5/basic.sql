use student_records

create table employee( employee_id int primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(100) not null unique,
phone_number varchar(15));

insert into employee(employee_id,first_name,last_name,email,phone_number) values (1,'Dharani','shanmugam','dhara@gmail.com','8989989878');

select * from employee;

alter table employee 
add salary int;

select * from employee;

update employee set salary = 50000 where employee_id=1;

select * from employee;

insert into employee(employee_id,first_name,last_name,email,phone_number,salary) values (2,'Deepa','jasmine','deepa@gmail.com','8989987878',45000);
insert into employee(employee_id,first_name,last_name,email,phone_number,salary) values (3,'kamali','jagan','jegankamali@gmail.com','8909989878',30000);
insert into employee(employee_id,first_name,last_name,email,phone_number,salary) values (4,'Abirami','Nagaraj','abi@gmail.com','9989989878',50000);

select * from employee;