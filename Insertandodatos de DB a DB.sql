USE ventas_jugos;

INSERT INTO tb_producto (CODIGO, DESCRIPCION, SABOR, TAMANO, ENVASE, PRECIO_LISTA)
VALUES ('104017', 'Light', 'Sandía', '350 ml', 'Lata', 4.56);

/* Se confirma el ingreso del producto */
SELECT * FROM tb_producto;

INSERT INTO tb_producto (CODIGO, SABOR, DESCRIPCION, TAMANO, ENVASE,
PRECIO_LISTA) VALUES ('1040108', 'Guanábana', 'Light', '350 ml', 'Lata', 4.00);

INSERT INTO tb_producto VALUES 
('1040109', 'Light', 'Asaí', '350 ml', 'Lata', 5.60), 
('1040110', 'Light', 'Manzana', '350 ml', 'Lata', 6.00),
('1040111', 'Light', 'Mango', '350 ml', 'Lata', 3.50);

/* Podemos acceder a una DB de la siguiente forma */
USE ventas_jugos;

SELECT * FROM jugos_ventas.tabla_de_productos;

/* CON LA SIGUIENTE QUERY MUESTRA EN TABLA tabla_de_productos, de la DB jugos_ventas los cuales aun no fueron incluidos
en tb_productos de la DB ventas_jugos */

SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN ( SELECT CODIGO FROM tb_producto);

/* Usando el comando INSERT podemos incluir desde la jugos_ventas.tabla_de_productos hacia la tabla ventas_jugos.tb_productos */

INSERT INTO tb_producto
SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION, 
SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);

SELECT * FROM  tb_cliente;

/* Ahora incluimos los datos de clientes de DB jugos_ventas a DB ventas_jugos */

INSERT INTO tb_cliente
SELECT DNI, NOMBRE, DIRECCION_1 AS DICRECCION, 
BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO 
AS FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO
AS LIMITE_CREDITPO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA, 
PRIMERA_COMPRA FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);
