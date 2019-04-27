-- Ejercicio 01
-- ---------------------------------------------------
-- Consultar los empleados cuyo ingreso (salario + comisión) 
-- supera los 2500.
-- Esquema: SCOTT

SELECT E.*,  (SAL + NVL(COMM,0)) INGRESOS
FROM SCOTT.EMP E
WHERE (SAL + NVL(COMM,0)) > 2500;


-- Ejercicio 02
-- ---------------------------------------------------
-- Desarrollar una consulta que permita ver el tiempo 
-- de servicio en meses de los empleados. 
-- Esquema: SCOTT
-- Función: MONTHS_BETWEEN

select 
    e.*, 
    ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE),0) TIEMPO_MESES
from scott.emp e;


-- Ejercicio 03
-- ---------------------------------------------------
-- Desarrollar una consulta que permita tener un listado 
-- de los empleados que no tienen comisión.







