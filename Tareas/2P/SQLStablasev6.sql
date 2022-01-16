--Yong Rodríguez Luz María 4NV70
create database aviones;
use aviones;
create table tipo
(
	IDTIP  int not null,
    NOMTP char(20) not null,
    primary key(IDTIP)
);
create table Modelo
(
	IDMOD int not null,
    NOMMD char(20) not null, 
    CAPACI int not null, check( CAPACI<853),
    PESO int not null, check( PESO<1000),
    IDTIP int not null,
    primary key(IDMOD),
    foreign key(IDTIP) references tipo(IDTIP)
);
create table Persona
(
	RFC char(13) not null, check(RFC like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]'),
    NOMBR char(20) not null, check( NOMBR not like '%[0-9]%'),
    APPAT char(20), check( APPAT not like '%[0-9]%'),
    APMAT char(20), check( APMAT not like '%[0-9]%'),
    TEL numeric(10) not null, check(TEL like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
    DIR char(80) not null, check(DIR not like '%[{}[]¿?¡!*^$]%'),
    primary key(RFC)
);
    
create table Piloto
(
	RFC char(13) not null, check(RFC like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]'),
    NLIC char(6) not null, check( NLIC like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
    TPLIC char(4) not null, check(TPLIC like '[a-zA-Z][a-zA-Z][0-9][0-9]'),
    primary key(RFC),
    foreign key(RFC) references Persona(RFC)
);