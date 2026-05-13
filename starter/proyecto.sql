SELECT COUNT(*) AS total_productos
FROM productos;



SELECT 
    SUM(precio) AS suma_precios,
    AVG(precio) AS promedio_precios
FROM productos;

SELECT 
    categoria,
    COUNT(*) AS cantidad_productos,
    AVG(precio) AS promedio_precio
FROM productos
GROUP BY categoria;

SELECT 
    categoria,
    COUNT(*) AS total_productos,
    SUM(stock) AS stock_total
FROM productos
GROUP BY categoria
HAVING COUNT(*) > 3;