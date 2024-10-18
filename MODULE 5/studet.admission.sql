CREATE TABLE students (
    student_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    enrollment_date DATETIME DEFAULT GETDATE()
);

CREATE PROCEDURE sp_manages_students
    @operation VARCHAR(10), -- 'CREATE', 'READ', 'UPDATE', 'DELETE'
    @student_id INT = NULL,  -- ID of the student for READ, UPDATE, DELETE
    @first_name VARCHAR(50) = NULL,
    @last_name VARCHAR(50) = NULL,
    @email VARCHAR(100) = NULL,
    @phone_number VARCHAR(15) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    IF @operation = 'CREATE'
    BEGIN
        INSERT INTO students (first_name, last_name, email, phone_number)
        VALUES (@first_name, @last_name, @email, @phone_number);
    END
    ELSE IF @operation = 'READ'
    BEGIN
        SELECT * FROM students WHERE student_id = @student_id;
    END
    ELSE IF @operation = 'UPDATE'
    BEGIN
        UPDATE students
        SET first_name = @first_name,
            last_name = @last_name,
            email = @email,
            phone_number = @phone_number
        WHERE student_id = @student_id;
    END
    ELSE IF @operation = 'DELETE'
    BEGIN
        DELETE FROM students WHERE student_id = @student_id;
    END
    ELSE
    BEGIN
        RAISERROR('Invalid operation type.', 16, 1);
    END
END;

EXEC sp_manages_students 
    @operation = 'CREATE', 
    @first_name = 'Hari', 
    @last_name = 'Pranav', 
    @email = 'hari@example.com', 
    @phone_number = '755-1234';

	EXEC sp_manages_students 
    @operation = 'READ', 
    @student_id = 1; 

	EXEC sp_manages_students 
    @operation = 'UPDATE', 
    @student_id = 1, 
    @first_name = 'Johnathan', 
    @last_name = 'Doe', 
    @email = 'john.doe.updated@example.com', 
    @phone_number = '555-5678';