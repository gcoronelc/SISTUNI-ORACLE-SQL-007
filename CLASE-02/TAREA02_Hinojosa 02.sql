/*  Ejercicio
    Por departamento se necesita saber qui�nes son los empleados que tienen mayor tiempo en la empresa.
*/
WITH 
DEP_FEC AS (
    SELECT
    MIN(HIRE_DATE) HIRE_DATE,
    DEPARTMENT_ID 
    FROM HR.employees
    GROUP BY DEPARTMENT_ID 
)
SELECT e.*
FROM
    HR.employees e
    JOIN DEP_FEC d on d.hire_date = e.hire_date and d.DEPARTMENT_ID = e.DEPARTMENT_ID
ORDER BY e.department_id