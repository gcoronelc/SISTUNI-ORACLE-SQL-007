/*
Se necesita saber quien o quienes son los empleados que tienen mayor salario por departamento
Esquema: RECURSOS
*/

WITH v1 AS (
    SELECT
        iddepartamento,
        MAX(sueldo) sueldo_max
    FROM RECURSOS.empleado 
    GROUP BY iddepartamento
)
SELECT * 
FROM 
    RECURSOS.empleado e
    JOIN v1 ON e.iddepartamento = v1.iddepartamento
    AND e.sueldo = v1.sueldo_max