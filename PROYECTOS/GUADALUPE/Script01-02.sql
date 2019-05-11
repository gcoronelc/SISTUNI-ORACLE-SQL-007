-- Proponer 10 requerimientos de datos (consultas) simples con su respectiva solución.
--1 Mostrar los datos de todos los pedidos que se realizaron en Abril
SELECT P.*
FROM PEDIDO P
WHERE to_char(P.ped_fechaini, 'mm') = '04';

--2 Mostrar los datos mas importantes de los PEDIDOS realizados por los usuarios 1 y 2 (Informacion Concatenada)
select P.usu_id||'-'||P.ped_descripcion||'-'||P.ped_cantidad||'-'||P.ped_estado AS "DETALLE DEL PEDIDO"
from PEDIDO P
where P.usu_id in (1,2);

--3 Mostrar la minima cantidad de productos en un pedido, segun el usuario en el mes de Marzo
SELECT P.usu_id USUARIO,MIN(P.ped_cantidad) "MIN CANTIDAD", to_char(P.ped_fechaini, 'dd/mm/yy') "FECHA INI"
FROM PEDIDO P
WHERE TO_CHAR(P.ped_fechaini, 'mm') = '03'
GROUP BY P.usu_id, to_char(P.ped_fechaini, 'dd/mm/yy')
ORDER BY P.USU_ID;

--4 Mostrar la suma de los precios que tiene cada contrato, segun el usuario los dias 20 de cada mes
select C.usu_id USUARIO, sum(C.con_precio) "SUM PRECIOS", to_char(C.con_fecha, 'dd/mm/yy') "FECHA CONT"
from CONTRATO C
WHERE TO_CHAR(C.con_fecha, 'dd') = '20'
GROUP BY C.usu_id, to_char(C.con_fecha, 'dd/mm/yy')
ORDER BY C.USU_ID;

--5 Mostrar la cantidad en soles, minima, maxima y el promedio, segun las facturas emitidas.
select MIN(F.FAC_APAGAR) "MINIMO SOLES", MAX(F.FAC_APAGAR) "MAXIMO SOLES", AVG(F.FAC_APAGAR) "PROMEDIO SOLES"
from FACTURA F;

--6 Mostrar las FACTURAS que tienen un SALDO A PAGAR menor a 600(Considerando solo las 5 primeras facturas almacenadas en la BD):
select fac_id "ID FACTURA", fac_fecha "FECHA FAC", fac_descripcion "DESCRIPCION FAC"
from FACTURA
where (con_id in (1,2,3,4,5) and fac_apagar < 600);

--7 Mostrar la cantidad de Pedidos que existen, segun sus estados.
select count(*) CANTIDAD, P.ped_estado ESTADO
from PEDIDO P
group by P.ped_estado
order by CANTIDAD;

--8 Mostrar la cantidad de Productos que pertenecen a MOLITALIA
SELECT COUNT(*) "CANT PRODUCTOS", 'MOLITALIA' AS COMPAÑIA
FROM PRODUCTO PR
WHERE UPPER(PR.prd_descripcion) like '%MOLITALIA%'
GROUP BY 'MOLITALIA';

--9 Mostrar el promedio de facturas segun las fechas que fueron emitidas, considerar solo 2 decimales
SELECT F.FAC_fecha FECHA, ROUND(AVG(F.FAC_PRECIO),2) PROMEDIO
FROM FACTURA F
GROUP BY F.FAC_FECHA
ORDER BY FECHA;

--10 Mostrar la cantidad de contratos que realizaron los usuarios el 25/04/19
SELECT C.USU_ID USUARIO, COUNT(*) "N° CONTRATOS", c.con_fecha "Fecha"
FROM CONTRATO C
WHERE to_date(C.con_fecha, 'dd/mm/yy') = '25/04/19'
GROUP BY C.USU_ID, c.con_fecha
ORDER BY USUARIO;

-- Proponer 10 requerimientos de datos (consultas) complejas con su respectiva solución.
--1 Mostrar los usuarios segun su SEDE, considerando que debe ser diferente a LIMA
SELECT S.SED_NOMBRE, U.USU_NOMBRE, U.USU_DIRECCION, U.USU_TELEFONO
FROM SEDE S, USUARIO U
WHERE S.SED_NOMBRE != 'LIMA'
AND S.SED_ID = U.SED_ID;

