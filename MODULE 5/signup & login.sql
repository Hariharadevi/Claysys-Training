CREATE TABLE sign_up (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    phone_number VARCHAR(15)
);

select * from sign_up;

CREATE TABLE login (
    login_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    ip_address VARCHAR(45),
    FOREIGN KEY (user_id) REFERENCES sign_up(user_id)
);

select * from login;

INSERT INTO sign_up (user_id,username,email,password, first_name, last_name, phone_number)
VALUES (1,'john_doe', 'john.doe@example.com','hashed_password','Deepa', 'Jasmine', '555-1234');

select * from sign_up;

INSERT INTO login (login_id,user_id, ip_address)
VALUES (1,1, '192.168.1.1');

INSERT INTO sign_up (user_id,username,email,password, first_name, last_name, phone_number)
VALUES (2,'Uma_Rani', 'uma@example.com','hashed_password','Uma', 'Rani', '558-1234');
INSERT INTO sign_up (user_id,username,email,password, first_name, last_name, phone_number)
VALUES (3,'nithya_sri', 'nithya@example.com','hashed_password','Nithya', 'Sri', '555-1034');

update sign_up
set phone_number='555-9876'
where user_id=1;

select * from sign_up;

select * from sign_up
where username='Uma_Rani';

select * from login
where user_id=1;

delete from sign_up
where user_id=3;

select * from sign_up;