CREATE TABLE documentos
(cod_documento INT NOT NULL,
descripcion VARCHAR(100) NOT NULL,
PRIMARY KEY (cod_documento));

CREATE TABLE oficinas (
cod_oficina INT NOT NULL,
codigo_director INT,
descripcion VARCHAR(100) NOT NULL,
PRIMARY KEY (cod_oficina));

CREATE TABLE empleados 
(cod_empleado INT,
apellido VARCHAR(20),
nombre VARCHAR(20),
fecha_nacimiento DATE,
num_doc INT(10) NOT NULL,
cod_jefe INT,
cod_documento INT NOT NULL,
cod_oficina INT NOT NULL,
PRIMARY KEY (cod_empleado),
FOREIGN KEY (cod_documento) REFERENCES documentos(cod_documento),
FOREIGN KEY (cod_oficina) REFERENCES oficinas(cod_oficina));

ALTER TABLE empleados ADD COLUMN doc_jefe INT;

CREATE TABLE datos_contratos 
(fecha_contrato DATE NOT NULL,
cod_empleado INT NOT NULL,
cuota INT NOT NULL,
ventas INT NOT NULL,
PRIMARY KEY (fecha_contrato),
FOREIGN KEY (cod_empleado) REFERENCES empleados(cod_empleado));

CREATE TABLE fabricantes
(cod_fabricante INT NOT NULL,
razon_social VARCHAR (100) UNIQUE ,
PRIMARY KEY (cod_fabricante));

CREATE TABLE listas 
(cod_lista INT,
descripcion VARCHAR (40) ,
ganancia INT  ,
PRIMARY KEY (cod_lista));

CREATE TABLE productos 
(cod_producto INT AUTO_INCREMENT ,
descripcion VARCHAR (60) NOT NULL,
precio INT NOT NULL,
cantidad_stock INT,
punto_reposicion INT ,
cod_fabricante INT,
CONSTRAINT chk_cantidad_stock CHECK (cantidad_stock >= 0),
PRIMARY KEY (cod_producto),
FOREIGN KEY (cod_fabricante) REFERENCES fabricantes (cod_fabricante));

ALTER TABLE productos AUTO_INCREMENT = 001;

CREATE TABLE precios
(precio int,
cod_producto INT,
cod_lista INT,
FOREIGN KEY (cod_producto) REFERENCES productos (cod_producto),
FOREIGN KEY (cod_lista) REFERENCES listas (cod_lista));

CREATE TABLE clientes 
(cod_cliente INT NOT NULL AUTO_INCREMENT,
cod_lista INT,
razon_social VARCHAR(100),
PRIMARY KEY (cod_cliente),
FOREIGN KEY (cod_lista) REFERENCES listas(cod_lista));

CREATE TABLE pedidos
(cod_pedido INT NOT NULL AUTO_INCREMENT ,
fecha_pedido DATE NOT NULL,
cod_empleado INT,
cod_cliente INT,
PRIMARY KEY (cod_pedido),
FOREIGN KEY (cod_empleado) REFERENCES empleados (cod_empleado),
FOREIGN KEY (cod_cliente) REFERENCES clientes (cod_cliente));

CREATE TABLE detalle_pedidos
(cod_pedido INT,
numero_linea INT NOT NULL,
cod_producto INT,
cantidad INT,
PRIMARY KEY (cod_pedido, numero_linea),
FOREIGN KEY (cod_pedido) REFERENCES pedidos (cod_pedido),
FOREIGN KEY (cod_producto) REFERENCES productos (cod_producto));





SELECT *
FROM precios;

INSERT INTO oficinas (cod_oficina, codigo_director, descripcion)
VALUES 
		(001,001,'Ventas'),
		(002,001,'Administracion'),
		(003,NULL,'Gerencia');
		
INSERT INTO documentos
VALUES
		(001,'Factura'),
		(002,'Contrato Trabajo'),
		(003,'Boleta Luz'),
		(004,'Boleta Internet'),
		(005,'Recibo de Sueldos');
		


INSERT INTO empleados (cod_empleado, apellido,nombre,fecha_nacimiento,num_doc,cod_jefe,cod_documento,cod_oficina)
VALUES 
		(001,'Di Maria','Angel','1988-02-14',34764665,002,003,2),
		(002,'Martinez','Emiliano','1992-09-02',34235444,null,005,3),
		(003,'Alvarez','Julian','2000-01-31',44734325,002,003,1),
		(004,'Fernandez','Enzo','2001-01-17',45723465,002,004,1),
		(005,'Martinez','Lautaro','1997-08-22',40864665,002,001,1),
		(006,'De Paul','Rodrigo','1994-05-24',34761235,002,001,1);
		

