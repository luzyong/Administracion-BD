create view ServiciosView (CodigoServicio, RFC, Matricula, Fecha, Horas) 
as select CODTJ, MATRI, RFC, FECHA, HORAS from Servicio
where FECHA like '%2021';

