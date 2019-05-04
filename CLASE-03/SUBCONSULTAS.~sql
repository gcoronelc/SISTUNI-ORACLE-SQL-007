-- Subconsulta Escalar
/*
Mostrar todos los empleados que tienen su
salario mayor que el salario promedio.
Esquema: HR
*/

select avg(salary) sal_prom from hr.employees;

select e.*, (select avg(salary) sal_prom from hr.employees) sal_prom
from hr.employees e
where e.salary > (select avg(salary) sal_prom from hr.employees);

-- Subconsultas con el operador IN
/*
Se necesita saber que departamentos tienen menos de 5 empleados.
Esquema: RECURSOS
*/

select iddepartamento, count(1) emps
from recursos.empleado
group by iddepartamento;

with 
v1 as (
  select iddepartamento, count(1) emps
  from recursos.empleado
  group by iddepartamento
  having count(1) >= 5
)
select * 
from recursos.departamento
where iddepartamento not in (select iddepartamento from v1);



-- Subconsultas como tabla verivada
/*
Consultar los empleados que trabajan en Arequipa.
Esquema: RECURSOS
*/

select d.iddepartamento
from recursos.departamento d
join recursos.ubicacion u 
on d.idubicacion = u.idubicacion
where upper(ciudad) = 'AREQUIPA';

select e.*
from recursos.empleado e 
join (
      select d.iddepartamento
      from recursos.departamento d
      join recursos.ubicacion u 
      on d.idubicacion = u.idubicacion
      where upper(ciudad) = 'AREQUIPA'
) t
on e.iddepartamento = t.iddepartamento;



-- Subconsultas Correlacionada o Recursiva
/*
De cada departamento se necesita saber los empleados
que tienenel salario mayor que el promedio en su departamento.
Esquema: RECURSOS
*/

select e.*,
  (
        select avg( x.sueldo )
        from recursos.empleado x 
        where x.iddepartamento = e.iddepartamento
  ) sueldo_prom
from recursos.empleado e
where e.sueldo > (
      select avg( x.sueldo )
      from recursos.empleado x 
      where x.iddepartamento = e.iddepartamento
);



with 
v1 as (
  select iddepartamento, avg( x.sueldo ) sueldo_prom
  from recursos.empleado x 
  group by iddepartamento
)
select e.*, round(v1.sueldo_prom,2) sueldo_prom
from recursos.empleado e
join v1 
on  e.iddepartamento = v1.iddepartamento 
and e.sueldo > v1.sueldo_prom;









