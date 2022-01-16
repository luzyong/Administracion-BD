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
    CAPACI int not null, check(CAPACI<853),
    PESO int not null, check(PESO<1000),
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
create table Autorizacion
(
	IDTIP int not null,
    RFC char(13) not null, check(RFC like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]'),
    HABILITAR char(1) not null, check(HABILITAR like '1' or HABILITAR like '0'),
    primary key(IDTIP,RFC),
    foreign key(IDTIP) references tipo(IDTIP),
    foreign key(RFC) references persona(RFC)
);
    
create table Piloto
(
	RFC char(13) not null, check(RFC like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][a-zA-Z0-9][a-zA-Z0-9][a-zA-Z0-9]'),
    NLIC char(6) not null, check( NLIC like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
    TPLIC char(4) not null, check(TPLIC like '[a-zA-Z][a-zA-Z][0-9][0-9]'),
    primary key(RFC),
    foreign key(RFC) references Persona(RFC)
);
create table EmpleadoM
(
	RFC char(13) not null, check(RFC like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]'),
    SALAR decimal(8,2) not null,
    TURNO char(1) not null, check(TURNO like 'M' or TURNO like'V' or TURNO like 'N' or TURNO like 'X'),
    TPLIC char(4) not null, check(TPLIC like '[a-zA-Z][a-zA-Z][0-9][0-9]'),
    primary key(RFC),
    foreign key(RFC) references Persona(RFC)
);
create table Avion
(
	MATRI char(5) not null , check(MATRI like '[a-zA-Z][a-zA-Z][a-zA-Z][0-9][0-9]'),
    NOREG numeric(6) not null, check(NOREG like '[0-9][0-9][0-9][0-9][0-9][0-9]'),
    FEREG numeric(8) not null, check(FEREG like '[1-9][1-9]20[0-9][0-9]' or FEREG like '[1-9][1-9]190[3-9]'or FEREG like '[1-9][1-9]19[1-9][0-9]' or FEREG like '[1-9][1-9]2100' or FEREG like '[1-9]1[0-2]19[1-9][0-9]' or FEREG like '[1-9]1[0-2]190[3-9]' or FEREG like '[1-9]1[0-2]20[0-9][0-9]' or FEREG like '[1-9]1[0-2]2100' or FEREG like '1[0-9][1-9]190[3-9]' or FEREG like '1[0-9][1-9]19[1-9][0-9]' or FEREG like '1[0-9][1-9]20[0-9][0-9]' or FEREG like '1[0-9][1-9]2100' or FEREG like '1[0-9]1[0-2]190[3-9]'or FEREG like '1[0-9]1[0-2]19[1-9][0-9]' or FEREG like '1[0-9]1[0-2]20[0-9][0-9]' or FEREG like '1[0-9]1[0-2]2100' or FEREG like '2[0-9][1-9]190[3-9]'or FEREG like '2[0-9][1-9]19[1-9][0-9]' or FEREG like '2[0-9][1-9]20[0-9][0-9]' or FEREG like '2[0-9][1-9]2100' or FEREG like '2[0-9]1[0-2]190[3-9]'or FEREG like '2[0-9]1[0-2]19[1-9][0-9]' or FEREG like '2[0-9]1[0-2]20[0-9][0-9]' or FEREG like '2[0-9]1[0-2]2100' or FEREG like '3[0-1][1-9]190[3-9]' or FEREG like '3[0-1][1-9]19[1-9][0-9]'or FEREG like '3[0-1][1-9]20[0-9][0-9]' or FEREG like '3[0-1][1-9]2100' or FEREG like '3[0-1]1[0-2]190[3-9]'or FEREG like '3[0-1]1[0-2]19[1-9][0-9]' or FEREG like '3[0-1]1[0-2]20[0-9][0-9]' or FEREG like '3[0-1]1[0-2]2100'),
    IDMOD int not null,
    primary key(MATRI),
    foreign key(IDMOD) references Modelo(IDMOD)
);
create table Hangar
(
	CODHN char(2) not null, check(CODHN like '[a-zA-Z][0-9]'),
    LOCALI char(80) not null, check(LOCALI not like '%[{}[]¿?¡!*^$]%'),
    CAPACI int not null, check( CAPACI<100),
    primary key(CODHN)
);
create table Lugar
(
	NOLUG int NOT NULL, CHECK(NOLUG<100),
    CODHN char(2) not null, check(CODHN like '[a-zA-Z][0-9]'),
    MATRI char(5), check(MATRI like '[a-zA-Z][a-zA-Z][a-zA-Z][0-9][0-9]'),
    PRIMARY KEY(NOLUG,CODHN),
    FOREIGN KEY(CODHN) REFERENCES Hangar(CODHN),
    FOREIGN KEY(MATRI) REFERENCES Avion(MATRI)
);
create table Servicio
( 
	CODTJ char(4) not null, check(CODTJ like '[a-zA-Z][a-zA-Z][0-9][0-9]'),
    MATRI char(5) not null, check(MATRI like '[a-zA-Z][a-zA-Z][a-zA-Z][0-9][0-9]'),
    RFC char(13) not null, check(RFC like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]'),
    HORAS numeric(6) not null,
    FECHA numeric(8) not null, check(FECHA like '[1-9][1-9]20[0-9][0-9]' or FECHA like '[1-9][1-9]190[3-9]'or FECHA like '[1-9][1-9]19[1-9][0-9]' or FECHA like '[1-9][1-9]2100' or FECHA like '[1-9]1[0-2]190[3-9]'or FECHA like '[1-9]1[0-2]19[1-9][0-9]' or FECHA like '[1-9]1[0-2]20[0-9][0-9]' or FECHA like '[1-9]1[0-2]2100' or FECHA like '1[0-9][1-9]190[3-9]'or FECHA like '1[0-9][1-9]19[1-9][0-9]' or FECHA like '1[0-9][1-9]20[0-9][0-9]' or FECHA like '1[0-9][1-9]2100' or FECHA like '1[0-9]1[0-2]190[3-9]'or FECHA like '1[0-9]1[0-2]19[1-9][0-9]' or FECHA like '1[0-9]1[0-2]20[0-9][0-9]' or FECHA like '1[0-9]1[0-2]2100' or FECHA like '2[0-9][1-9]190[3-9]'or FECHA like '2[0-9][1-9]19[1-9][0-9]' or FECHA like '2[0-9][1-9]20[0-9][0-9]' or FECHA like '2[0-9][1-9]2100' or FECHA like '2[0-9]1[0-2]190[3-9]' or FECHA like '2[0-9]1[0-2]19[1-9][0-9]' or FECHA like '2[0-9]1[0-2]20[0-9][0-9]' or FECHA like '2[0-9]1[0-2]2100' or FECHA like '3[0-1][1-9]190[3-9]' or FECHA like '3[0-1][1-9]19[1-9][0-9]' or FECHA like '3[0-1][1-9]20[0-9][0-9]' or FECHA like '3[0-1][1-9]2100' or FECHA like '3[0-1]1[0-2]190[3-9]' or FECHA like '3[0-1]1[0-2]19[1-9][0-9]' or FECHA like '3[0-1]1[0-2]20[0-9][0-9]' or FECHA like '3[0-1]1[0-2]2100'),
    primary key(CODTJ),
    foreign key(MATRI) references Avion(MATRI),
    foreign key(RFC) references EmpleadoM(RFC)
);
create table Propietario
(
	RFC char(13) not null, check(RFC like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]'),
    TPP char(1) not null, check(TPP like 'I' or TPP like 'C'),
    primary key(RFC),
    foreign key(RFC) references Persona(RFC)
);
create table Propiedad
(
	RFC char(13) not null, check(RFC like '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Za-z0-9][A-Za-z0-9][A-Za-z0-9]'),
    MATRI char(5) not null, check(MATRI like '[a-zA-Z][a-zA-Z][a-zA-Z][0-9][0-9]'),
    FCHCM numeric(8) not null, check(FCHCM like '[1-9][1-9]20[0-9][0-9]' or FCHCM like '[1-9][1-9]190[3-9]' or FCHCM like '[1-9][1-9]19[1-9][0-9]' or FCHCM like '[1-9][1-9]2100' or FCHCM like '[1-9]1[0-2]190[3-9]' or FCHCM like '[1-9]1[0-2]19[1-9][0-9]' or FCHCM like '[1-9]1[0-2]20[0-9][0-9]' or FCHCM like '[1-9]1[0-2]2100' or FCHCM like '1[0-9][1-9]190[3-9]' or FCHCM like '1[0-9][1-9]19[1-9][0-9]' or FCHCM like '1[0-9][1-9]20[0-9][0-9]' or FCHCM like '1[0-9][1-9]2100' or FCHCM like '1[0-9]1[0-2]190[3-9]' or FCHCM like '1[0-9]1[0-2]19[1-9][0-9]' or FCHCM like '1[0-9]1[0-2]20[0-9][0-9]' or FCHCM like '1[0-9]1[0-2]2100' or FCHCM like '2[0-9][1-9]190[3-9]' or FCHCM like '2[0-9][1-9]19[1-9][0-9]' or FCHCM like '2[0-9][1-9]20[0-9][0-9]' or FCHCM like '2[0-9][1-9]2100' or FCHCM like '2[0-9]1[0-2]190[3-9]' or FCHCM like '2[0-9]1[0-2]19[1-9][0-9]' or FCHCM like '2[0-9]1[0-2]20[0-9][0-9]' or FCHCM like '2[0-9]1[0-2]2100' or FCHCM like '3[0-1][1-9]190[3-9]' or FCHCM like '3[0-1][1-9]19[1-9][0-9]' or FCHCM like '3[0-1][1-9]20[0-9][0-9]' or FCHCM like '3[0-1][1-9]2100' or FCHCM like '3[0-1]1[0-2]190[3-9]' or FCHCM like '3[0-1]1[0-2]19[1-9][0-9]' or FCHCM like '3[0-1]1[0-2]20[0-9][0-9]' or FCHCM like '3[0-1]1[0-2]2100'),
    primary key(RFC, MATRI),
    foreign key(RFC) references Propietario(RFC),
    foreign key(MATRI) references Avion(MATRI)
);
    
    