
select * from  culldeampolla.gafas 
where idgafas in (
SELECT  distinct( IdGafas)  FROM culldeampolla.ventas 
where  idempleado = 10001 and 
fechafactura >= '2023-01-01' and fechafactura <=  '2023-12-31'
)
 