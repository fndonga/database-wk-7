-- Question 1 🛠️: Achieving 1NF (First Normal Form)
-- Transform ProductDetail table so each row represents a single product per order

-- Assuming original table: ProductDetail(OrderID, CustomerName, Products)
-- Split the Products column into individual rows
-- Using a common approach in SQL (example for MySQL using JSON_TABLE or UNION ALL)
-- Here’s a simplified approach using UNION ALL:

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Now each row has only one product per order, satisfying 1NF

------------------------------------------------------------

-- Question 2 🧩: Achieving 2NF (Second Normal Form)
-- Transform OrderDetails table to remove partial dependencies
-- Separate Customer information into a Customer table
-- Keep OrderID and Product details in another table

-- Step 1: Create a Customers table
CREATE TABLE Customers (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Customers (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 2: Create an Orders table (OrderID + Product + Quantity)
CREATE TABLE Orders_2NF (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product)
);

INSERT INTO Orders_2NF (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Now, non-key columns fully depend on the entire primary key (OrderID + Product)
-- Customer information is stored separately, eliminating partial dependency
