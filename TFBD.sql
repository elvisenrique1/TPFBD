-- 					******   *** TRABAJO PRÁCICO FINAL BASE DE DATOS ***   ******

drop database if exists negocio_indumentaria;
create database negocio_indumentaria;
use negocio_indumentaria;
show tables;

create table clientes (
	id_cliente int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni char(8),
    tel_celular varchar(10),
    email varchar(50),
    primary key(id_cliente)
);
select * from clientes;

create table vendedores (
	legajo int auto_increment,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    dni char(8),
    tel_celular varchar(10),
    email varchar(50),
    primary key(legajo)
);
select * from vededores;

create table articulos (
	codigo int,
    producto varchar(100) not null,
    color varchar(50) not null,
    stock int not null,
    stock_minimo int not null,
    stock_maximo int not null,
    primary key(codigo)
);
select * from articulos;

create table facturas (
	letra char(1),
    numero int,
    fecha date,
    monto double,
    id_cliente int,
    legajo_vendedor int,
    primary key(letra, numero)
);
select * from facturas;

alter table facturas add constraint FK_facturas_clientes
foreign key (id_cliente) references clientes(id_cliente);

alter table facturas add constraint FK_facturas_vendedores
foreign key (legajo_vendedor) references vendedores(legajo);

create table ventas (
	letra char(1),
    numero int,
    codigo int,
    cantidad int not null,
    primary key(letra, numero, codigo)
);
select * from ventas;

alter table ventas add constraint FK_ventas_facturas
foreign key (letra, numero) references facturas(letra, numero);


alter table ventas add constraint FK_ventas_articulos
foreign key (codigo) references articulos(codigo);

-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-- SCRIPT PARA INSERTAR REGISTROS EN LA BASE NEGOCIO_INDUMENTARIA 
-- +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

INSERT INTO clientes (nombre, apellido, dni, tel_celular, email) VALUES
	('Juan', 'Perez', '12345678', '987654321', 'juan.perez@gmail.com'),
    ('María', 'Flores', '87654321', '123456789', 'maria.flores@gmail.com'),
    ('Carlos', 'Rodriguez', '23456789', '567890123', 'carlos.rodriguez@hotmail.com'),
    ('Lucía', 'Franco', '34567812', '654321789', 'lucia.franco@outlook.com'),
    ('Martín', 'Díaz', '98765432', '321789456', null),
    ('Carolina', 'López', '45678123', '789456123', 'carolina.lopez@gmail.com'),
    ('Fernando', 'Martínez', '78901234', '456123789', 'fernando.martinez@yahoo.com.ar'),
    ('Valeria', 'García', '12345678', '123789456', null),
    ('Miguel', 'Sánchez', '56781234', '789456123', 'miguel.sanchez@gmail.com'),
    ('Camila', 'Fernández', '12347890', '456789012', 'camila.fernandez@outlook.com'),
    ('Diego', 'Britos', '78904561', '234567890', null),
    ('Brenda', 'Giménez', '34561230', '567890123', 'brenda.gimenez@gmail.com'),
    ('Marcelo', 'Alvarez', '78904561', '234567890', 'marcelo.alvarez@hotmail.com'),
    ('Romina', 'Smith', '34561230', '567890123', null),
    ('Eduardo', 'Romero', '12034567', '678901234', 'eduardo.romero@gmail.com');

INSERT INTO vendedores (nombre, apellido, dni, tel_celular, email) VALUES
    ('Laura', 'Fernandez', '34567890', '789012345', 'laura.fernandez@gmail.com'),
    ('Roberto', 'Ríos', '45678901', '890123456', null),
    ('Ana', 'Iunti', '56789012', '901234567', null),
    ('Luis', 'Sosa', '90876543', '654321098', 'luis.sosa@gmail.com'),
    ('Silvia', 'Ramírez', '76543210', '210987654', 'silvia.ramirez@outlook.com'),
    ('Pablo', 'Torres', '54321098', '987654321', 'pablo.torres@hotmail.com'),
    ('Laura', 'Rojas', '21098765', '876543210', 'laura.rojas@gmail.com'),
    ('Sebastián', 'Pérez', '45678901', '321098765', 'sebastian.perez@gmail.com'),
    ('Melina', 'Cabrera', '12309876', '543210987', 'melina.cabrera@yahoo.com.ar'),
    ('Ana', 'Vargas', '65432109', '987654321', 'ana.vargas@gmail.com');

INSERT INTO articulos (codigo, producto, color, stock, stock_minimo, stock_maximo) VALUES
    (1, 'Camisa', 'Blanco', 100, 10, 150),
    (2, 'Pantalón', 'Negro', 80, 5, 120),
    (30, 'Zapatos', 'Marrón', 50, 8, 80),
    (40, 'Vestido', 'Rojo', 30, 5, 50),
    (500, 'Corbata', 'Azul', 60, 10, 80),
    (610, 'Bufanda', 'Verde', 40, 8, 60),
    (777, 'Sombrero', 'Negro', 25, 5, 40),
    (8, 'Remera', 'Gris', 20, 5, 30),
    (19, 'Botas', 'Negro', 15, 3, 25),
    (10, 'Gorra', 'Blanco', 35, 7, 55),
    (200, 'Blusa', 'Rosa', 28, 6, 45),
    (128, 'Short', 'Celeste', 22, 4, 35),
    (1000, 'Medias', 'Blanco', 50, 10, 70),
    (235, 'Remera manga larga', 'Verde', 40, 8, 60),
    (755, 'Boina de cuero', 'Negro', 25, 5, 40),
    (828, 'Remera estampada', 'Blanco', 20, 5, 30),
    (99, 'Ojotas', 'Negro', 15, 3, 25),
    (100, 'Vestido de gala', 'Blanco', 35, 7, 55),
    (127, 'Camisa manga corta', 'Gris', 28, 6, 45),
    (14, 'Short de baño', 'Verde', 22, 4, 35),
    (70, 'Saco polar', 'Azul', 50, 10, 70);

