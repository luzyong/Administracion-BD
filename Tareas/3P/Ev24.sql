use avion
--Tabla bitácora de cambios update
create table per_bita(
ID_rfc char(13) not null ,
nom_ant char(20) not null,
app_ant char(20) not null,
apm_ant char(20) not null,
tel_ant decimal(10,0) not null,
dir_ant char(80) not null,
nom_nvo char(20) not null,
app_nvo char(20) not null,
apm_nvo char(20) not null,
tel_nvo decimal(10,0) not null,
dir_nvo char(80) not null,
--fna_nvo decima(8) not null,
fechor datetime not null,
primary key(ID_rfc,fechor)
)
--Trigger para update
create trigger actualiza
on persona
for update
as
declare
@rfc char(13),
@nomant char(20),
@appant char(20),
@apmant char(20),
@telant decimal(10,0),
@dirant char(80),
@nomnvo char(20),
@appnvo char(20),
@apmnvo char(20),
@telnvo decimal(10,0),
@dirnvo char(80)
--@fna decimal(8),
begin try
set @rfc = (select rfc from inserted)
set @nomant = (select d.nombr from deleted as d join inserted as i on d.rfc=i.rfc)
set @appant = (select d.appat from deleted as d join inserted as i on d.rfc=i.rfc)
set @apmant = (select d.apmat from deleted as d join inserted as i on d.rfc=i.rfc)
set @telant = (select d.tel from deleted as d join inserted as i on d.rfc=i.rfc)
set @dirant = (select d.dir from deleted as d join inserted as i on d.rfc=i.rfc)
set @nomnvo = (select nombr from persona where rfc=@rfc)
set @appnvo = (select appat from persona where rfc=@rfc)
set @apmnvo = (select apmat from persona where rfc=@rfc)
set @telnvo = (select tel from persona where rfc=@rfc)
set @dirnvo = (select dir from persona where rfc=@rfc)
--set @fna = (select rfc from inserted) no recuerdo qué significaba este valor, así que no lo puse
insert into per_bita values(@rfc,@nomant,@appant,@apmant,@telant,@dirant,@nomnvo,@appnvo,@apmnvo,@telnvo,@dirnvo,GETDATE())
end try

begin catch
rollback
end catch