INSERT INTO datos_contratos (cod_empleado, fecha_contrato,cuota,ventas)
VALUES
		(001,'2022-02-15',100,1543),
		(002,'2022-02-16',100,1621),
		(003,'2022-02-17',100,1700),
		(004,'2023-05-12',100,1543),
		(005,'2023-06-08',100,1650),
		(006,'2024-05-18',100,1431);
		
SELECT * FROM empleados

SELECT * FROM datos_contratos
		
INSERT INTO productos(cod_producto, descripcion, precio, cantidad_stock, punto_reposicion, cod_fabricante)
VALUES 	
		(001,'Harry Potter y la piedra filosofal', 23000, 180, 300, 001),
		(002,'Harry Potter y la cámara secreta', 23000, 250, 300, 001),
		(003,'Harry Potter y el prisionero de Azkaban', 23000, 275, 300,001),
		(004,'Harry Potter y el cáliz de fuego',23000, 560,285,001),
		(005,'Harry Potter y la Orden del Fénix',23000, 900,299,001),
		(006,'Harry Potter y el misterio del príncipe',23000,350,300, 001),
		(007,'Harry Potter y las reliquias de la muerte',23000,420,300,001),
		(008,'Harry Potter y el legado maldito',23000,500,300,001),
		(009,'El Señor de los Anillos: La Comunidad del Anillo',25000,130,300,002),
		(010,'El Señor de los Anillos: Las Dos Torres',25000,150,300,002),
		(011,'El Señor de los Anillos: El Retorno del Rey',25000,185,300,002),
		(072,'Ingles I',5000,87,300,010),
		(073,'Ingles II',5000,70,300,010),
		(076,'Matematicas I',5000,56,300,010),
		(077,'Matematicas II',5000,43,300,010),
		(075,'Geografia I',5000,1000,87,010),
		(074,'Ingles III',5000,90,300,010),
		(078,'Literatura I',5000,56,300,010),
		(115,'Codigo Penal de la Republica Argentina 2025',5000,10,300,028);
		
		
INSERT INTO fabricantes (cod_fabricante, razon_social)
VALUES 
		(001,'Editorial Minamina'),
		(002,'Editorial Minotauro'),
		(010,'Editorial Mapa'),
		(028,'Editorial Erreius');
		
INSERT INTO listas (cod_lista, descripcion, ganancia)
VALUES 
		(002,'Ciencia Ficcion',3000),
		(003,'Educacion',1000);
		
TRUNCATE TABLE listas		

SELECT * FROM listas
		
INSERT INTO precios (cod_producto, cod_lista,precio)
VALUES 
		(001,002,23000),
		(002,002,23000),
		(003,002,23000),
		(004,002,23000),
		(005,002,23000),
		(006,002,23000),
		(007,002,23000),
		(008,002,23000),
		(009,002,25000),
		(010,002,25000),
		(011,002,25000),
		(072,003,5000),
		(073,003,5000),
		(074,003,5000),
		(075,003,5000),
		(076,003,5000),
		(077,003,5000),
		(078,003,5000),
		(115,003,5000);
		
		
INSERT INTO clientes (cod_cliente, cod_lista,razon_social)
VALUES
		(001,003, 'Flay Mamerto Esquiu'),
		(002,003,'Instituto Jose Hernandez'),
		(003,003, 'Colegio Madre Teresa'),
		(132,002, 'Leonardo Agustin Olivera Oropel'),
		(133,002, 'Luka Pozzi'),
		(134,002,'Federico Ferreyra'),
		(135,002,'Nicolas Ruiz');
		
		
INSERT INTO pedidos (fecha_pedido,cod_empleado,cod_cliente)
VALUES
		('2022-02-17',001,001),
		('2022-02-17',001,001),
		('2022-02-18',002,002),
		('2022-02-18',003,002),
		('2022-02-19',003,003),
		('2022-02-19',001,003),
		('2022-02-19',004,003),
		('2022-03-15',004,132),
		('2022-03-15',005,133),
		('2022-03-15',003,134),
		('2022-04-11',003,135),
		('2022-04-12',001,132),
		('2022-04-14',002,002),
		('2022-04-17',002,001),
		('2022-05-02',003,003),
		('2022-05-10',003,003),
		('2022-05-15',001,134),
		('2022-06-01',004,002),
		('2022-07-25',004,001),
		('2022-08-22',005,135),
		('2022-08-23',003,132),
		('2022-12-31',003,001);
		

INSERT INTO detalle_pedidos (cod_pedido, numero_linea, cod_producto,cantidad)
VALUES 
		(001,1,072,50),
		(002,2,073,50),
		(003,1,074,50),
		(004,2,075,50),
		(005,1,076,50),
		(006,2,077,50),
		(007,1,078,50),
		(008,33,009,1),
		(009,33,001,1),
		(010,33,115,1),
		(011,33,001,1),
		(012,33,010,1),
		(013,1,072,50),
		(014,2,073,50),
		(015,33,009,50),
		(016,2,073,50),
		(017,33,001,1),
		(018,1,073,50),
		(019,2,075,50),
		(020,33,002,1),
		(021,33,011,1),
		(022,2,073,50);
		