--2 Mostrar los PEDIDOS que tienen algun producto que contenga la palabra LECHE:
select PD.ped_id "ID PEDIDO", PD.ped_descripcion "DESC PEDIDO", P.prd_nombre "NOMBRE PROD"
from PEDIDO PD
join PRODUCTO P
on PD.prd_id = P.prd_id
where UPPER(P.prd_nombre) like '%LECHE%';

--3 Mostrar el nombre de las sedes que tienen solo 2 usuarios registrados
select S.sed_nombre as SEDE, count(*) as "CANTIDAD USUARIOS"
from USUARIO U
join SEDE S
on U.sed_id = S.sed_id
group by S.sed_nombre
having count(*) = 2;

--4 Mostrar la cantidad de FACTURAS emitidas por cada SEDE existente
SELECT S.SED_NOMBRE "NOMBRE SEDE", COUNT(*) "CANTIDAD FAC"
FROM FACTURA f
JOIN CONTRATO C
ON F.CON_ID = C.CON_ID
JOIN USUARIO U
ON C.USU_ID = U.USU_ID
JOIN SEDE S
ON U.SED_ID = S.SED_ID
GROUP BY S.SED_NOMBRE;

--5 Listar todos los proveedores que pertenezcan a MOLITALIA
SELECT *
FROM PROVEEDOR P
WHERE (P.COM_ID) IN
(SELECT C.COM_ID
FROM COMPANIA C
WHERE UPPER(C.COM_NOMBRE) = 'MOLITALIA');

--6 Mostrar los datos del pedido y calificar si fue CONCLUIDO o NO
SELECT P.PED_DESCRIPCION "DESC PEDIDO", P.PED_CANTIDAD "CANT PEDIDO", P.PED_FECHAINI "FECHA INI",
(CASE
WHEN P.PED_ESTADO = 'ENTREGADO' THEN 'SI'
ELSE 'NO'
END) AS "CONCLUIDO?"
FROM PEDIDO P;

--7 Mostrar cual fue la factura que tuvo el mayor monto a pagar y quien fue el usuario responsable de ella.
SELECT U.USU_NOMBRE "NOM USUARIO", FF.FAC_ID "ID FACTURA", FF.CON_ID "ID CONTRATO", FF.FAC_DESCRIPCION "DESCRIPCION FAC", FF.FAC_APAGAR "TOTAL A PAGAR"
FROM FACTURA FF
JOIN CONTRATO C
ON FF.CON_ID = C.CON_ID
JOIN USUARIO U
ON C.USU_ID = U.USU_ID
WHERE FF.FAC_APAGAR =(
SELECT MAX(F.FAC_APAGAR)
FROM FACTURA F);

--8 Mostrar las facturas que tienen el monto a pagar mayor a 600 y las facturas emitidas el 25/04/2019
SELECT F.FAC_ID "ID FACTURA", F.FAC_DESCRIPCION "DESC FACTURA", F.FAC_FECHA "FEC FACTURA", F.FAC_APAGAR "TOTAL A PAGAR"
FROM FACTURA F
WHERE F.FAC_APAGAR > 600
UNION
SELECT F.FAC_ID, F.FAC_DESCRIPCION, F.FAC_FECHA, F.FAC_APAGAR
FROM FACTURA F
WHERE to_date(F.FAC_FECHA, 'dd/mm/yy') = '25/04/19';

--9 Mostrar todos los datos del producto que fue mas pedido por los usuarios:
WITH
V1 AS(
SELECT COUNT(*), P.PRD_ID AS PRD
FROM PEDIDO P
GROUP BY P.PRD_ID)
SELECT *
FROM PRODUCTO P
JOIN V1
ON P.PRD_ID = V1.PRD;

--10 Mostrar el maximo monto en soles que se ha pedido por cada usuario, agregando la columna CLASIFICACION, en el que si el monto es menor a 500, sera considerado BAJO, si es menor a 1000 sera considerado REGULAR y si es mayor o igual a 1000 sera considerado ALTO:
with
v1 as(
select max(C.con_precio) MAX_PREC, C.usu_id USU
from CONTRATO C
GROUP BY C.usu_id
)
select u.usu_nombre "NOM USUARIO", v1.MAX_PREC "MAX MONTO",
case
when v1.MAX_PREC < 500 then 'BAJO'
when v1.MAX_PREC < 1000 then 'REGULAR'
when v1.MAX_PREC >= 1000 then 'ALTO'
end as CALIFICACION
from v1
join USUARIO u
on v1.USU = u.usu_id
ORDER BY u.usu_nombre;
