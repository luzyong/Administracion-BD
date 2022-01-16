create database examen;
use examen;
use examen;
select * from Vendedor;
insert into Comprador (CPRCVE,CPRNOM,CPRDIR,CPRSTS,CPRFCH) values(123463,'Marco Yong','Avenida Siempre Viva #1000',1,15012021);
insert into Vendedor (VENCVE,VENNOM,VENDIR,VENEDO,VENCIU,VENPAI,VENTEL,VENCON,RFC) values(112235,'María Rodríguez','Avenida Arces 800','EMX','ALO','MEX',5566778899,'mariavendedor@gmail.com','ROYM9903016TR');
update Vendedor set VENEDO = 'CMX' where VENEDO ='DF';
select * from Comprador order by CPRNOM,CPRFCH;
alter table Departamentos alter column DPTDES char(120);

select  CPRFCH, count(CPRCVE) from  Comprador group by CPRFCH;