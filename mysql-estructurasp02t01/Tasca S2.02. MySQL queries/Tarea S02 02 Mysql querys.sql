

-- 01
select nombre from tienda.producto;

-- 02

select nombre, precio  from tienda.producto;
-- 03

select * from tienda.producto;


-- 04
select nombre, precio, round(precio*1.00,2) as dolars from tienda.producto;
-- 05
select nombre as nombre_del_producto, precio as euros , round(precio*1.00,2) as dolars from tienda.producto;
-- 06

select  ucase(nombre) , precio from tienda.producto;
-- 07

select Lcase(nombre) , precio from tienda.producto;
-- 08
select ucase(nombre) as nombre_del_fabricante, left( ucase(nombre),2) as dos_iniciales  from   tienda.fabricante;
-- 09
select ucase(nombre) , round(precio) from tienda.producto;
-- 10
select nombre , truncate(precio,0) from tienda.producto;
-- 11
select  f.codigo from tienda.fabricante f inner join tienda.producto p on f.codigo = p.codigo_fabricante;
-- 12
select distinct f.codigo from tienda.fabricante f inner join tienda.producto p on f.codigo = p.codigo_fabricante;
-- 13
select nombre from tienda.fabricante order by nombre asc;
-- 14
select nombre from tienda.fabricante order by nombre desc;
-- 15 ---Aqui lo hago en una select el ordenador descenciendo el precio
select nombre, precio from tienda.producto order by nombre asc, precio desc;
-- 16
select nombre from tienda.fabricante limit 5;
-- 17

-- 18
select nombre, precio from tienda.producto order by precio asc limit 1;
-- 19
select nombre ,precio from tienda.producto order by precio desc limit 1;
-- 20
select nombre from tienda.producto where codigo_fabricante = 2;
-- 21
select p.nombre as producto, precio, f.nombre as fabricante from tienda.producto p inner join tienda.fabricante f on f.codigo = p.codigo_fabricante;

-- 22
select p.nombre as producto , precio, f.nombre as fabricante from tienda.producto p inner join tienda.fabricante f on f.codigo = p.codigo_fabricante order by fabricante asc;

-- 23
select p.codigo,p.nombre as producto, precio, f.nombre as fabricante ,f.codigo as codigo_fabricante from tienda.producto p inner join tienda.fabricante f on f.codigo = p.codigo_fabricante;
-- 24

SELECT  min(a.precio)  as precio_minimo , a.nombre , b.nombre   FROM  tienda.producto a inner join tienda.fabricante b  on a.codigo_fabricante = b.codigo;

-- 25


SELECT  max(a.precio)  as precio_minimo , a.nombre , b.nombre   FROM  tienda.producto a inner join tienda.fabricante b  on a.codigo_fabricante = b.codigo;
-- 26   Buscanmos por el nombre del fabricante o directamente por nombre
SELECT   a.nombre     FROM  tienda.producto a where  a.codigo_fabricante = 2;
SELECT    a.nombre     FROM  tienda.producto a inner join tienda.fabricante b  on a.codigo_fabricante = b.codigo where b.codigo in ( select codigo from tienda.fabricante where nombre = 'Lenovo');
-- 27

SELECT    a.nombre     FROM  tienda.producto a inner join tienda.fabricante b  on a.codigo_fabricante = b.codigo where  precio > 200 and    b.codigo in ( select codigo from tienda.fabricante where nombre = 'Crucial');
SELECT   a.nombre     FROM  tienda.producto a where  a.codigo_fabricante = 6 and precio > 200 ;
-- 28     ojo en el documento del ejercicio los nombres de los FABRICANTES ESTAN     ****mal****

SELECT    a.nombre     FROM  tienda.producto a inner join tienda.fabricante b  on a.codigo_fabricante = b.codigo where     b.codigo in ( select codigo from tienda.fabricante where nombre = 'Asus' or  nombre = 'Hewlett-Packard' );
SELECT   a.nombre     FROM  tienda.producto a where  a.codigo_fabricante = 3  or  codigo_fabricante = 1 ;
-- 29

SELECT    a.nombre     FROM  tienda.producto a inner join tienda.fabricante b  on a.codigo_fabricante = b.codigo  where     b.codigo in ( select codigo from tienda.fabricante where nombre IN ( 'Asus' ,   'Hewlett-Packard') );
SELECT   a.nombre     FROM  tienda.producto a where  a.codigo_fabricante IN ( 3, 1) ;

-- 30

SELECT    a.nombre     FROM  tienda.producto a inner join tienda.fabricante b  on a.codigo_fabricante = b.codigo where     b.codigo in ( select codigo from tienda.fabricante where nombre like '%e' );

-- 31

SELECT    a.nombre ,a.precio    FROM  tienda.producto a inner join tienda.fabricante b  on a.codigo_fabricante = b.codigo where     b.codigo in ( select codigo from tienda.fabricante where nombre like '%w%' );

--  32

select p.nombre as producto, precio, f.nombre as fabricante from tienda.producto p inner join tienda.fabricante f on f.codigo = p.codigo_fabricante where precio >= 180 order by precio asc;
select p.nombre as producto, precio, f.nombre as fabricante from tienda.producto p inner join tienda.fabricante f on f.codigo = p.codigo_fabricante where precio >= 180 order by precio desc;

--   33

select  codigo , nombre   from tienda.fabricante    where codigo in ( select codigo_fabricante from  tienda.producto);

