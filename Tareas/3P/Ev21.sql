USE avion;

BEGIN TRANSACTION EVIDENCIA
select idmod as 'clave', nommd as 'nombre',capaci as'capacidad',peso from modelo
if @@ERROR>0 rollback
commit transaction EVIDENCIA


