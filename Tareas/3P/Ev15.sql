use avion;
select d.RFC,NLIC as 'Número de licencia',RTRIM(NOMBR)+' '+RTRIM(APPAT)+' '+RTRIM(APMAT) as 'Nombre',  nomtip as 'Tipo de avión autorizado' from Piloto as D
join Autorizacion as A on a.RFC = d.RFC
join Persona as P on a.RFC = p.RFC
join Tipo as T on a.idtipo = t.idtip
where APPAT like '_a%';