SELECT *
FROM SCOTT.EMP
WHERE (DEPTNO, HIREDATE) IN (
        select 
        E.deptno DEPARTAMENTO,
        MIN(E.HIREDATE) FECHA
        FROM scott.emp E
        GROUP BY E.deptno
    );
