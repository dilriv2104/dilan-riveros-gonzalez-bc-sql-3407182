CREATE TABLE bikes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand TEXT NOT NULL,
    model TEXT NOT NULL,
    year INTEGER,
    status TEXT
);

CREATE TABLE customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT,
    phone TEXT
);

CREATE TABLE rentals (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    bike_id INTEGER,
    customer_id INTEGER,
    start_date TEXT,
    end_date TEXT,
    total_price REAL,
    FOREIGN KEY (bike_id) REFERENCES bikes(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);
INSERT INTO bikes (brand, model, year, status) VALUES
('Yamaha', 'R15', 2022, 'available'),
('Honda', 'CBR150R', 2021, 'rented'),
('Suzuki', 'Gixxer', 2020, 'available'),
('Kawasaki', 'Ninja 400', 2023, 'maintenance'),
('TVS', 'Apache RTR 200', 2022, 'available');

INSERT INTO customers (name, email, phone) VALUES
('Juan Perez', 'juan@gmail.com', '3001234567'),
('Maria Lopez', 'maria@gmail.com', '3012345678'),
('Carlos Gomez', 'carlos@gmail.com', '3023456789'),
('Ana Torres', 'ana@gmail.com', '3034567890'),
('Luis Ramirez', 'luis@gmail.com', '3045678901');

INSERT INTO rentals (bike_id, customer_id, start_date, end_date, total_price) VALUES
(1, 1, '2026-04-01', '2026-04-02', 50),
(2, 2, '2026-04-02', '2026-04-04', 120),
(3, 3, '2026-04-03', '2026-04-05', 100),
(4, 4, '2026-04-04', '2026-04-06', 150),
(5, 5, '2026-04-05', '2026-04-07', 130),

(1, 2, '2026-04-06', '2026-04-07', 60),
(2, 3, '2026-04-07', '2026-04-09', 140),
(3, 4, '2026-04-08', '2026-04-10', 110),
(4, 5, '2026-04-09', '2026-04-11', 160),
(5, 1, '2026-04-10', '2026-04-12', 120),

(1, 3, '2026-04-11', '2026-04-13', 90),
(2, 4, '2026-04-12', '2026-04-14', 150),
(3, 5, '2026-04-13', '2026-04-15', 100),
(4, 1, '2026-04-14', '2026-04-16', 170),
(5, 2, '2026-04-15', '2026-04-17', 130);