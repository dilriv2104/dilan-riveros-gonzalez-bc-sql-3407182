INSERT INTO bikes (brand, model, year, status)
VALUES ('BMW', 'G310R', 2024, 'available');

-- =====================================================
-- CONSULTA 1: INNER JOIN principal
-- =====================================================

SELECT
r.id AS rental_id,
b.brand,
b.model,
r.start_date,
r.end_date,
r.total_price
FROM rentals r
INNER JOIN bikes b
ON r.bike_id = b.id;

-- =====================================================
-- CONSULTA 2: JOIN con tres tablas
-- =====================================================

SELECT
r.id AS rental_id,
c.name AS customer_name,
b.brand,
b.model,
r.start_date,
r.end_date,
r.total_price
FROM rentals r
INNER JOIN customers c
ON r.customer_id = c.id
INNER JOIN bikes b
ON r.bike_id = b.id;

-- =====================================================
-- CONSULTA 3: LEFT JOIN
-- =====================================================

SELECT
b.id,
b.brand,
b.model,
r.id AS rental_id
FROM bikes b
LEFT JOIN rentals r
ON b.id = r.bike_id;

-- =====================================================
-- CONSULTA 4: Detectar huérfanos
-- =====================================================

SELECT
b.id,
b.brand,
b.model
FROM bikes b
LEFT JOIN rentals r
ON b.id = r.bike_id
WHERE r.id IS NULL;

-- =====================================================
-- CONSULTA 5: 
-- =====================================================

SELECT
b.id,
b.brand,
b.model,
COUNT(r.id) AS total_rentals
FROM bikes b
LEFT JOIN rentals r
ON b.id = r.bike_id
GROUP BY
b.id,
b.brand,
b.model
ORDER BY total_rentals DESC;
