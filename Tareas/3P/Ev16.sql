use avion;
select m.IDMOD as 'Clave del modelo', m.NOMMD as 'Modelo', count(a.IDMOD)as 'Número de aviones' from Modelo as M
left join Avion as A on m.IDMOD = a.IDMOD
group by NOMMD,m.IDMOD;

