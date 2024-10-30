-- CREATE DATABASE invento;
-- USE invento;

-- Create Department table
CREATE TABLE Department
(
    DepartmentID INT PRIMARY KEY,
    Name         VARCHAR(100),
    Location     VARCHAR(200)
);

-- Create Role table
CREATE TABLE Role
(
    RoleID      INT PRIMARY KEY,
    RoleName    VARCHAR(100),
    Description TEXT
);

-- Create Employee table
CREATE TABLE Employee
(
    EmployeeID   INT PRIMARY KEY,
    RoleID       INT,
    DepartmentID INT,
    Name         VARCHAR(100),
    Address      VARCHAR(200),
    Phone        VARCHAR(20),
    Email        VARCHAR(100),
    Password     VARCHAR(100),
    Position     VARCHAR(100),
    Salary       DECIMAL(10, 2),
    FOREIGN KEY (RoleID) REFERENCES Role (RoleID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (DepartmentID) REFERENCES Department (DepartmentID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Create Shift table
CREATE TABLE Shift
(
    ShiftID    INT PRIMARY KEY,
    EmployeeID INT,
    ShiftDate  DATE,
    StartTime  TIME,
    EndTime    TIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Create Supplier table
CREATE TABLE Supplier
(
    SupplierID INT PRIMARY KEY,
    Name       VARCHAR(100),
    Phone      VARCHAR(20),
    Email      VARCHAR(100),
    Address    VARCHAR(200)
);

-- Create Product table
CREATE TABLE Product
(
    ProductID       INT PRIMARY KEY,
    Name            VARCHAR(100),
    Category        VARCHAR(50),
    Brand           VARCHAR(100),
    Price           DECIMAL(10, 2),
    QuantityInStock INT
);

-- Create Inventory table
CREATE TABLE Inventory
(
    InventoryID       INT PRIMARY KEY,
    ProductID         INT,
    QuantityAvailable INT,
    Location          VARCHAR(100),
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Create Purchase table
CREATE TABLE Purchase
(
    PurchaseID   INT PRIMARY KEY,
    InventoryID  INT,
    SupplierID   INT,
    EmployeeID   INT,
    PurchaseDate DATE,
    TotalCost    DECIMAL(10, 2),
    FOREIGN KEY (InventoryID) REFERENCES Inventory (InventoryID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (SupplierID) REFERENCES Supplier (SupplierID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Create Warranty table
CREATE TABLE Warranty
(
    WarrantyID      INT PRIMARY KEY,
    ProductID       INT,
    WarrantyPeriod  INT,
    CoverageDetails TEXT,
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Create Customer table
CREATE TABLE Customer
(
    CustomerID INT PRIMARY KEY,
    Name       VARCHAR(100),
    Phone      VARCHAR(20),
    Email      VARCHAR(100),
    Address    VARCHAR(200)
);

-- Create Order table
CREATE TABLE Orders
(
    OrderID     INT PRIMARY KEY,
    CustomerID  INT,
    OrderDate   DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Create OrderDetail table
CREATE TABLE OrderDetail
(
    OrderDetailID INT PRIMARY KEY,
    OrderID       INT,
    ProductID     INT,
    Quantity      INT,
    Price         DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Create Invoice table
CREATE TABLE Invoice
(
    InvoiceID   INT PRIMARY KEY,
    OrderID     INT,
    InvoiceDate DATE,
    AmountDue   DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders (OrderID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Create Service table
CREATE TABLE Service
(
    ServiceID          INT PRIMARY KEY,
    EmployeeID         INT,
    ProductID          INT,
    ServiceDate        DATE,
    ServiceDescription TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee (EmployeeID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    FOREIGN KEY (ProductID) REFERENCES Product (ProductID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Create Payment table
CREATE TABLE Payment
(
    PaymentID     INT PRIMARY KEY,
    CustomerID    INT,
    PaymentDate   DATE,
    AmountPaid    DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer (CustomerID)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);