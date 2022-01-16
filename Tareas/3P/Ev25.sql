use avion
--Creación de tabla de las horas totaes de servicio
create table servicio_total(
avion char(5) not null,
horas decimal(8,0) not null)
--Trigger servicios
create trigger servicios
on servicio
for insert
as
declare
@avion char(5),
@horas decimal(8,0)
begin try
set @avion = (select matri from inserted)
set @horas = (select sum(horas) from servicio where matri=@avion)
if exists(select avion from servicio_total where avion=@avion) update servicio_total set horas=@horas where avion=@avion
else insert into servicio_total values(@avion,@horas) 
end try
begin catch
rollback
end catch



