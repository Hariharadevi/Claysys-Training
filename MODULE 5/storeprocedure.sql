CREATE TABLE signup (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    phone_number VARCHAR(15),
);

CREATE PROCEDURE sp_create_user
    @p_username VARCHAR(50),
    @p_email VARCHAR(100),
    @p_password VARCHAR(255),
    @p_first_name VARCHAR(50),
    @p_last_name VARCHAR(50),
    @p_phone_number VARCHAR(15)
AS
BEGIN
    INSERT INTO sign_up (username, email, password, first_name, last_name, phone_number)
    VALUES (@p_username, @p_email, @p_password, @p_first_name, @p_last_name, @p_phone_number);
END;

CREATE PROCEDURE sp_get_user
    @p_user_id INT
AS
BEGIN
    SELECT * FROM sign_up WHERE user_id = @p_user_id;
END;


CREATE PROCEDURE sp_update_user
    @p_user_id INT,
    @p_username VARCHAR(50),
    @p_email VARCHAR(100),
    @p_password VARCHAR(255),
    @p_first_name VARCHAR(50),
    @p_last_name VARCHAR(50),
    @p_phone_number VARCHAR(15)
AS
BEGIN
    UPDATE sign_up
    SET username = @p_username,
        email = @p_email,
        password = @p_password,
        first_name = @p_first_name,
        last_name = @p_last_name,
        phone_number = @p_phone_number
    WHERE user_id = @p_user_id;
END;

CREATE PROCEDURE sp_delete_user
    @p_user_id INT
AS
BEGIN
    DELETE FROM sign_up WHERE user_id = @p_user_id;
END;

select * from signup;

insert into signup(user_id,username,email,password,first_name,last_name,phone_number) values (1,'Dharani','dhara@gmail.com','hashed_password','Dharani','Shanmugam','123-4574');

EXEC sp_get_user @p_user_id=1;