SELECT * FROM tabla_de_productos;

SELECT * FROM tabla_de_productos WHERE sabor = 'mango' AND tamano = '470 ml';

SELECT envase, tamano FROM tabla_de_productos;

SELECT DISTINCT envase, tamano FROM tabla_de_productos WHERE sabor = 'naranja';

SELECT DISTINCT barrio FROM tabla_de_clientes WHERE ciudad = 'Ciudad de México';

SELECT * FROM tabla_de_productos LIMIT 5;

SELECT * FROM tabla_de_productos LIMIT 5, 4;

SELECT * FROM facturas;

SELECT * FROM facturas WHERE fecha_venta = '2017/01/01' LIMIT 10;

SELECT * FROM tabla_de_productos ORDER BY PRECIO_DE_LISTA DESC;

SELECT * FROM items_facturas;

SELECT codigo_del_producto FROM tabla_de_productos WHERE NOMBRE_DEL_PRODUCTO = 'refrescante' AND tamano = '1 litro'
AND sabor = 'Frutilla/limón';

SELECT * FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = '1101035' ORDER BY cantidad DESC;

SELECT MAX(CANTIDAD) AS CANTIDAD_MAXIMA FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035";

SELECT COUNT(*) FROM items_facturas WHERE CODIGO_DEL_PRODUCTO = "1101035" AND CANTIDAD = 99;

SELECT envase, MAX(precio_de_lista) AS PRECIO_MAXIMO, 
MIN(precio_de_lista) AS PRECIO_MINIMO, 
SUM(precio_de_lista) AS SUMA_PRECIO 
FROM tabla_de_productos GROUP BY ENVASE
HAVING SUM(precio_de_lista) >= 80 AND MAX(precio_de_lista) >= 5;

SELECT * FROM facturas;
SELECT DNI, COUNT(*) FROM facturas WHERE YEAR (FECHA_VENTA) = 2016 GROUP BY DNI HAVING COUNT(*) > 2000;

SELECT * FROM tabla_de_productos;

SELECT nombre_del_producto, precio_de_lista, 
CASE
	WHEN precio_de_lista >= 12 THEN 'COSTOSO'
    WHEN precio_de_lista >= 5 AND precio_de_lista <=12 THEN 'Asequible'
    ELSE 'Barato'
END AS PRECIO
FROM tabla_de_productos;

SELECT envase, sabor, 
CASE
	WHEN precio_de_lista >= 12 THEN 'COSTOSO'
    WHEN precio_de_lista >= 5 AND precio_de_lista <=12 THEN 'Asequible'
    ELSE 'Barato'
END AS PRECIO, MIN(precio_de_lista) AS MINIMO
FROM tabla_de_productos
WHERE TAMANO = '700ml'
GROUP BY envase, sabor,
CASE
	WHEN precio_de_lista >= 12 THEN 'COSTOSO'
    WHEN precio_de_lista >= 5 AND precio_de_lista <=12 THEN 'Asequible'
    ELSE 'Barato'
END
ORDER BY ENVASE;


SELECT NOMBRE,
CASE 
    WHEN YEAR(fecha_de_nacimiento) < 1990 THEN 'Viejos'
    WHEN YEAR(fecha_de_nacimiento) >= 1990 
    AND YEAR(fecha_de_nacimiento) <= 1995 THEN 'Jóvenes' 
    ELSE 'Niños' 
END AS CLASIFICACION_EDAD
FROM tabla_de_clientes;

SELECT * FROM tabla_de_vendedores;

SELECT * FROM facturas;

SELeCT * FROM tabla_de_vendedores A INNER JOIN facturas b ON A.matricula = B.matricula;

SELECT A.NOMBRE, B.MATRICULA, COUNT(*) FROM tabla_de_vendedores A INNER JOIN facturas B ON A.matricula = B.matricula GROUP BY A.nombre, b.matricula;

SELECT A.nombre, b.matricula, COUNT(*) 
FROM tabla_de_vendedores A, facturas B
WHERE A.MATRICULA =  B.matricula 
GROUP BY A.nombre, B.matricula;

SELECT * FROM facturas;

SELECT * FROM items_facturas;

SELECT YEAR(FECHA_VENTA), SUM(CANTIDAD * PRECIO) AS FACTURACION
FROM facturas F 
INNER JOIN 
items_facturas IFa 
ON F.NUMERO = IFa.NUMERO
GROUP BY YEAR(FECHA_VENTA);

