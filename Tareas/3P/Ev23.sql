use avion
create procedure hangr
as
select h.codhn, locali, count(matri) as 'no. aviones' from hangar as H
join lugar as L on l.codhn = h.codhn
group by h.codhn,locali

exec hangr 

