CREATE DATABASE IF NOT EXISTS hw27_1_butorina;
USE hw27_1_butorina;

CREATE TABLE car_brands (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL
);

CREATE TABLE car_models (
    id INT PRIMARY KEY AUTO_INCREMENT,
    carBrandId INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    FOREIGN KEY (carBrandId) REFERENCES car_brands(id)
);

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE cars (
    id INT PRIMARY KEY AUTO_INCREMENT,
    userId INT NOT NULL,
    carBrandId INT NOT NULL,
    carModelId INT NOT NULL,
    mileage INT NOT NULL,
    initialMilleage INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (carBrandId) REFERENCES car_brands(id),
    FOREIGN KEY (carModelId) REFERENCES car_models(id)
);

INSERT INTO car_brands (title) VALUES 
('Audi'), 
('BMW'), 
('Ford'), 
('Porche'), 
('Fiat');

INSERT INTO car_models (carBrandId, title) VALUES 
(1, 'TT'), (1, 'R8'), (1, 'Q7'), (1, 'A6'), (1, 'A8'), 
(2, '3'), (2, '5'), (2, 'X5'), (2, 'X6'), (2, 'Z3'), 
(3, 'Fiesta'), (3, 'Focus'), (3, 'Fusion'), (3, 'Mondeo'), (3, 'Sierra'), 
(4, '911'), (4, 'Cayenne'), (4, 'Panamera'), 
(5, 'Palio'), (5, 'Ducato'), (5, 'Panda'), (5, 'Punto'), (5, 'Scudo');

INSERT INTO users (firstName, lastName, email, password) VALUES 
('Taras', 'Shevchenko', 'taras@example.com', 'password123'),
('Lesya', 'Ukrainka', 'lesya@example.com', 'password123'),
('Ivan', 'Franko', 'ivan@example.com', 'password123'),
('Pavlo', 'Tychyna', 'pavlo@example.com', 'password123'),
('Vasyl', 'Symonenko', 'vasyl@example.com', 'password123');

INSERT INTO cars (userId, carBrandId, carModelId, mileage, initialMilleage) VALUES 
(1, 1, 1, 20000, 10000), -- Taras Shevchenko, Audi TT
(2, 2, 9, 15000, 5000),  -- Lesya Ukrainka, BMW X6
(3, 3, 13, 30000, 20000), -- Ivan Franko, Ford Fusion
(4, 4, 18, 10000, 0),    -- Pavlo Tychyna, Porche Panamera
(5, 5, 22, 50000, 25000); -- Vasyl Symonenko, Fiat Punto

SELECT * FROM car_brands;
SELECT * FROM car_models;
SELECT * FROM users;
SELECT * FROM cars;