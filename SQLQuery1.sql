CREATE DATABASE ElectronicsMarket

GO

USE ElectronicsMarket

CREATE TABLE Brands(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(255) NOT NULL
)

CREATE TABLE Laptops(
	Id INT PRIMARY KEY IDENTITY(10,1),
	Name NVARCHAR(255) NOT NULL,
	Price INT NOT NULL,
	BrandID INT FOREIGN KEY REFERENCES Brands(Id) NOT NULL
)

CREATE TABLE Phones(
	Id INT PRIMARY KEY IDENTITY(100,1),
	Name NVARCHAR(255) NOT NULL,
	Price INT NOT NULL,
	BrandID INT FOREIGN KEY REFERENCES Brands(Id) NOT NULL
)


INSERT INTO Brands
VALUES('SAMSUNG'),
('APPLE'),
('ASUS'),
('REDMI'),
('HP'),
('DELL'),
('POCO')

--1
INSERT INTO Laptops
VALUES('MACBOOK AIR', 3500, 2),
('MACBOOK PRO', 5000, 2),
('NOTEBOOK 9 PEN', 3000, 1),
('XPS 13', 2300, 6),
('G5', 1500, 6),
('ZENBOOK 14',2650, 3),
('TUF GAMING F15', 6000, 3),
('PAVILION 14', 1500, 5)

--2
INSERT INTO Phones
VALUES('Iphone 13', 1400, 2),
('Iphone 15', 3000, 2),
('Note 9', 800, 4),
('Note 10C', 950, 4),
('Galaxy 23', 2400, 1),
('X3 Pro', 780, 7),
('Note 10 PRO', 2000, 1)

--3
SELECT 
	L.Name AS LaptopName, 
	B.Name AS BrandName, 
	L.Price AS Price
FROM Brands B
JOIN Laptops L ON B.Id = L.BrandID

--4
SELECT
	P.Name AS PhoneName,
	B.Name AS BrandName,
	P.Price AS Price
FROM Brands B
JOIN Phones P ON B.Id = P.BrandID

--5
SELECT 
	B.Name AS BrandName,
	P.Name AS PhoneName 
FROM Brands B
JOIN Phones P ON B.Id = P.BrandID

--6
SELECT 
	B.Name AS BrandName,
	L.Name AS LaptopName 
FROM Brands B
JOIN Laptops L ON B.Id = L.BrandID

--7
SELECT * FROM Laptops
WHERE Laptops.Price >= 2000 AND Laptops.Price < 5000 OR Laptops.Price > 5000

--8
SELECT * FROM Phones
WHERE Phones.Price >= 1000 AND Phones.Price < 1500 OR Phones.Price > 1500

--9
SELECT
    B.Name AS BrandName,
    COUNT(L.Id) AS NumberOfLaptops
FROM
    Brands B
JOIN Laptops L ON B.Id = L.BrandID
GROUP BY B.Name;

--10
SELECT
	B.Name AS BrandName,
	COUNT(P.Id) AS NumberOfPhones
FROM Brands B
JOIN Phones P ON B.Id = P.BrandID
GROUP BY B.Name

--11
SELECT
	B.Name AS BrandName,
    B.Id AS BrandId
FROM Brands B
JOIN Laptops L ON B.Id = L.BrandID
JOIN Phones P ON B.Id = P.BrandID

--12
SELECT
	P.Id AS PhoneId,
	P.Name AS PhoneName,
	P.Price AS PhonePrice,
	L.Id AS LaptopId,
	L.Name AS LaptoptName,
	L.Price AS LaptopPrice,
    B.Name AS BrandName
FROM Brands B
FULL JOIN Laptops L ON B.Id = L.BrandID
FULL JOIN Phones P ON B.Id = P.BrandID

--13
SELECT
	P.Id AS PhoneId,
	P.Name AS PhoneName,
	P.Price AS PhonePrice,
	L.Id AS LaptopId,
	L.Name AS LaptoptName,
	L.Price AS LaptopPrice,
    B.Id
FROM Brands B
FULL JOIN Laptops L ON B.Id = L.BrandID
FULL JOIN Phones P ON B.Id = P.BrandID


