PRAGMA foreign_keys = ON;

-- =========================
-- TABLA MOTOS
-- =========================
CREATE TABLE bikes (
id INTEGER PRIMARY KEY AUTOINCREMENT,
brand TEXT NOT NULL,
model TEXT NOT NULL,
year INTEGER CHECK(year >= 2000),
status TEXT NOT NULL CHECK(status IN ('available', 'rented', 'maintenance'))
);

-- =========================
-- TABLA CLIENTES
-- =========================
CREATE TABLE customers (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT NOT NULL,
email TEXT UNIQUE,
phone TEXT
);

-- =========================
-- TABLA ALQUILERES
-- =========================
CREATE TABLE rentals (
id INTEGER PRIMARY KEY AUTOINCREMENT,
bike_id INTEGER NOT NULL,
customer_id INTEGER NOT NULL,
start_date TEXT NOT NULL,
end_date TEXT,
total_price REAL NOT NULL CHECK(total_price > 0),

```
FOREIGN KEY (bike_id) REFERENCES bikes(id),
FOREIGN KEY (customer_id) REFERENCES customers(id)
```

);

-- =========================
-- DATOS DE PRUEBA
-- =========================

INSERT INTO bikes (brand, model, year, status) VALUES
('Yamaha', 'R15', 2022, 'available'),
('Honda', 'CBR150R', 2021, 'rented'),
('Suzuki', 'Gixxer', 2020, 'available'),
('Kawasaki', 'Ninja 400', 2023, 'maintenance'),
('TVS', 'Apache RTR 200', 2022, 'available');

INSERT INTO customers (name, email, phone) VALUES
('Juan Perez', '[juan@gmail.com](mailto:juan@gmail.com)', '3001234567'),
('Maria Lopez', '[maria@gmail.com](mailto:maria@gmail.com)', '3012345678'),
('Carlos Gomez', '[carlos@gmail.com](mailto:carlos@gmail.com)', '3023456789'),
('Ana Torres', '[ana@gmail.com](mailto:ana@gmail.com)', '3034567890'),
('Luis Ramirez', NULL, '3045678901');

INSERT INTO rentals (bike_id, customer_id, start_date, end_date, total_price) VALUES
(1, 1, '2026-04-01', '2026-04-02', 50),
(2, 2, '2026-04-02', '2026-04-04', 120),
(3, 3, '2026-04-03', NULL, 100),
(4, 4, '2026-04-04', '2026-04-06', 150),
(5, 5, '2026-04-05', NULL, 130);

-- =========================
-- CONSULTA CON IS NULL
-- =========================

SELECT *
FROM rentals
WHERE end_date IS NULL;

-- =========================
-- CONSULTA CON COALESCE
-- =========================

SELECT
name,
COALESCE(email, 'No email registered') AS email
FROM customers;
