create database aviones;
use aviones;
create table tipo
(
	IDTIP  int not null auto_increment,
    NOMTP char(20) not null,
    primary key(IDTIP)
);
create table Modelo
(
	IDMOD int not null auto_increment,
    NOMMD char(20) not null, 
    CAPACI int not null, check( CAPACI<853),
    PESO int not null, check( PESO<1000),
    IDTIP int not null,
    primary key(IDMOD),
    foreign key(IDTIP) references tipo(IDTIP)
);
create table Persona
(
	RFC char(13) not null, check(RFC regexp '[A-Z]{4}[0-9]{6}[A-Za-z0-9]{3}'),
    NOMBR char(20) not null, check( NOMBR regexp '[A-Z]{1}[a-záéíóúÁÉÍÓÚàèìòùÀÈÌÒÙüÜ]{1,19}'),
    APPAT char(20), check( APPAT regexp '^[A-Z]{1}[a-záéíóúÁÉÍÓÚàèìòùÀÈÌÒÙüÜ\']{1,19}'),
    APMAT char(20), check( APMAT regexp '^[A-Z]{1}[a-záéíóúÁÉÍÓÚàèìòùÀÈÌÒÙüÜ\']{1,19}'),
    TEL numeric(10) not null, check(TEL regexp '[0-9]{10}'),
    DIR char(80) not null, check(DIR regexp '[A-Za-z0-9#,.-_]'),
    primary key(RFC)
);
create table Autorizacion
(
	IDTIP int not null auto_increment,
    RFC char(13) not null, check(RFC regexp '[A-Z]{4}[0-9]{6}[A-Za-z0-9]{3}'),
    HABILITAR char(1) not null, check(HABILITAR regexp '1|0'),
    primary key(IDTIP,RFC),
    foreign key(IDTIP) references tipo(IDTIP),
    foreign key(RFC) references persona(RFC)
);
    
create table Piloto
(
	RFC char(13) not null, check(RFC regexp '[A-Z]{4}[0-9]{6}[A-Za-z0-9]{3}'),
    NLIC char(6) not null, check( NLIC regexp '[0-9]{6}'),
    TPLIC char(4) not null, check(TPLIC regexp '[A-Za-z]{2}[0-9]{2}'),
    primary key(RFC),
    foreign key(RFC) references Persona(RFC)
);
create table EmpleadoM
(
	RFC char(13) not null, check(RFC regexp '[A-Z]{4}[0-9]{6}[A-Za-z0-9]{3}'),
    SALAR decimal(8,2) not null,
    TURNO char(1) not null, check(TURNO regexp 'M|V|N|X'),
    TPLIC char(4) not null, check(TPLIC regexp '[A-Za-z]{1}[0-9]{1}'),
    primary key(RFC),
    foreign key(RFC) references Persona(RFC)
);
create table Avion
(
	MATRI char(5) not null , check(MATRI regexp '[A-Za-z]{3}[0-9]{2}'),
    NOREG numeric(6) not null, check(NOREG regexp '[0-9]{6}'),
    FEREG numeric(8) not null, check(FEREG regexp '(0[1-9]|1[0-9]|2[0-9]|3[0-1]){1}(0[1-9]|1[0-2]){1}(19[0-9][3-9]|20[0-9][0-9]|2100){1}'),
    IDMOD int not null,
    primary key(MATRI),
    foreign key(IDMOD) references Modelo(IDMOD)
);
create table Hangar
(
	CODHN char(2) not null, check(CODHN regexp '[A-Za-z]{1}[0-9]{1}'),
    LOCALI char(80) not null, check(LOCALI regexp '[A-Za-z0-9#,.-_]'),
    CAPACI int not null, check( CAPACI<100),
    primary key(CODHN)
);
create table Lugar
(
	NOLUG int NOT NULL, CHECK(NOLUG<100),
    CODHN char(2) not null, check(CODHN regexp '[A-Za-z]{1}[0-9]{1}'),
    MATRI char(5), check(MATRI regexp '[A-Za-z]{3}[0-9]{2}'),
    PRIMARY KEY(NOLUG,CODHN),
    FOREIGN KEY(CODHN) REFERENCES Hangar(CODHN),
    FOREIGN KEY(MATRI) REFERENCES Avion(MATRI)
);
create table Servicio
( 
	CODTJ char(4) not null, check(CODTJ regexp '[A-Za-z]{2}[0-9]{2}'),
    MATRI char(5) not null, check(MATRI regexp '[A-Za-z]{3}[0-9]{2}'),
    RFC char(13) not null, check(RFC regexp '[A-Z]{4}[0-9]{6}[A-Za-z0-9]{3}'),
    HORAS numeric(6) not null,
    FECHA numeric(8) not null, check(FECHA regexp '(0[1-9]|1[0-9]|2[0-9]|3[0-1]){1}(0[1-9]|1[0-2]){1}(19[0-9][3-9]|20[0-9][0-9]|2100){1}'),
    primary key(CODTJ),
    foreign key(MATRI) references Avion(MATRI),
    foreign key(RFC) references EmpleadoM(RFC)
);
create table Propietario
(
	RFC char(13) not null, check(RFC regexp '[A-Z]{4}[0-9]{6}[A-Za-z0-9]{3}'),
    TPP char(1) not null, check(TPP regexp 'I|C'),
    primary key(RFC),
    foreign key(RFC) references Persona(RFC)
);
create table Propiedad
(
	RFC char(13) not null, check(RFC regexp '[A-Z]{4}[0-9]{6}[A-Za-z0-9]{3}'),
    MATRI char(5) not null, check(MATRI regexp '[A-Za-z]{3}[0-9]{2}'),
    FCHCM numeric(8) not null, check(FCHCM regexp '(0[1-9]|1[0-9]|2[0-9]|3[0-1]){1}(0[1-9]|1[0-2]){1}(19[0-9][3-9]|20[0-9][0-9]|2100){1}'),
    primary key(RFC, MATRI),
    foreign key(RFC) references Propietario(RFC),
    foreign key(MATRI) references Avion(MATRI)
);
    
    