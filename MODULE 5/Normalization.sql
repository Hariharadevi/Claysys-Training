CREATE TABLE Orders_1NF (
    OrderID INT PRIMARY KEY,
    Product VARCHAR(100),
    Customer VARCHAR(100)
);

INSERT INTO Orders_1NF (OrderID, Product, Customer) VALUES
(1, 'Laptop', 'Janaki'),
(2, 'Smartphone', 'Jaya'),
(3, 'Tablet', 'Jayanthi');

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerAddress VARCHAR(100)
);

CREATE TABLE Orders_2NF (
    OrderID INT PRIMARY KEY,
    Product VARCHAR(100),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName, CustomerAddress) VALUES
(1, 'John Doe', '123 Main St'),
(2, 'Jane Smith', '456 Elm St');

INSERT INTO Orders_2NF (OrderID, Product, CustomerID) VALUES
(1, 'Laptop', 1),
(2, 'Smartphone', 2),
(3, 'Tablet', 2);


CREATE TABLE Orders_3NF (
    OrderID INT PRIMARY KEY,
    Product VARCHAR(100),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE CustomerDetails (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerAddress VARCHAR(100)
);

-- Insert the same data as before
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100)
);

CREATE TABLE Orders_BCNF (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
