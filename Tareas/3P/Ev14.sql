use avion;
select a.MATRI as 'Avion', a.NOREG as 'Número de registro',FCHCM as 'Fecha de compra', NOMMD as 'Modelo', NOLUG as 'Lugar', CODHN as 'Hangar',p.RFC as 'Clave de propietario' ,RTRIM(NOMBR)+' '+RTRIM(APPAT)+' '+APMAT as 'Propietario', DIR as 'Dirección del propietario' from Avion as A
left join Lugar as B on a.MATRI = b.MATRI
left join Propiedad as P on a.MATRI = p.MATRI
left join Propietario as O on p.RFC = o.RFC
left join Persona as N on p.RFC = n.RFC
join Modelo as M on a.IDMOD = m.IDMOD;

