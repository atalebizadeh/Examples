DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
	customer_id int,
	LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255)
);
INSERT INTO customers (customer_id, LastName, FirstName, Address)
VALUES 
	(100, 'Talebizadeh', 'Alireza', 'Eaglecreek'),
	(101, 'Zeinali', 'Maral', 'Eaglecreek'),
	(102, 'Afshar', 'Bahram', 'Research BLVD');