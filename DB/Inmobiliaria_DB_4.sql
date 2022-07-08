create database inmobiliaria_DB
GO
use inmobiliaria_DB
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
create table tipoUser(
	id int identity(1,1) not null,
	descripcion varchar(50) null,
    primary key (id)
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
    primary key(id),
	foreign key(TipoUser) references tipoUser(id)
)
GO
create table propiedad(
	id int identity(1,1) not null,
	idTipoPropiedad int not null,
	idTipoContrato int not null,
	idUbicacion int not null,
	idVendedor int not null,
    link varchar(1000) null,
	fechaPublicacion date not null,
	fechaConstruccion date not null,
	cantidadAmbientes int not null,
	cantidadBaños int not null,
	cantidadCocheras int not null,
	descripcion varchar(500) not null,
	valor money not null,
	primary key(id),
    foreign key (idUbicacion) references ubicacion(id),
    foreign key (idTipoPropiedad) references tipoPropiedad(id),
    foreign key (idTipoContrato) references tipoContrato(id),
    foreign key (idUbicacion) references ubicacion(id), 
	foreign key (idVendedor) references usuario(id)
)

GO
create table multimedia(
	id int identity(1,1) not null,
	descripcion varchar(100) null,
	idPropiedad int not null,
	link varchar(1000) not null,
    primary key (id),
    foreign key (idPropiedad) references propiedad(id)
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

insert into tipoPropiedad values ('Departamento'), ('Casa')

insert into ubicacion values ('calle 1', '1234', '3D', 'Merlo', 'Buenos Aires', 'Argentina')
insert into ubicacion values ('Agüero', '1789', '2', 'CABA', 'Buenos Aires', 'Argentina')

insert into tipoUser values ('comprador'),('vendedor'),('admin')

insert into usuario values('flexkpo','1234',3,'mail1@hotmail.com','Felix','Gomez',1135684123)
insert into usuario values('Javier','abcd',2,'javier@lainmobiliaria.com','Javier','Perez',1135684753)

insert into propiedad values (2,2,1,2,'https://images.adsttc.com/media/images/622b/9c0b/6a2b/af01/6506/d38b/newsletter/004-ok.jpg?1647025197', '2022-06-14' , '1997-03-02',5,2,2, 'Casa muy moderna y grande', '550000')
insert into propiedad values (1,2,2,2, 'https://www.bbva.com/wp-content/uploads/2021/04/casas-ecolo%CC%81gicas_apertura-hogar-sostenibilidad-certificado--1024x629.jpg', '2022-06-15' , '1997-03-15',5,2,2, 'En pleno centro de Buenos Aires', '600000')

insert into multimedia values ('living', 1, 'https://images.homify.com/image/upload/c_scale,h_375,w_500/v1439982551/p/photo/image/554935/_MG_7316_copy_copia.jpg')
insert into multimedia values ('cocina', 1, 'https://static8.depositphotos.com/1363517/842/i/600/depositphotos_8422041-stock-photo-kitchen.jpg')
insert into multimedia values ('comedor', 1, 'https://azulbuenosaires.com.ar/wp-content/uploads/2020/06/WhatsApp-Image-2021-01-08-at-10.34.09-500x500.jpeg')
insert into multimedia values ('baño', 1, 'https://azulbuenosaires.com.ar/wp-content/uploads/2020/06/WhatsApp-Image-2021-01-08-at-10.34.09-500x500.jpeg')

insert into multimedia values ('living', 2, 'https://i.pinimg.com/originals/fc/7b/cc/fc7bcca5e3f05768d0406edae7621b72.jpg')
insert into multimedia values ('cocina', 2, 'https://st.hzcdn.com/simgs/pictures/cocinas/cocina-en-rojo-loving-design-interiorismo-y-home-staging-img~83a1ab9a0e611c4f_14-7776-1-88917d1.jpg')
insert into multimedia values ('comedor', 2, 'https://m.media-amazon.com/images/I/91P4NbpqlZL._AC_SX522_.jpg')
insert into multimedia values ('baño', 2, 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/bano-de-invitados-1556803418.jpg')

