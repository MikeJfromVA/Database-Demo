DROP TABLE IF EXISTS PizzaHasTopping CASCADE;
DROP TABLE IF EXISTS Pizza CASCADE;
DROP TABLE IF EXISTS Topping CASCADE;
DROP TABLE IF EXISTS Filling CASCADE;
DROP SCHEMA IF EXISTS Customers CASCADE;

CREATE SCHEMA Customers;

CREATE TABLE Pizza (
    name text primary key,
    price numeric(4,2) check (price > 0)
);

CREATE TABLE Topping (
    name text PRIMARY KEY
);

CREATE TABLE PizzaHasTopping (
    pizzaName text,
    toppingName text,
    CONSTRAINT pk PRIMARY KEY (pizzaName, toppingName), 
    CONSTRAINT fk1 FOREIGN KEY (pizzaName) REFERENCES Pizza(name)
    	on delete cascade on update cascade, 
    CONSTRAINT fk2 FOREIGN KEY (toppingName) REFERENCES Topping(name) 
);

CREATE TABLE Customers.Customer (
    firstName text,
    lastName text,
    favoritePizza text,
    CONSTRAINT fk FOREIGN KEY (favoritePizza) REFERENCES Pizza(name),
    CONSTRAINT pk PRIMARY KEY (firstName, lastName)
    );
    
INSERT INTO Pizza(name, price) VALUES 
    ('Deluxe', 13.99),
    ('Veggie', 10.99),
    ('Meatza', 15.99)
;

INSERT INTO Topping(name) VALUES 
    ('Pepperoni'),
    ('Green Pepper'),
    ('Sausage'),
    ('Onion')
;

INSERT INTO PizzaHasTopping(pizzaName, toppingName) VALUES
	('Deluxe','Pepperoni'),
	('Deluxe','Green Pepper'),
	('Meatza','Pepperoni'),
	('Meatza','Sausage'),
	('Veggie','Green Pepper'),
	('Veggie','Onion')
;

SELECT Pizza.name, Pizza.price
FROM Pizza
WHERE Pizza.price > 11.00
ORDER BY Pizza.price DESC
;

CREATE VIEW PriceyPizzas
AS
SELECT Pizza.name, Pizza.price
FROM Pizza
WHERE Pizza.price > 11.00
ORDER BY Pizza.price DESC
;

SELECT * FROM PriceyPizzas;

-- Expanding to Calzone
CREATE TABLE Filling (
    name text PRIMARY KEY
);

INSERT INTO Filling(name) 
SELECT name FROM Topping
;

SELECT * FROM Filling;

UPDATE Pizza
SET name = 'Big N Meaty'
WHERE name = 'Meatza'
;

DELETE FROM PizzaHasTopping
WHERE toppingName = 'Green Pepper'
AND pizzaName = 'Deluxe'
;

INSERT INTO PizzaHasTopping VALUES
('Deluxe','Onion')
;

SELECT * FROM PizzaHasTopping;

ALTER TABLE Topping
ADD COLUMN vegetarian bool DEFAULT false
;

UPDATE Topping
SET vegetarian = true
WHERE name = 'Green Pepper'
OR name = 'Onion'
;

SELECT * FROM Topping;


