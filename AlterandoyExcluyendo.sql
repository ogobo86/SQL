USE ventas_jugos;

SELECT * FROM tb_producto;

/* Cambiando el precio de 6.31 a 5 del producto 1000889*/ 
UPDATE tb_producto SET PRECIO_LISTA = 5 WHERE CODIGO = '1000889';

UPDATE tb_producto SET DESCRIPCION = 'Sabor de la Montaña', TAMANO = '1 Litro', ENVASE = 'Botella PET'
WHERE CODIGO = '1000889';

SELECT * FROM tb_cliente;

UPDATE tb_cliente SET VOLUMEN_COMPRA = VOLUMEN_COMPRA / 10; 

UPDATE tb_cliente SET DIRRECCION = 'Jorge Emilio 23', 
BARRIO = 'San Antonio', CIUDAD = 'Guadalajara', 
ESTADO = 'JC', CP = '44700000' 
WHERE DNI = '5840119709';

/* Actualizando datos desde otra DB */
SELECT * FROM tb_vendedor;

SELECT * FROM tb_vendedor A
INNER JOIN
jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = substring(B.MATRICULA,3,3);

/* Se realiza el cambio solicitado de la columna vacaciones */
UPDATE tb_vendedor A
INNER JOIN
jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = substring(B.MATRICULA,3,3)
SET A.DE_VACACIONES = B.VACACIONES;

/* ACTUALIZAMOS volumen de compra de cliente que están cerca de un vendedor*/
USE ventas_jugos;

SELECT A.DNI FROM tb_cliente A
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO;

UPDATE tb_cliente A 
INNER JOIN tb_vendedor B
ON (A.BARRIO = B.BARRIO) 
SET A.VOLUMEN_COMPRA = A.VOLUMEN_COMPRA * 1.30;

/* Excluyendo datos de una tabla */

INSERT INTO tb_producto (CODIGO,DESCRIPCION,SABOR,TAMANO,ENVASE,PRECIO_LISTA)
     VALUES ('1001001','Sabor Alpino','Mango','700 ml','Botella',7.50),
         ('1001000','Sabor Alpino','Melón','700 ml','Botella',7.50),
         ('1001002','Sabor Alpino','Guanábana','700 ml','Botella',7.50),
         ('1001003','Sabor Alpino','Mandarina','700 ml','Botella',7.50),
         ('1001004','Sabor Alpino','Banana','700 ml','Botella',7.50),
         ('1001005','Sabor Alpino','Asaí','700 ml','Botella',7.50),
         ('1001006','Sabor Alpino','Mango','1 Litro','Botella',7.50),
         ('1001007','Sabor Alpino','Melón','1 Litro','Botella',7.50),
         ('1001008','Sabor Alpino','Guanábana','1 Litro','Botella',7.50),
         ('1001009','Sabor Alpino','Mandarina','1 Litro','Botella',7.50),
         ('1001010','Sabor Alpino','Banana','1 Litro','Botella',7.50),
         ('1001011','Sabor Alpino','Asaí','1 Litro','Botella',7.50);

SELECT * FROM tb_producto WHERE DESCRIPCION = 'Sabor Alpino';

/* BORRAMOS DE LA TABLA EL PRODUCTO CON EL CODIGO 1001000 */
DELETE FROM tb_producto WHERE CODIGO = '1001000';

/* BORRAMOS DE LA TABLA LOS PRODUCTOS DE 1 LITRO */
DELETE FROM TB_PRODUCTO WHERE TAMANO =  '1 LITRO';


SELECT CODIGO_DEL_PRODUCTO FROM jugos_ventas.tabla_de_productos;

/* Buscamos los codigos que se encuentran en otra DB */
SELECT CODIGO FROM tb_producto
WHERE CODIGO NOT IN ( SELECT CODIGO_DEL_PRODUCTO 
FROM jugos_ventas.tabla_de_productos);

/* Eliminamos codigos que no se necesitan*/
DELETE FROM tb_producto
WHERE CODIGO NOT IN ( SELECT CODIGO_DEL_PRODUCTO 
FROM jugos_ventas.tabla_de_productos);

/* En las siguientes consultas buscamos excluir clientes que tengas menos de 18 años */
SELECT A.DNI FROM tb_cliente A 
INNER JOIN tb_vendedor B
ON A.BARRIO = B.BARRIO;

DELETE A FROM tb_factura A
INNER JOIN tb_cliente B
ON A.DNI = B.DNI WHERE B.EDAD < 18;