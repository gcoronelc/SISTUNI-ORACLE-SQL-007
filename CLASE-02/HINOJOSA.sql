
--Cristofer Hinojosa
---29025	14
SELECT
    nvl(sum(sal),0) SAL_TOT,
    nvl(sum(comm),0) COM_TOT,
    COUNT(empno) EMP_TOT,
    round(nvl(sum(sal),0) / COUNT(empno),4) SAL_PROM,
    round(nvl(sum(comm),0) / COUNT(empno),4) COM_PROM
FROM SCOTT.emp;