create database inmobiliaria_DB
GO
use inmobiliaria_DB
GO
create table multimedia(
	id int identity(1,1) not null,
	descripcion varchar(100) null,
	idPropiedad int null,
	link varchar(1000) not null,
    primary key (id),
    foreign key (idPropiedad) references propiedad(id)
)
GO
create table tipoContrato(
	id int identity(1,1) not null,
	descripcion varchar(50) null,
    primary key (id)

)
GO
create table tipoPropiedad(
	id int identity(1,1) not null,
	descripcion varchar(50) null,
    primary key (id)
)
GO
create table ubicacion(
	id int identity(1,1) not null,
	calle varchar(100) not null,
	altura int not null,
	departamento varchar(10) not null,
	ciudad varchar(100) not null,
	provincia varchar(100) not null,
	pais varchar(50) not null,
    primary key (id)

)
GO
create table propiedad(
	id int identity(1,1) not null,
	idTipoPropiedad int not null,
	idTipoContrato int not null,
	idUbicacion int not null,
    link varchar(1000) null,
	fechaPublicacion date not null,
	fechaConstruccion date not null,
	cantidadAmbientes int not null,
	cantidadBaños int not null,
	cantidadCocheras int not null,
	descripcion varchar(500) not null,
	valor money not null,
    primary key (id, idUbicacion),
    foreign key (idTipoPropiedad) references tipoPropiedad(id),
    foreign key (idTipoContrato) references tipoContrato(id),
    foreign key (idUbicacion) references ubicacion(id) 
)
GO
create table usuario(
    id int identity(1,1) not null,
    Usuario varchar(50) null,
    Pass varchar(50) null,
    TipoUser int null,
    Mail varchar(100) null,
    Nombre varchar(100) null,
    Apellido varchar(100) null,
    Telefono bigint null,
    primary key(id)
)
GO
create table favorito(
    id int identity(1,1) not null,
    IdUsuario int not null,
    IdPropiedad int not null,
    primary key(id),
    foreign key(IdUsuario) references usuario(id),
    foreign key(IdPropiedad) references propiedad(id)
)

insert into tipoContrato values ('Alquiler'), ('Venta')
select * from tipoContrato

insert into tipoPropiedad values ('Departamento'), ('Casa')
select * from tipoPropiedad

insert into ubicacion values ('calle 1', '1234', '3D', 'Merlo', 'Buenos Aires', 'Argentina')

insert into multimedia values ('Living', 'http://www.perezpando.com.ar/wp-content/uploads/Ver-casas-modernas-por-dentro-600x323.jpg')

insert into propiedad values ('2', '1', '1', '1', '2022-06-14' , '1997/03/02', '5', '2', '2', 'Casa muy moderna y grande', '550000')


------// Update 07/07

create table tipoUser(
	id int identity(1,1) not null,
	descripcion varchar(50) null,
    primary key (id)
)

ALTER TABLE usuario
ADD FOREIGN KEY (TipoUser) REFERENCES tipoUser(id)

insert into tipoUser values ('comprador')
insert into tipoUser values ('vendedor')
insert into tipoUser values ('admin')

UPDATE usuario
SET Mail = 'mail1', Nombre ='fulano', Apellido = 'perez', Telefono = 1234 
WHERE ID = 2

ALTER TABLE propiedad
ADD idVendedor int null

Alter table propiedad
add foreign key (idVendedor) references usuario(id)

--Alter table propiedad
--add check(idVendedor) 

update propiedad
set idVendedor = 2


