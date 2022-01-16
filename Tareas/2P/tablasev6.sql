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
    
create table Piloto
(
	RFC char(13) not null, check(RFC regexp '[A-Z]{4}[0-9]{6}[A-Za-z0-9]{3}'),
    NLIC char(6) not null, check( NLIC regexp '[0-9]{6}'),
    TPLIC char(4) not null, check(TPLIC regexp '[A-Za-z]{2}[0-9]{2}'),
    primary key(RFC),
    foreign key(RFC) references Persona(RFC)
);