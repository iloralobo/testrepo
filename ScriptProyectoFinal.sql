
create table Cliente (
	idCliente int not null identity primary key,
	nombre varchar(50) not null,
	apellido varchar(50) not null,
	fNacimiento date not null,
	domicilio varchar(50) not null,
	idPais char(3) not null,
	telefono varchar(12) not null,
	email varchar(30) not null,
	observaciones varchar(1000),
	fechaAlta datetime not null
)

select * from pais

insert into pais values
('ESP','España'),('GRC','Grecia'),('IND','India'),('USA','Estados Unidos'),('MEX','Mexico'),('BRA','Brasil'),
('DEU','Alemania')

select * from cliente

insert into cliente values
('James','Nicole','19900302','Oniell jack 2568','USA','1254685632','warden@green.us','No hay observaciones','2024-01-05'),
('Marta','Pérez','19950503','Brasilia 25','BRA','56432253','mPerezbra@getmail.com','No hay observaciones','2024-02-01'),
('Claudio','Ramírez','19840802','Cheguan 225','ESP','668521255','clauRami@gmail.es','No hay observaciones','2024-02-01 00:02:02'),
('Markuis','Papadopulus','19820206','Grikindier 223','GRC','2548542355','papadopulusm@gmail.com','Es griego','2024-02-01 00:06'),
('Carlos','Trebor','19660503','Pedro Pastor 2','MEX','135852133','carlitos@gmail.ue','No hay observaciones','2024-02-01'),
('Otto','Von Kunstmann','19750901','Ôtiggen str 3','DEU','6582216335','elaleman@aleman.com','Es alemán','2024-02-01 00:08'),
('Uit','Tlinnlnie','19770505','Intrati 22','IND','1325865523','uit@guit.in','Es indio','2024-02-06')

select * from campania

insert into campania values ('Producto Estrella 1'),('Producto Estrella 2'),('Producto Estrella 3')

select * from conceptoCompra

insert into conceptoCompra values ('Compra Producto Estrella 1'),('Compra Producto Estrella 2'),('Compra Producto Estrella 3')

select * from horarioEstado

insert into horarioEstado values ('Prime tarde-noche'),('Valle Media tarde, media mañana'),
('Breakfast antes de las 10 AM'),('Nocturno después de las 00:00')

select * from HoraCaptacion

insert into horaCaptacion values ('20240105',1,'Lead'),('20240105',2,'Lead'),('20240201',1,'Cliente'),
('20240201',3,'Prospecto'),('20240201',1,'Lead')
insert into horaCaptacion values ('20240101 10:00',1,'Desconocido')

select * from compra

insert into compra values 
(1,'20240102',5000,'Comprador de producto estrella 1'),
(2,'20240102',3500,'Comprador de producto estrella 2'),
(3,'20240102',5000,'Comprador de producto estrella 3')

select * from compraCliente

insert into compraCliente values (1,1,1),(2,2,2),(3,4,3)

select * from HoraCapClienteCampania
select * from cliente
select * from campania

insert into HoraCapClienteCampania values (6,7,1)

select nombre from cliente
select  TOP(3)* from cliente order by fNacimiento
select distinct(idPais) from cliente
update cliente set email = '200@gmail.es' where idCliente = 1
select avg(monto) as Promedio from compra
select * from horaCaptacion where fechaCaptacion between '20240101' and '20240130'

if exists (select idPais from cliente where idPais = 'ESP')
begin
	select * from cliente where idPais = 'ESP'
end
else
begin
	print'No hay clientes con nacionalidad española'
end

select  
	case
		when idPais = 'BRA' or idPais = 'USA' or idPais = 'MEX' then 'América'
		when idPais = 'ESP' or idPais = 'DEU 'or idPais = 'GRC' then 'Europa'
		when idPais = 'IND' then 'Asia'
	end as Continente
from pais

alter table cliente add DNI varchar(12)

EXEC Nuevo_cliente 'Raúl','Stuart','19850521','Las regasta 25','ESP','655821547','Raul@krokimail.com','','23513655'

alter proc Nuevo_cliente(
							@nombre varchar(50), 
							@apellido varchar(50),
							@fNacimiento varchar(8),
							@domicilio varchar(50),
							@idpais char(3),
							@telefono varchar(20),
							@email varchar(30),
							@observaciones varchar(1000),
							@dni varchar(12)
							)
as
if not exists (select * from cliente where DNI = @dni)
begin
	insert into cliente(nombre,apellido,fNacimiento,domicilio,idPais,telefono,email,observaciones,fechaAlta,DNI) values
	(@nombre,@apellido,@fNacimiento,@domicilio,@idPais,@telefono,@email,@observaciones,GETDATE(),@dni)
	print 'El cliente se regsitró correctamente'
	return
end
else
begin
	print 'El cliente ya existe'
	return
end