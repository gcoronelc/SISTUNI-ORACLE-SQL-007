-- COUNT

SELECT COUNT(*) FILAS FROM SCOTT.EMP;

SELECT COUNT(10) FILAS FROM SCOTT.EMP;

SELECT COUNT(empno) FILAS FROM SCOTT.EMP;

SELECT COUNT(comm) "DATOS NO NULOS" FROM SCOTT.EMP;


-- SUM

SELECT SUM(SAL) PLANILLA_SUELDOS FROM SCOTT.EMP;

SELECT SUM(COMM) PLANILLA_COMISIONES FROM SCOTT.EMP;


SELECT NVL(SUM(SAL),0) "PLANILLA SUELDOS DEPTNO 500" 
FROM SCOTT.EMP 
WHERE DEPTNO = 500;


-- Planilla del departamento 10, en SCOTT.

SELECT SUM(SAL) PLANILLA_SUELDOS 
FROM SCOTT.EMP
WHERE DEPTNO = 20;


-- Ejercicio
-- Se necesita saber cuánto es la planilla por cada departamento.

SELECT 
    DEPTNO DEPARTAMENTO,
    SUM(SAL) PLANILLA_SUELDOS 
FROM SCOTT.EMP
GROUP BY DEPTNO;


-- Ejercicio
-- Se necesita saber quiénes son los empleados que 
-- tienen el más alto salario por departamento.

-- 1
SELECT 
    DEPTNO DEPARTAMENTO,
    MAX(SAL) SALARIO_MAXIMO 
FROM SCOTT.EMP
GROUP BY DEPTNO;

-- 2
SELECT * 
FROM SCOTT.EMP 
WHERE (DEPTNO,SAL) IN (SELECT 
                            DEPTNO DEPARTAMENTO,
                            MAX(SAL) SALARIO_MAXIMO 
                        FROM SCOTT.EMP
                        GROUP BY DEPTNO);


-- Ejercicio
-- Por departamento se necesita saber quiénes son 
-- los empleados que tienen mayor tiempo en la empresa.

WITH 
V1 AS (
    select 
    E.deptno DEPARTAMENTO,
    MIN(E.HIREDATE) FECHA
    FROM scott.emp E
    GROUP BY E.deptno
)
SELECT *
FROM SCOTT.EMP
WHERE (DEPTNO, HIREDATE) IN (SELECT DEPARTAMENTO, FECHA FROM V1);


-- Ejercicio
-- Se necesita saber que departamentos tienen una planilla superior a 50,000.
-- Esquema HR.

select 
    department_id,
    sum(salary * (1 + nvl(commission_pct,0))) planilla
from HR.employees
where department_id is not null
group by department_id
HAVING sum(salary * (1 + nvl(commission_pct,0))) > 50000;


with 
v1 as (
    select 
        department_id,
        sum(salary * (1 + nvl(commission_pct,0))) planilla
    from HR.employees
    where department_id is not null
    group by department_id
)
select department_id, planilla 
from v1 
where planilla > 50000;





