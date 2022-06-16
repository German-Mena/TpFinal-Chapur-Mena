create database inmobiliaria_DB
GO
create table multimedia(
	id int identity(1,1) not null,
	descripcion varchar(100) null,
	idPropiedad int null,
	link varchar(1000) not null,
    primary key (id)
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
	idPropiedad int null,
	descripcion varchar(50) null,
    primary key (id)
)
GO
create table ubicacion(
	id int identity(1,1) not null,
	idPropiedad int null,
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
    idMultimedia int null,
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
    foreign key (idMultimedia) references multimedia(id),
    foreign key (idUbicacion) references ubicacion(id) 
)

insert into tipoContrato values ('Alquiler'), ('Venta')
select * from tipoContrato

insert into tipoPropiedad values ('Departamento'), ('Casa')
select * from tipoPropiedad

insert into ubicacion values ('calle 1', '1234', '3D', 'Merlo', 'Buenos Aires', 'Argentina')

insert into multimedia values ('Living', 'http://www.perezpando.com.ar/wp-content/uploads/Ver-casas-modernas-por-dentro-600x323.jpg')

insert into propiedad values ('2', '1', '1', '1', '2022-06-14' , '1997/03/02', '5', '2', '2', 'Casa muy moderna y grande', '550000')

