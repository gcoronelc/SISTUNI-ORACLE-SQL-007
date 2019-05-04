select e.*
from recursos.empleado e
where e.sueldo >= (
    select max( x.sueldo)
    from recursos.empleado x 
    where x.iddepartamento = e.iddepartamento
    );