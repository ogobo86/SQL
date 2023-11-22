-- ALGORITMO PARA GENERAR UN NUMERO ENTERO CON LA FUNCION RAND ( RAND() * ( MAX - MIN + 1) ) + MIN.

SELECT (RAND()* (250-20+1))+ 20 AS ALEATORIO;

-- El uso de  FLOOR redondea el resultado.
SELECT FLOOR(RAND()* (250-20+1))+ 20 AS ALEATORIO;

SET GLOBAL log_bin_trust_function_creators = 1;

/*  FUNCION PARA CREAR UN NUMERO ALEATORIO
CREATE FUNCTION `f_aleatorio` (min INT, max INT)
RETURNS INTEGER
BEGIN
DECLARE vresulltado INT;
SELECT FLOOR(RAND()* (max-min+1))+ min INTO vresultado;
RETURN vresultado;
END
*/

SELECT f_aleatorio(1,10) AS Resultado;

-- creamos una nueva funcion para obtener un CLIENTE de manera aleatoria

/* CREATE DEFINER=`root`@`localhost` FUNCTION `f_cliente_aleatorio`() RETURNS varchar(11) CHARSET utf8mb4
BEGIN
DECLARE vresultado VARCHAR(11);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM clientes;
SET valeatorio = f_aleatorio(1, vmax);
SET valeatorio = valeatorio -1;
SELECT DNI INTO vresultado FROM clientes LIMIT valeatorio,1;
RETURN vresultado;
END
*/

SELECT f_cliente_aleatorio() AS CLIENTE;


-- creamos una nueva funcion para obtener un PRODUCTO de manera aleatoria

/* CREATE DEFINER=`root`@`localhost` FUNCTION `f_productos_aleatorio`() RETURNS varchar(10) CHARSET utf8mb4
BEGIN
DECLARE vresultado VARCHAR(10);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM productos;
SET valeatorio = f_aleatorio(1, vmax);
SET valeatorio = valeatorio -1;
SELECT CODIGO INTO vresultado FROM productos LIMIT valeatorio,1;
RETURN vresultado;
END
*/

SELECT f_productos_aleatorio() AS PRODUCTO;

-- creamos una nueva funcion para obtener un VENDEDOR de manera aleatoria

/* CREATE DEFINER=`root`@`localhost` FUNCTION `f_vendedor_aleatorio`() RETURNS varchar(5) CHARSET utf8mb4
BEGIN
DECLARE vresultado VARCHAR(5);
DECLARE vmax INT;
DECLARE valeatorio INT;
SELECT COUNT(*) INTO vmax FROM vendedores;
SET valeatorio = f_aleatorio(1, vmax);
SET valeatorio = valeatorio -1;
SELECT MATRICULA INTO vresultado FROM vendedores LIMIT valeatorio,1;
RETURN vresultado;
END
*/

SELECT f_vendedor_aleatorio() AS VENDEDOR;