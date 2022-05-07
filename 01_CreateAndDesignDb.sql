CREATE DATABASE IF NOT EXISTS Restaurant;
USE Restaurant;
-- create roles----------------
CREATE TABLE Roles (
    Id INT AUTO_INCREMENT,
    RoleType VARCHAR(30) NOT NULL,
    IsDeleted BIT NOT NULL DEFAULT 0,
    CreateDate DATETIME,
    UpdateDate DATETIME,
    PRIMARY KEY (Id)
);
-- create users--------------------
CREATE TABLE Users (
    Id INT AUTO_INCREMENT,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Email VARCHAR(30),
    `Role` INT,
    IsDeleted BIT NOT NULL DEFAULT 0,
    CreateDate DATETIME,
    UpdateDate DATETIME,
    PRIMARY KEY (Id),
    FOREIGN KEY (`Role`)
        REFERENCES Roles (Id)
);
-- create tables--------------------
CREATE TABLE Tables (
    Id INT NOT NULL AUTO_INCREMENT,
    Capacity INT NOT NULL,
    IsDeleted BIT NOT NULL DEFAULT 0,
    CreateDate DATETIME,
    UpdateDate DATETIME,
    CreatedBy INT,
    UpdatedBy INT,
    PRIMARY KEY (Id),
    FOREIGN KEY (CreatedBy)
        REFERENCES Users (Id),
    FOREIGN KEY (UpdatedBy)
        REFERENCES Users (Id)
);
-- create ProductCategories
CREATE TABLE ProductCategories (
    Id INT AUTO_INCREMENT,
    `Name` VARCHAR(30) NOT NULL,
    IsDeleted BIT NOT NULL DEFAULT 0,
    CreateDate DATETIME,
    UpdateDate DATETIME,
    CreatedBy INT,
    UpdatedBy INT,
    PRIMARY KEY (Id),
    FOREIGN KEY (CreatedBy)
        REFERENCES Users (Id),
    FOREIGN KEY (UpdatedBy)
        REFERENCES Users (Id)
);
-- create ProductTypes
CREATE TABLE CategoryTypes (
    Id INT AUTO_INCREMENT,
    `MainCategory` INT REFERENCES ProductCategories (Id),
    `Name` VARCHAR(30) NOT NULL,
    IsDeleted BIT NOT NULL DEFAULT 0,
    CreateDate DATETIME,
    UpdateDate DATETIME,
    CreatedBy INT,
    UpdatedBy INT,
    PRIMARY KEY (Id),
    FOREIGN KEY (CreatedBy)
        REFERENCES Users (Id),
    FOREIGN KEY (UpdatedBy)
        REFERENCES Users (Id)
);
-- create products
CREATE TABLE Products (
    Id INT AUTO_INCREMENT,
    `Name` VARCHAR(40) NOT NULL,
    Category INT REFERENCES ProductCategories (Id),
    `Type` INT REFERENCES CategoryTypes (Id),
    ImagePath BLOB,
    Price DECIMAL NOT NULL,
    CHECK (Price > 0),
    IsDeleted BIT NOT NULL DEFAULT 0,
    CreateDate DATETIME,
    UpdateDate DATETIME,
    CreatedBy INT,
    UpdatedBy INT,
    PRIMARY KEY (Id),
    FOREIGN KEY (CreatedBy)
        REFERENCES Users (Id),
    FOREIGN KEY (UpdatedBy)
        REFERENCES Users (Id)
);
-- create statusCodes
CREATE TABLE OrderStatuses (
    Id INT AUTO_INCREMENT,
    `Name` VARCHAR(15) NOT NULL,
    IsDeleted BIT NOT NULL DEFAULT 0,
    CreateDate DATETIME,
    UpdateDate DATETIME,
    CreatedBy INT,
    UpdatedBy INT,
    PRIMARY KEY (Id),
    FOREIGN KEY (CreatedBy)
        REFERENCES Users (Id),
    FOREIGN KEY (UpdatedBy)
        REFERENCES Users (Id)
);
-- create orders
CREATE TABLE Orders (
    Id INT AUTO_INCREMENT,
    Waiter INT REFERENCES Users (Id),
    `Table` INT REFERENCES `Tables` (Id),
    `Status` INT REFERENCES OrderStatuses (ID),
    IsDeleted BIT NOT NULL DEFAULT 0,
    CreateDate DATETIME,
    EndDate DATETIME,
    CreatedBy INT,
    UpdatedBy INT,
    PRIMARY KEY (Id),
    FOREIGN KEY (CreatedBy)
        REFERENCES Users (Id),
    FOREIGN KEY (UpdatedBy)
        REFERENCES Users (Id)
);
-- create ordersProducts
CREATE TABLE OrdersProducts (
    OrderId INT REFERENCES Orders (Id),
    ProductId INT REFERENCES Products (Id),
    ProductPrice DECIMAL,
    ProductQuantity INT NOT NULL,
    IsDeleted BIT NOT NULL DEFAULT 0,
    CreateDate DATETIME,
    UpdateDate DATETIME,
    CreatedBy INT,
    UpdatedBy INT,
	FOREIGN KEY (CreatedBy)
        REFERENCES Users (Id),
    FOREIGN KEY (UpdatedBy)
        REFERENCES Users (Id),
    CONSTRAINT PK_OrdersProducts PRIMARY KEY (OrderId , ProductId)
);