SELECT COUNT(*) FROM tabla_de_clientes;
SELECT DISTINCT A.DNI, A.NOMBRE, B.DNI FROM tabla_de_clientes A 
INNER JOIN
FACTURAS B 
ON A.DNI = B.DNI;

SELECT DISTINCT A.DNI, A.NOMBRE, B.DNI FROM tabla_de_clientes A 
LEFT JOIN
FACTURAS B 
ON A.DNI = B.DNI; 

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO,
tabla_de_vendedores.NOMBRE
FROM tabla_de_clientes
LEFT JOIN
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO,
tabla_de_clientes.NOMBRE, VACACIONES
FROM tabla_de_clientes
RIGHT JOIN
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;

USE jugos_ventas;

SELECT DISTINCT barrio FROM tabla_de_clientes;
SELECT DISTINCT barrio FROM tabla_de_vendedores;

SELECT DISTINCT barrio FROM tabla_de_clientes
UNION
SELECT DISTINCT barrio FROM tabla_de_vendedores;

SELECT DISTINCT barrio FROM tabla_de_clientes
UNION ALL
SELECT DISTINCT barrio FROM tabla_de_vendedores;

SELECT DISTINCT barrio, NOMBRE, "Cliente" AS tipo FROM tabla_de_clientes
UNION
SELECT DISTINCT barrio, NOMBRE, "vendedor" AS tipo FROM tabla_de_vendedores;

SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO,
tabla_de_vendedores.NOMBRE, VACACIONES
FROM tabla_de_clientes
LEFT JOIN
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO
UNION
SELECT tabla_de_clientes.NOMBRE, tabla_de_clientes.CIUDAD, tabla_de_clientes.BARRIO,
tabla_de_clientes.NOMBRE, VACACIONES
FROM tabla_de_clientes
RIGHT JOIN
tabla_de_vendedores
ON tabla_de_clientes.BARRIO = tabla_de_vendedores.BARRIO;


SELECT DISTINCT BARRIO FROM tabla_de_vendedores;

SELECT * FROM tabla_de_clientes
WHERE BARRIO IN ( "Condesa", "Contadero", "DEl Valle", "Oblatos");

SELECT * FROM tabla_de_clientes
WHERE BARRIO IN ( SELECT DISTINCT BARRIO FROM tabla_de_vendedores);

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE;

SELECT X.ENVASE, X.PRECIO_MAXIMO FROM 
(SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO_MAXIMO FROM tabla_de_productos GROUP BY ENVASE) X
WHERE X.PRECIO_MAXIMO >= 10;

SELECT DNI, COUNT(*) FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI
HAVING COUNT(*) > 2000;

SELECT X.DNI, X.CONTADOR FROM 
(SELECT DNI, COUNT(*) AS CONTADOR FROM facturas
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY DNI) X WHERE X.CONTADOR > 2000;

SELECT X.ENVASE, X. PRECIO_MAXIMO FROM
vw_envases_grandes X 
WHERE PRECIO_MAXIMO >=10;

SELECT A.NOMBRE_DEL_PRODUCTO, A.ENVASE, A.PRECIO_DE_LISTA, 
B.PRECIO_MAXIMO FROM tabla_de_productos A
INNER JOIN
vw_envases_grandes B
ON A.ENVASE = B.ENVASE;

SELECT NOMBRE, CONCAT(DIRECCION_1, ' ', BARRIO, ' ', CIUDAD, ' ', ESTADO) AS COMPLETO FROM tabla_de_clientes;

SELECT NOMBRE, TIMESTAMPDIFF(YEAR, FECHA_DE_NACIMIENTO, CURDATE()) AS    EDAD
FROM  tabla_de_clientes;


SELECT YEAR(FECHA_VENTA), FLOOR(SUM(IMPUESTO * (CANTIDAD * PRECIO))) 
AS RESULTADO
FROM facturas F
INNER JOIN items_facturas IFa ON F.NUMERO = IFa.NUMERO
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY YEAR(FECHA_VENTA);

SELECT CONCAT('El cliente ', TC.NOMBRE, ' facturó ', 
CONVERT(SUM(IFa.CANTIDAD * IFa.precio), CHAR(20))
 , ' en el año ', CONVERT(YEAR(F.FECHA_VENTA), CHAR(20))) AS FRASE FROM facturas F
INNER JOIN items_facturas IFa ON F.NUMERO = IFa.NUMERO
INNER JOIN tabla_de_clientes TC ON F.DNI = TC.DNI
WHERE YEAR(FECHA_VENTA) = 2016
GROUP BY TC.NOMBRE, YEAR(FECHA_VENTA);