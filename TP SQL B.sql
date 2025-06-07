CREATE TABLE CLIENTES (
codigo_cliente INT NOT NULL,
nombre VARCHAR(50) NOT NULL,
domicilio VARCHAR(100),
provincia VARCHAR(30),
PRIMARY KEY (codigo_cliente));

CREATE TABLE PRODUCTOS (
codigo_producto INT NOT NULL,
nombre_producto VARCHAR(50) NOT NULL,
PRIMARY KEY (codigo_producto));

CREATE TABLE VENTAS (
numero_factura INT NOT NULL AUTO_INCREMENT,
codigo_cliente INT NOT NULL,
fecha DATE NOT NULL,
PRIMARY KEY (numero_factura),
FOREIGN KEY (codigo_cliente) REFERENCES CLIENTES(codigo_cliente));

CREATE TABLE ITEM_VENTAS (
numero_factura INT NOT NULL,
codigo_producto INT NOT NULL,
cantidad INT NOT NULL CHECK (cantidad > 0),
precio int,
PRIMARY KEY (numero_factura, codigo_producto),
FOREIGN KEY (numero_factura) REFERENCES VENTAS(numero_factura),
FOREIGN KEY (codigo_producto) REFERENCES PRODUCTOS(codigo_producto));


--B--

1. 

SELECT MAX(cantidad) AS Total
FROM item_ventas

2.

SELECT SUM(cantidad) AS Total_Vendido
FROM item_ventas
WHERE codigo_producto = 'c'

3.

SELECT pro.codigo_producto, pro.nombre_producto, SUM(iv.cantidad) AS Total_Vendido 
FROM item_ventas iv, productos pro
WHERE iv.codigo_producto = pro.codigo_producto
ORDER BY Total_Vendido DESC

4.

SELECT pro.codigo_producto, pro.nombre_producto, SUM(iv.cantidad) AS Total_Vendido
FROM productos pro, item_ventas iv
WHERE pro.codigo_producto = iv.codigo_producto
HAVING SUM(iv.cantidad)>30
ORDER BY pro.nombre_producto ASC

5.

SELECT c.codigo_cliente,c.nombre, COUNT(v.numero_factura) AS cantidad_ventas
FROM clientes c, ventas v
WHERE c.codigo_cliente = v.codigo_cliente
GROUP BY c.codigo_cliente, c.nombre
ORDER BY cantidad_ventas DESC

6.

SELECT iv.codigo_producto, AVG (iv.cantidad) AS promedio
FROM item_ventas iv, ventas v
WHERE iv.numero_factura = v.numero_factura
AND v.codigo_cliente = 1
GROUP BY iv.codigo_producto