-- 34 los  fabricantes sin productos los tendran a null ( tendria que poderse cambia a "" o espacios

select p.nombre as producto, precio, f.nombre as fabricante from tienda.producto p  right  join tienda.fabricante f on f.codigo = p.codigo_fabricante  ;

-- 35

select   f.nombre as fabricante from tienda.producto p  right  join tienda.fabricante f on f.codigo = p.codigo_fabricante  where p.nombre IS NULL;


--------------------------------------------
-- base de  datos universidad 
--------------------------------------------


-- 01
select distinct apellido1, apellido2, nombre from universidad.persona u inner join universidad.alumno_se_matricula_asignatura a on u.id = a.id_alumno order by apellido1 asc,apellido2 asc, nombre asc;

-- 02
select distinct apellido1, apellido2, nombre from universidad.persona u inner join universidad.alumno_se_matricula_asignatura a on u.id = a.id_alumno  and u.telefono IS NULL order by apellido1 asc,apellido2 asc, nombre asc;

-- 03
select distinct apellido1, apellido2, nombre from universidad.persona u inner join universidad.alumno_se_matricula_asignatura a on u.id = a.id_alumno  and YEAR(u.fecha_nacimiento) = 1999 order by apellido1 asc,apellido2 asc, nombre asc;

-- 04
select * from universidad.persona p inner join universidad.profesor f on p.id = f.id_profesor and p.telefono IS NULL and RIGHT(NIF,1) = 'k';
-- 05
select nombre, creditos, tipo from  universidad.asignatura where id_grado = 7 and curso = 3 and cuatrimestre = 1;
-- 06
select apellido1,apellido2, p.nombre ,d.nombre  from universidad.persona p inner join universidad.profesor f  inner join universidad.departamento d on d.id = f.id_departamento on p.id = f.id_profesor order by apellido1 asc,apellido2 asc, p.nombre asc;

-- 07
select apellido1, apellido2, p.nombre  ,anyo_inicio,anyo_fin,s.nombre from universidad.alumno_se_matricula_asignatura a inner join curso_escolar c on a.id_curso_escolar = c.id inner join universidad.asignatura s on s.id = a.id_asignatura inner join universidad.persona p on p.id = a.id_alumno and p.nif = '26902806M';
-- 08
select nombre from universidad.departamento where id in ( select distinct id_departamento from universidad.asignatura a inner join universidad.profesor p on p.id_profesor = a.id_profesor where id_grado = 4);
-- 09
select distinct apellido1,apellido2, p.nombre from universidad.alumno_se_matricula_asignatura a inner join curso_escolar c on a.id_curso_escolar = c.id and c.anyo_inicio = 2018 and c.anyo_fin = 2019 inner join universidad.asignatura s on s.id = a.id_asignatura inner join universidad.persona p on p.id = a.id_alumno;

--------------------------------------------
--  Consultas con LEFT JOIN y RIGHT JOIN.
--------------------------------------------

-- 1

-- 2  En este ejemplo todos los profesores (12) tienen departamento asignado y la consulta da cero
SELECT * FROM universidad.persona a left join universidad.profesor  b on a.id = b.id_profesor where a.tipo = 'profesor';
-- 3 
SELECT Nombre  FROM universidad.departamento a left join universidad.profesor   b on a.id = b.id_departamento  where id_profesor IS NULL;
-- 4
SELECT * FROM universidad.persona where id in (SELECT distinct B.ID_PROFESOR FROM universidad.asignatura a right  join universidad.profesor b    on a.id_profesor = b.id_profesor  where id IS NULL);
-- 5
SELECT ID, NOMBRE  FROM universidad.asignatura a left join universidad.profesor b on a.id_profesor = b.id_profesor where b.Id_profesor IS NULL;
-- 6
SELECT min(fecha_nacimiento) , nombre, apellido1, apellido2 FROM universidad.alumno_se_matricula_asignatura a inner join universidad.persona b on a.id_alumno = b.id;
-- 7


--------------------------------------------
-- CONSULTAS  RESUMEN 
--------------------------------------------


-- 01
select count(*) from universidad.persona where id in ( select distinct a.id_alumno from universidad.persona p inner join universidad.alumno_se_matricula_asignatura  a on a.id_alumno = p.id);

-- 02

select count(*)  from universidad.persona where Year(fecha_nacimiento) = 1999 and id in (   select distinct a.id_alumno from universidad.persona p inner join universidad.alumno_se_matricula_asignatura a on a.id_alumno = p.id);

-- 03
select nombre, count(*) as profesores from universidad.profesor p inner join universidad.departamento d on d.id = p.id_departamento group by nombre order by profesores desc;

-- 04
select nombre, count(id_profesor) as profesores from universidad.profesor p right  join universidad.departamento d on d.id = p.id_departamento group by nombre;

-- 05

select g.nombre , count(a.id) as Numero_Asignaturas from universidad.asignatura a right join grado g on g.id = a.id_grado group by g.nombre order by Numero_asignaturas desc;
-- 06
select g.nombre , count(a.id) as Numero_Asignaturas from universidad.asignatura a right join grado g on g.id = a.id_grado group by g.nombre having count(a.id) > 40;


-- 07    Suma de creditos por cada tpo ) basica..etc )
select g.nombre , a.tipo, sum(creditos) as Total_creditos from universidad.asignatura a inner  join grado g on g.id = a.id_grado group by g.nombre ,a.tipo;

-- 08
SELECT anyo_inicio  , count( distinct id_alumno ) FROM universidad.curso_escolar c inner join universidad.alumno_se_matricula_asignatura a  on c.id = a.id_curso_escolar group by anyo_inicio;

-- 09


-- 10
select * from universidad.persona where tipo = 'alumno' and fecha_nacimiento in ( SELECT min(fecha_nacimiento)   fROM universidad.alumno_se_matricula_asignatura a inner join universidad.persona b on a.id_alumno = b.id );


-- 11
SELECT * FROM universidad.profesor a left join universidad.asignatura b  on a.id_profesor =  b.id_profesor  where b.id is null and id_departamento is not null;
