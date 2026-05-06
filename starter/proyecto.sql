PRAGMA foreign_keys = ON;

-- LIMPIAR
DROP TABLE IF EXISTS rentals;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS bikes;



CREATE TABLE bikes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand TEXT NOT NULL,
    model TEXT NOT NULL,
    year INTEGER,
    status TEXT DEFAULT 'available'
);

CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone TEXT UNIQUE
);

CREATE TABLE rentals (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    bike_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL,
    total_price REAL NOT NULL CHECK (total_price > 0),
    FOREIGN KEY (bike_id) REFERENCES bikes(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO rentals (bike_id, customer_id, start_date, end_date, total_price) VALUES
(1,1,'2026-04-01','2026-04-02',50),
(2,2,'2026-04-02','2026-04-04',120),
(3,3,'2026-04-03','2026-04-05',100),
(4,4,'2026-04-04','2026-04-06',150),
(5,5,'2026-04-05','2026-04-07',130),

(1,2,'2026-04-06','2026-04-07',60),
(2,3,'2026-04-07','2026-04-09',140),
(3,4,'2026-04-08','2026-04-10',110),
(4,5,'2026-04-09','2026-04-11',160),
(5,1,'2026-04-10','2026-04-12',120),

(1,3,'2026-04-11','2026-04-13',90),
(2,4,'2026-04-12','2026-04-14',150),
(3,5,'2026-04-13','2026-04-15',100),
(4,1,'2026-04-14','2026-04-16',170),
(5,2,'2026-04-15','2026-04-17',130),

(6,1,'2026-04-16','2026-04-17',80),
(7,2,'2026-04-17','2026-04-18',90),
(8,3,'2026-04-18','2026-04-19',110),
(9,4,'2026-04-19','2026-04-20',130),
(10,5,'2026-04-20','2026-04-21',150),

(6,2,'2026-04-21','2026-04-22',85),
(7,3,'2026-04-22','2026-04-23',95),
(8,4,'2026-04-23','2026-04-24',115),
(9,5,'2026-04-24','2026-04-25',135),
(10,1,'2026-04-25','2026-04-26',155),

(6,3,'2026-04-26','2026-04-27',88),
(7,4,'2026-04-27','2026-04-28',98),
(8,5,'2026-04-28','2026-04-29',118),
(9,1,'2026-04-29','2026-04-30',138),
(10,2,'2026-04-30','2026-05-01',158);

INSERT INTO bikes (brand, model, year, status) VALUES
('Yamaha','R15',2022,'available'),
('Honda','CBR150R',2021,'rented'),
('Suzuki','Gixxer',2020,'available'),
('Kawasaki','Ninja 400',2023,'maintenance'),
('TVS','Apache RTR 200',2022,'available'),
('Yamaha','MT-03',2021,'available'),
('Honda','CB190R',2020,'available'),
('Suzuki','GSX150',2022,'available'),
('Kawasaki','Z400',2023,'available'),
('Bajaj','Pulsar 200',2021,'available'),
('KTM','RC 200',2022,'available'),
('AKT','NKD 125',2020,'available'),
('Hero','Hunk 150',2021,'available'),
('BMW','G310R',2023,'available'),
('Ducati','Monster 797',2022,'available');


INSERT INTO customers (name, email, phone) VALUES
('Juan Perez','juan1@gmail.com','3001'),
('Maria Lopez','maria2@gmail.com','3002'),
('Carlos Gomez','carlos3@gmail.com','3003'),
('Ana Torres','ana4@gmail.com','3004'),
('Luis Ramirez','luis5@gmail.com','3005'),
('Pedro Ruiz','pedro6@gmail.com','3006'),
('Laura Diaz','laura7@gmail.com','3007'),
('Sofia Rojas','sofia8@gmail.com','3008'),
('Diego Castro','diego9@gmail.com','3009'),
('Camila Ortiz','camila10@gmail.com','3010'),
('Andres Mora','andres11@gmail.com','3011'),
('Valentina Cruz','valen12@gmail.com','3012'),
('Jorge Silva','jorge13@gmail.com','3013'),
('Paula Vega','paula14@gmail.com','3014'),
('Mateo Rios','mateo15@gmail.com','3015');


UPDATE bikes
SET status = 'rented'
WHERE id = 1;

UPDATE customers
SET phone = '999999'
WHERE id = 1;


UPDATE rentals
SET total_price = total_price + 20
WHERE total_price < 120;

SELECT id, brand, model, year, status
FROM bikes;


SELECT 
    c.name AS cliente,
    r.total_price AS precio,
    r.start_date AS fecha_inicio
FROM customers c
JOIN rentals r ON c.id = r.customer_id;


SELECT 
    b.brand AS marca,
    b.model AS modelo,
    r.total_price AS precio_alquiler
FROM bikes b
JOIN rentals r ON b.id = r.bike_id;


SELECT 
    c.name AS cliente,
    b.model AS moto,
    r.start_date AS inicio,
    r.end_date AS fin
FROM rentals r
JOIN customers c ON r.customer_id = c.id
JOIN bikes b ON r.bike_id = b.id;

SELECT id, total_price
FROM rentals
WHERE total_price > 120;


SELECT id, brand, status
FROM bikes
WHERE status = 'available';


SELECT id, total_price
FROM rentals
ORDER BY total_price DESC;


SELECT id, start_date
FROM rentals
ORDER BY start_date ASC;


SELECT id, total_price
FROM rentals
ORDER BY id
LIMIT 10 OFFSET 0;


SELECT id, total_price
FROM rentals
ORDER BY id
LIMIT 10 OFFSET 10;
