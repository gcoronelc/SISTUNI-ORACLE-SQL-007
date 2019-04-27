-- Caso 01: Forma Simple
select *
from SCOTT.dept d, SCOTT.emp e
where ( d.deptno = e.deptno )
and   ( d.deptno in (10,20) );


-- Caso 02: Natural Join
-- Esta basado en nombre de columnas iguales
select *
from SCOTT.dept 
NATURAL JOIN scott.emp 
where ( deptno in (10,20) )
order by 1;


-- Caso 3: Join - Using
-- Se indica la columna en comun
select *
from SCOTT.dept 
JOIN scott.emp USING (deptno)
where ( deptno in (10,20) )
order by 1;



-- Caso 4: Join - ON
-- Se tiene que indicar la condición de combinación
select *
from SCOTT.dept d
JOIN scott.emp e ON ( d.deptno = e.deptno )
where ( d.deptno in (10,20) )
order by 1;


-- Caso 5: Producto Cartesiano
-- Tabla1 X Tabla2
select *
from SCOTT.dept, scott.emp;

-- Ejercicio 1
-- Consultar los datos de todos los departamentos,
-- He indice la cantidad de empleados en cada uno de ellos.

-- Sol A
-- DELETE PLAN_TABLE;
-- EXPLAIN PLAN FOR 
select d.deptno, d.dname, d.loc, count(e.empno) empleados
from scott.dept d 
left join scott.emp e  on d.deptno = e.deptno 
group by d.deptno, d.dname, d.loc;

-- Sol B
-- DELETE PLAN_TABLE;
-- EXPLAIN PLAN FOR 
with 
v1 as (
    select deptno, count(1) empleados
    from scott.emp
    group by deptno
)
select d.deptno, d.dname, d.loc, nvl(v1.empleados,0) empleados
from scott.dept d 
left join v1 on d.deptno = v1.deptno;

/*
SELECT 
  SUBSTR (LPAD(' ', LEVEL-1) || OPERATION || ' (' || OPTIONS || ')',1,30 ) "OPERACION", 
  OBJECT_NAME "OBJETO"
FROM PLAN_TABLE 
START WITH ID = 0 
CONNECT BY PRIOR ID=PARENT_ID;
*/

-- Ejercicio 02
/*
De cada sucursal se necesita la siguiente infoemación:

 - Datos de la sucursal.
 - Cantidad de cuentas en soles
 - Importe en soles
 - Cantidad de cuentas dolares
 - Importe en dolares
*/

SELECT 
    S.CHR_SUCUCODIGO "CODIGO",
    S.VCH_SUCUNOMBRE "NOMBRE",
    SUM(CASE C.CHR_MONECODIGO WHEN '01' THEN 1 ELSE 0 END) "CTAS. SOLES",
    SUM(CASE C.CHR_MONECODIGO WHEN '01' THEN C.DEC_CUENSALDO ELSE 0 END) "IMPORTE SOLES",
    SUM(CASE C.CHR_MONECODIGO WHEN '02' THEN 1 ELSE 0 END) "CTAS. DOLARES",
    SUM(CASE C.CHR_MONECODIGO WHEN '02' THEN C.DEC_CUENSALDO ELSE 0 END) "IMPORTE DOLARES"
FROM EUREKA.SUCURSAL S 
JOIN EUREKA.CUENTA C ON S.CHR_SUCUCODIGO = C.CHR_SUCUCODIGO
GROUP BY S.CHR_SUCUCODIGO, S.VCH_SUCUNOMBRE;

SELECT * FROM EUREKA.CUENTA;



SELECT * FROM SCOTT.salgrade;

/*
1	700	    1200
2	1201	1400
3	1401	2000
4	2001	3000
5	3001	9999
*/

SELECT * FROM SCOTT.EMP;

SELECT E.EMPNO, E.ENAME, E.SAL, G.GRADE
FROM SCOTT.EMP E
JOIN SCOTT.salgrade G ON E.SAL BETWEEN G.LOSAL AND G.HISAL;




