--INSERT

INSERT INTO SCOTT.EMP(EMPNO, ENAME, SAL)
VALUES( 7777, 'Leonor', 87456 );

SELECT * FROM SCOTT.EMP;

commit;

-- Crear una nuava tabla a partir de SCOTT.EMP

create table SCOTT.EMP2 as
( select * from SCOTT.EMP where EMPNO > 99999 );


select * from SCOTT.EMP2;

insert into SCOTT.EMP2
select * from scott.emp where sal > 4500;

insert into scott.emp2( empno, ename,  sal )
select sq_algo.nextval, 'EMP ' || rownum, rownum
from dual 
where rownum < 10000
connect by level > 0;


-- UPDATE

SELECT * FROM SCOTT.EMP2;

UPDATE SCOTT.EMP2
SET SAL = 8971;

-- Actualizar la tabla EMP con los valores de EMP2

SELECT * FROM SCOTT.EMP;

update scott.emp e
set sal = (select sal from scott.emp2 e2 where e.empno = e2.empno)
where empno in (select empno from scott.emp2);

select * from eureka.cuenta where chr_cuencodigo='00100002';

select * from eureka.movimiento where chr_cuencodigo='00100002';

SELECT * FROM SCOTT.EMP FOR UPDATE;