INSERT INTO facturas (letra, numero, fecha, monto, id_cliente, legajo_vendedor) VALUES
    ('A', 1, '2022-02-15', 300.00, 1, 1),
    ('B', 1, '2022-02-15', 450.00, 2, 2),
    ('C', 1, '2022-06-10', 200.00, 3, 3),
    ('A', 2, '2022-09-20', 180.00, 4, 4),
    ('B', 2, '2022-09-20', 220.00, 6, 5),
    ('C', 2, '2022-12-15', 350.00, 7, 6),
    ('A', 3, '2023-01-05', 400.00, 1, 1),
    ('B', 3, '2023-03-10', 350.00, 2, 2),
    ('C', 3, '2023-05-18', 500.00, 9, 8),
    ('A', 4, '2023-07-25', 320.00, 10, 10),
    ('B', 4, '2023-07-25', 280.00, 13, 2),
    ('C', 4, '2023-11-20', 220.00, 14, 3),
    ('A', 5, '2024-01-15', 370.00, 1, 4),
    ('B', 5, '2024-02-22', 410.00, 6, 5),
    ('C', 5, '2024-05-10', 300.00, 7, 6),
    ('A', 6, '2024-07-25', 480.00, 8, 7),
    ('B', 6, '2024-07-25', 190.00, 9, 8),
    ('C', 6, '2024-09-15', 260.00, 10, 10),
    ('A', 7, '2024-11-01', 420.00, 13, 2);    
    
INSERT INTO ventas (letra, numero, codigo, cantidad) VALUES
    ('A', 1, 1, 10),
    ('A', 1, 2, 5),
    ('A', 1, 30, 2),
    ('A', 1, 235, 2),
    ('B', 1, 40, 4),
    ('B', 1, 500, 3),
    ('B', 1, 8, 6),
    ('C', 1, 19, 2),
    ('C', 1, 10, 3),
    ('C', 1, 755, 4),
    ('A', 2, 128, 1),
    ('A', 2, 100, 2),
    ('A', 2, 777, 5),
    ('B', 2, 1, 3),
    ('B', 2, 2, 2),
    ('B', 2, 30, 1),
    ('C', 2, 40, 2),
    ('C', 2, 235, 3),
    ('C', 2, 500, 1),
    ('C', 2, 8, 3),
    ('A', 3, 10, 2),
    ('A', 3, 755, 3),
    ('A', 3, 128, 2),
    ('B', 3, 100, 1),
    ('B', 3, 777, 2),
    ('B', 3, 99, 4),
    ('C', 3, 14, 3),
    ('C', 3, 127, 2),
    ('C', 3, 1000, 5),
    ('A', 4, 30, 2),
    ('A', 4, 10, 1),
    ('A', 4, 755, 4),
    ('B', 4, 128, 3),
    ('B', 4, 100, 2),
    ('B', 4, 777, 1),
    ('B', 4, 828, 2),
    ('C', 4, 99, 3),
    ('A', 5, 127, 4),
    ('B', 5, 1000, 6),
    ('C', 5, 14, 2),
    ('A', 6, 1, 3),
    ('B', 6, 2, 5),
    ('C', 6, 30, 1),
    ('A', 7, 19, 4),
    ('A', 7, 10, 2);
    
--    Luego, informar por medio de sentencias:

-- 1- Cantidad de clientes y vendedores que tiene el negocio.
select 		count(*) 
from 		clientes c
join 		vendedores v
on 			

-- 2- Listar los clientes que tienen un email registrado, ordenado por apellido y nombre.
-- 3- Listar nombre y apellido, tanto de clientes como de vendedores, cuya dirección de email sea de Gmail.
-- 4- Listar los clientes cuyo apellido contenga al menos una letra 'e' y que termine con 'z'.
-- 5- Listar los vendedores cuya última letra del nombre sea una 'a' y tenga 5 letras en total.
-- 6- Listar los artículos cuyo nombre esté compuesto por más de 2 palabras.
-- 7- Listar la cantidad de facturas que hubo por fecha de facturación.
-- 8- Informar la suma total de las ventas del negocio por mes, ordenadas de mayor a menor.
-- 9- Informar la cantidad de facturas de cada cliente.
-- 10- Informar quiénes compraron el primer día de ventas.
-- 11- Listar los clientes a los que no se les haya hecho alguna factura.
-- 12- Listar qué clientes (id_cliente, nombre, apellido) compraron remeras.
-- 13- Listar los artículos que aún no fueron vendidos.
-- 14- Informar cuántas unidades se vendieron de cada artículo.
-- 15- Listar el o los artículos que tengan la mayor cantidad de stock, siendo la mayor cantidad un único valor máximo.
-- 16- Agregar los campos precio_costo y precio_venta del tipo double a la tabla artículos.
-- 17- Agregar un campo del tipo decimal, llamado sueldo_empleado, a la tabla vendedores. EL mismo tendrá un valor inicial para todos de 450.010,00
-- 18- Actualizar todos los stock_minimo y stock_maximo a 100 y 500 respectivamente.
-- 19- Eliminar los productos que no se hayan vendido nunca.
-- 20 Clientes que compraron más de 5 artículos distintos.
