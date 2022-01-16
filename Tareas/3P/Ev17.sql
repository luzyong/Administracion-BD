use avion;
select a.MATRI as 'Matricula Avion', NOREG as 'Número de registro', NOMMD as 'Modelo', CODTJ as 'Clave de trabajo', FECHA, HORAS, RTRIM(NOMBR)+' '+RTRIM(APPAT)+' '+APMAT as 'Persona que realizó el servicio' from Avion as A
join Modelo as M on a.IDMOD = m.IDMOD
left join Servicio as S on a.MATRI = s.MATRI
left join Persona as P on s.RFC = P.RFC
order by a.MATRI,s.FECHA;

