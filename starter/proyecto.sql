PRAGMA foreign_keys = ON;

-- BIKES
CREATE TABLE IF NOT EXISTS bikes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand TEXT NOT NULL,
    model TEXT NOT NULL,
    year_bike INTEGER NOT NULL CHECK (year_bike >= 2000),
    status TEXT NOT NULL DEFAULT 'available'
        CHECK (status IN ('available', 'rented', 'maintenance'))
);

-- CUSTOMERS
CREATE TABLE IF NOT EXISTS customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone TEXT NOT NULL UNIQUE
);

-- RENTALS (tabla principal)
CREATE TABLE IF NOT EXISTS rentals (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    bike_id INTEGER NOT NULL,
    customer_id INTEGER NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL,
    total_price REAL NOT NULL CHECK (total_price > 0),
    FOREIGN KEY (bike_id) REFERENCES bikes(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    CHECK (end_date >= start_date)
);