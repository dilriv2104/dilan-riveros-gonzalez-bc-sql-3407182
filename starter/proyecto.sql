-- COUNT
-- Total de productos registrados
SELECT COUNT(*) AS total_productos
FROM productos;


-- SUM + AVG
-- Suma total y promedio de precios
SELECT 
    SUM(precio) AS suma_precios,
    AVG(precio) AS promedio_precios
FROM productos;

-- GROUP BY
-- Cantidad de productos y promedio de precio
-- agrupados por categoría
SELECT 
    categoria,
    COUNT(*) AS cantidad_productos,
    AVG(precio) AS promedio_precio
FROM productos
GROUP BY categoria;



-- HAVING
-- Categorías con más de 3 productos registrados


SELECT 
    categoria,
    COUNT(*) AS total_productos,
    SUM(stock) AS stock_total
FROM productos
GROUP BY categoria
HAVING COUNT(*) > 3;