 select *
 from culldeampolla.proveedor p  in 
( SELECT  distinct   Idproveedor 
FROM culldeampolla.ventas v
inner join culldeampolla.gafas g
on  v.Idgafas  =     g.Idgafas 
)