TRUNCATE TABLE precios;		


SELECT *
FROM productos

--A--

--1--

SELECT descripcion AS Oficinas
FROM oficinas

--2--

SELECT descripcion, precio, (precio*1.21) AS precio_iva
FROM productos
		
--3--

SELECT apellido,nombre,fecha_nacimiento,TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
FROM empleados;

--4--

SELECT apellido
FROM empleados
WHERE cod_jefe = NULL

--5--

SELECT nombre, apellido
FROM empleados
WHERE nombre LIKE 'maria'
ORDER BY apellido ASC

--6--

SELECT cod_cliente AS nombre, razon_social
FROM clientes 
WHERE razon_social LIKE 'L'
ORDER BY cod_cliente ASC

--7--

SELECT *
FROM pedidos
WHERE fecha_pedido BETWEEN '2022-03-01' AND '2022-03-31'

--8--

SELECT *
FROM oficinas
WHERE codigo_director = NULL

--9--

SELECT descripcion 
FROM productos 
ORDER BY precio ASC 
LIMIT 4


--10--

SELECT dt.cod_empleado
FROM datos_contratos dt
ORDER BY dt.cuota
LIMIT 3

--Cosultas Multitablas--


--1--

SELECT p.descripcion AS Descripcion ,f.razon_social AS Razon_Social, p.cantidad_stock AS Stock
FROM productos p,fabricantes f
WHERE p.cod_fabricante = f.cod_fabricante
ORDER BY f.razon_social,p.descripcion ASC

--2--

SELECT pe.cod_pedido, pe.fecha_pedido,e.apellido,c.razon_social
FROM pedidos pe, empleados e, clientes c
WHERE pe.cod_empleado = e.cod_empleado
AND pe.cod_cliente = c.cod_cliente

--3--

SELECT e.apellido, dt.cuota, o.descripcion,e.cod_oficina
FROM empleados e, datos_contratos dt, oficinas o
WHERE e.cod_empleado = dt.cod_empleado
AND e.cod_oficina = o.cod_oficina
ORDER BY dt.cuota DESC 

--4--

SELECT c.razon_social
FROM clientes c, pedidos pe
WHERE pe.cod_cliente = c.cod_cliente
AND fecha_pedido BETWEEN '2022-04-01' AND '2022-04-30'

--5--

SELECT pro.descripcion
FROM productos pro, detalle_pedidos dp, pedidos pe
WHERE pro.cod_producto = dp.cod_producto
AND pe.cod_pedido = dp.cod_pedido
AND pe.fecha_pedido BETWEEN '2022-03-01' AND '2022-03-31'

--6--

SELECT e.cod_empleado, e.nombre, e.apellido, dc.fecha_contrato, TIMESTAMPDIFF(YEAR, dc.fecha_contrato, CURDATE()) AS Anios_de_Antiguedad
FROM empleados e, datos_contratos dc
WHERE e.cod_empleado = dc.cod_empleado 
AND TIMESTAMPDIFF(YEAR, dc.fecha_contrato, CURDATE())>10
ORDER BY Anios_de_Antiguedad DESC;

--7--

SELECT c.cod_cliente, c.razon_social
FROM clientes c, pedidos pe, detalle_pedidos dp
WHERE c.cod_cliente = pe.cod_cliente
AND pe.cod_pedido = dp.cod_pedido
ORDER BY razon_social ASC 

--8--

SELECT pro.descripcion, c.cod_cliente
FROM clientes c, productos pro, pedidos pe, detalle_pedidos dp
WHERE c.cod_cliente = pe.cod_cliente
AND pe.cod_pedido = dp.cod_pedido
AND dp.cod_producto = pro.cod_producto
ORDER BY c.razon_social, pro.descripcion ASC 

--9--

SELECT pro.descripcion, pro.cantidad_stock, pro.punto_reposicion, (pro.punto_reposicion - pro.cantidad_stock) AS Stock_x_Reponer
FROM productos pro, fabricantes f
WHERE pro.cod_fabricante = f.cod_fabricante
AND pro.cantidad_stock < pro.punto_reposicion
ORDER BY f.razon_social, pro.descripcion ASC 

--10--

SELECT e.nombre AS Nombre,e.apellido AS Apellido,dt.cuota AS Couta
FROM empleados e,datos_contratos dt
WHERE e.cod_empleado = dt.cod_empleado
AND dt.cuota < 50000 OR dt.cuota > 100000




