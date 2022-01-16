use avion
create procedure model
@modelo char(20)
as
select matri, noreg, fereg from avion as A  
join modelo as M on a.idmod = m.idmod where nommd = @modelo

exec model 'Grumman'

