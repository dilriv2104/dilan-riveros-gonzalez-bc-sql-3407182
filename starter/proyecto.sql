
SELECT 
    id_producto,
    nombre,
    precio
FROM productos
WHERE precio BETWEEN 50000 AND 200000;


SELECT 
    nombre,
    categoria
FROM productos
WHERE categoria IN ('Tecnología', 'Oficina', 'Accesorios');


SELECT 
    id_producto,
    nombre
FROM productos
WHERE nombre LIKE '%mouse%';


SELECT 
    nombre,
    categoria,
    precio,
    stock
FROM productos
WHERE precio BETWEEN 30000 AND 500000
AND categoria IN ('Tecnología', 'Gaming')
AND nombre LIKE '%pro%';