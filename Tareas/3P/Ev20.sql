USE avion;
BEGIN TRANSACTION EVIDENCIA
insert into avion values ('AA345',122334,11112021,1)
IF @@ERROR>0 GOTO DESHACER
insert into avion values ('AA346',122335,11112021,2)
IF @@ERROR>0 GOTO DESHACER
COMMIT TRANSACTION EVIDENCIA

DESHACER:
ROLLBACK TRANSACTION EVIDENCIA
PRINT'UPS, HA OCURRIDO UN ERROR'

