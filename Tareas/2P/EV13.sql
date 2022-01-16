--Yong Rodríguez Luz María
use aviones;
select  Modelo.NOMMD as 'Modelo', count(Avion.IDMOD) as'Numero de aviones' from  Avion
	inner join Modelo on Modelo.IDMOD=Avion.IDMOD 
	group by Modelo.NOMMD