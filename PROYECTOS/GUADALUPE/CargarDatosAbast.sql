
-- ======================================================
-- RESTRICCIONES DE LA TABLA SEDE
-- ======================================================

--Insertar Datos
INSERT INTO SEDE (sed_id, sed_nombre, sed_descripcion )
VALUES( 1,'LIMA','Lima');

INSERT INTO SEDE (sed_id, sed_nombre, sed_descripcion )
VALUES( 2,'AREQUIPA','Arequipa');

INSERT INTO SEDE (sed_id, sed_nombre, sed_descripcion )
VALUES( 3,'CUSCO','Cusco');

INSERT INTO SEDE (sed_id, sed_nombre, sed_descripcion )
VALUES( 4,'PUNO','Puno');

INSERT INTO SEDE (sed_id, sed_nombre, sed_descripcion )
VALUES( 5,'ICA','Ica');

commit;


-- ======================================================
-- RESTRICCIONES DE LA TABLA USUARIO
-- ======================================================

-- Insertar Datos

INSERT INTO USUARIO(usu_id,sed_id,usu_nombre,usu_direccion,usu_telefono,usu_email)
VALUES(1,1,'Brenda Guadalupe','Av. 123','984336557','bguadalupe@orcl.com');

INSERT INTO USUARIO(usu_id,sed_id,usu_nombre,usu_direccion,usu_telefono,usu_email)
VALUES(2,1,'Jose Romero','Av. 456','908972654','jromero@orcl.com');

INSERT INTO USUARIO(usu_id,sed_id,usu_nombre,usu_direccion,usu_telefono,usu_email)
VALUES(3,2,'Elizabeth Guadalupe','Av. 789','123456789','eguadalupe@orcl.com');

INSERT INTO USUARIO(usu_id,sed_id,usu_nombre,usu_direccion,usu_telefono,usu_email)
VALUES(4,2,'Alicia Morano','Av. 987','987654321','amoreno@orcl.com');

INSERT INTO USUARIO(usu_id,sed_id,usu_nombre,usu_direccion,usu_telefono,usu_email)
VALUES(5,3,'Rodrigo Alvarado','Av. 876','765456789','ralvarado@orcl.com');

INSERT INTO USUARIO(usu_id,sed_id,usu_nombre,usu_direccion,usu_telefono,usu_email)
VALUES(6,3,'Mireille Alvarado','Av. 453','432789654','malvarado@orcl.com');

INSERT INTO USUARIO(usu_id,sed_id,usu_nombre,usu_direccion,usu_telefono,usu_email)
VALUES(7,4,'Sebastian Guadalupe','Av. 763','980789675','sguadalupe@orcl.com');

INSERT INTO USUARIO(usu_id,sed_id,usu_nombre,usu_direccion,usu_telefono,usu_email)
VALUES(8,4,'Yennifer Romero','Av. 324','877965243','yromero@orcl.com');

INSERT INTO USUARIO(usu_id,sed_id,usu_nombre,usu_direccion,usu_telefono,usu_email)
VALUES(9,5,'Rocio Mar','Av. 879','566823999','rmar@orcl.com');

INSERT INTO USUARIO(usu_id,sed_id,usu_nombre,usu_direccion,usu_telefono,usu_email)
VALUES(10,5,'Walter Guadalupe','Av. 982','987628930','wguadalupe@orcl.com');

commit;

-- ======================================================
-- RESTRICCIONES DE LA TABLA PRODUCTO
-- ======================================================

--Insertar Datos
INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 1,'Fideo Tallarin DEL MOL','Fideo Tallarin Delgado MOLITALIA');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 2,'Fideo Tallarin GRU MOL','Fideo Tallarin Grueso MOLITALIA');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 3,'Fideo CAB ANGEL MOL','Fideo Cabello de Angel MOLITALIA');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 4,'Fideo Tallarin DEL DV','Fideo Tallarin Delgado DON VICTORIO');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 5,'Fideo Tallarin GRU DV','Fideo Tallarin Grueso DON VICTORIO');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 6,'Leche EVA GLR','Leche Evaporada GLORIA');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 7,'Leche EVA IDL','Leche Evaporada IDEAL');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 8,'Leche EVA LAV','Leche Evaporada LAIVE');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 9,'Atun Filete INK','Atun Filete INKA MAR');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 10,'Atun Filete PRM','Atun Filete PRIMOR');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 11,'Galleta OR','Galleta OREO');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 12,'Galleta GL','Galleta GLACITAS');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 13,'Galleta SD','Galleta SD');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 14,'Arroz SMN','Arroz SAMAN');

INSERT INTO PRODUCTO (prd_id, prd_nombre, prd_descripcion)
VALUES( 15,'Arroz PAI','Arroz PAISANA');


commit;

-- ======================================================
-- RESTRICCIONES DE LA TABLA PEDIDO
-- ======================================================

DECLARE 

   anio VARCHAR(10);
   
BEGIN

  anio :=  to_char(sysdate, 'YYYY');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(1,1,1,'Pedido 01',5,to_date( anio || '0410 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(1,2,1,'Pedido 02',10,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(1,3,1,'Pedido 03',15,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(1,4,1,'Pedido 04',20,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(1,5,2,'Pedido 05',25,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(1,10,2,'Pedido 06',30,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(2,1,3,'Pedido 07',35,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(2,3,3,'Pedido 08',40,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(2,10,3,'Pedido 09',45,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(3,1,4,'Pedido 10',50,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(4,1,5,'Pedido 11',45,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(5,3,5,'Pedido 12',40,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(5,7,5,'Pedido 13',35,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(6,1,5,'Pedido 14',30,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(6,8,6,'Pedido 15',25,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(7,8,6,'Pedido 16',20,to_date( anio || '0115 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0120 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(7,9,7,'Pedido 17',15,to_date( anio || '0120 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0125 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(7,10,7,'Pedido 18',10,to_date( anio || '0210 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0215 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(8,3,7,'Pedido 19',5,to_date( anio || '0215 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0220 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(8,2,7,'Pedido 20',5,to_date( anio || '0220 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0225 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(9,2,8,'Pedido 21',10,to_date( anio || '0310 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0315 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

--
INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(9,5,8,'Pedido 22',15,to_date( anio || '0315 10:30','YYYYMMDD HH24:MI'),null,'EN PROCESO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(10,10,9,'Pedido 23',25,to_date( anio || '0320 10:30','YYYYMMDD HH24:MI'),null,'EN PROCESO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(2,9,10,'Pedido 24',12,to_date( anio || '0410 10:30','YYYYMMDD HH24:MI'),null,'EN PROCESO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(4,9,10,'Pedido 27',14,to_date( anio || '0505 10:30','YYYYMMDD HH24:MI'),null,'EN PROCESO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(10,7,11,'Pedido 30',3,to_date( anio || '0410 10:30','YYYYMMDD HH24:MI'),null,'EN PROCESO');
--

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(3,10,12,'Pedido 25',11,to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(4,10,12,'Pedido 26',13,to_date( anio || '0420 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0425 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(10,9,13,'Pedido 28',8,to_date( anio || '0410 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');

INSERT INTO PEDIDO(usu_id,prd_id,ped_id,ped_descripcion,ped_cantidad,ped_fechaini,ped_fechafin,ped_estado)
VALUES(10,8,13,'Pedido 29',7,to_date( anio || '0410 10:30','YYYYMMDD HH24:MI'),to_date( anio || '0415 10:30','YYYYMMDD HH24:MI'),'ENTREGADO');


END;

/

commit;


-- ======================================================
-- RESTRICCIONES DE LA TABLA COMPANIA
-- ======================================================

-- Insertar Datos

INSERT INTO COMPANIA(com_id,com_nombre,com_RUC,com_telefono,com_correo,com_direccion)
VALUES(1,'Molitalia','8888888888','984336557','molitalia@orcl.com','Av.123');

INSERT INTO COMPANIA(com_id,com_nombre,com_RUC,com_telefono,com_correo,com_direccion)
VALUES(2,'Don Victorio','9999999999','987662839','donvictorio@orcl.com','Av.987');

INSERT INTO COMPANIA(com_id,com_nombre,com_RUC,com_telefono,com_correo,com_direccion)
VALUES(3,'Gloria','1111111111','984336557','gloria@orcl.com','Av.666');

INSERT INTO COMPANIA(com_id,com_nombre,com_RUC,com_telefono,com_correo,com_direccion)
VALUES(4,'Ideal','2222222222','984336557','ideal@orcl.com','Av.222');

commit;
-- ======================================================
-- RESTRICCIONES DE LA TABLA PROVEEDOR
-- ======================================================

-- Insertar Datos

INSERT INTO PROVEEDOR(pro_id,com_id,pro_nombre,pro_DNI,pro_telefono,pro_correo)
VALUES(1,1,'Andrea Ojeda','12345665','888888888','aojeda@orcl.com');

INSERT INTO PROVEEDOR(pro_id,com_id,pro_nombre,pro_DNI,pro_telefono,pro_correo)
VALUES(2,2,'Ricardo Cerron','89766787','111111111','rcerron@orcl.com');

INSERT INTO PROVEEDOR(pro_id,com_id,pro_nombre,pro_DNI,pro_telefono,pro_correo)
VALUES(3,3,'Haggi Molina','09873654','222222222','hmolina@orcl.com');

INSERT INTO PROVEEDOR(pro_id,com_id,pro_nombre,pro_DNI,pro_telefono,pro_correo)
VALUES(4,4,'Rose Ortiz','92876354','333333333','rortiz@orcl.com');

INSERT INTO PROVEEDOR(pro_id,com_id,pro_nombre,pro_DNI,pro_telefono,pro_correo)
VALUES(5,1,'Ronald Cuzcano','08762893','444444444','rcuzcano@orcl.com');

commit;
-- ======================================================
-- RESTRICCIONES EN LA TABLA CONTRATO
-- ======================================================

DECLARE 

  anio VARCHAR(10);
   
BEGIN

  anio :=  to_char(sysdate, 'YYYY');
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(1,1,1,1,1,to_date( anio || '0420','YYYYMMDD'),'Nuevos Insumos 01',500);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(2,2,1,2,1,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 02',1500);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(3,3,1,3,1,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 03',800);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(4,4,1,4,1,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 04',400);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(5,1,1,5,2,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 05',1200);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(6,2,1,10,2,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 06',1000);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(7,3,2,1,3,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 07',100);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(8,4,2,3,3,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 08',900);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(9,1,3,10,12,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 09',500);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(10,2,10,8,13,to_date( anio || '0430','YYYYMMDD'),'Nuevos Insumos 10',300);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(11,3,2,10,3,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 11',300);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(12,4,3,1,4,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 12',800);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(13,1,4,1,5,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 13',200);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(14,2,5,3,5,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 14',300);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(15,3,5,7,5,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 15',400);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(16,4,6,1,5,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 16',150);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(17,1,6,8,6,to_date( anio || '0425','YYYYMMDD'),'Nuevos Insumos 17',100);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(18,2,7,8,6,to_date( anio || '0120','YYYYMMDD'),'Nuevos Insumos 18',100);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(19,3,4,10,12,to_date( anio || '0430','YYYYMMDD'),'Nuevos Insumos 19',300);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(20,4,10,9,13,to_date( anio || '0430','YYYYMMDD'),'Nuevos Insumos 20',400);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(21,1,7,9,7,to_date( anio || '0130','YYYYMMDD'),'Nuevos Insumos 21',450);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(22,2,7,10,7,to_date( anio || '0220','YYYYMMDD'),'Nuevos Insumos 22',250);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(23,3,8,3,7,to_date( anio || '0225','YYYYMMDD'),'Nuevos Insumos 23',200);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(24,4,8,2,7,to_date( anio || '0227','YYYYMMDD'),'Nuevos Insumos 24',150);
  
  insert into CONTRATO (con_id, pro_id, usu_id, prd_id, ped_id, con_fecha, con_descripcion, con_precio)
  VALUES(25,1,9,2,8,to_date( anio || '0320','YYYYMMDD'),'Nuevos Insumos 25',100);
 
END;
/

commit;

-- ======================================================
-- RESTRICCIONES EN LA TABLA FACTURA
-- ======================================================

DECLARE 

  anio VARCHAR(10);
   
BEGIN

  anio :=  to_char(sysdate, 'YYYY');
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(1,1,to_date( anio || '0420','YYYYMMDD'),'Factura 01',500, 90, 590);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(2,2,to_date( anio || '0425','YYYYMMDD'),'Fectura 02',1500, 270, 1770);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(3,3,to_date( anio || '0425','YYYYMMDD'),'Factura 03',800, 144, 944);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(4,4,to_date( anio || '0425','YYYYMMDD'),'Factura 04',400, 72, 472);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(5,5,to_date( anio || '0425','YYYYMMDD'),'Factura 05',1200, 216, 1416);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(6,6,to_date( anio || '0425','YYYYMMDD'),'Factura 06',1000, 180, 1180);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(7,7,to_date( anio || '0425','YYYYMMDD'),'Factura 07',100, 18, 118);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(8,8,to_date( anio || '0425','YYYYMMDD'),'Factura 08',900, 162, 1062);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(9,9,to_date( anio || '0425','YYYYMMDD'),'Factura 09',500, 90, 590);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(10,10,to_date( anio || '0430','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(11,11,to_date( anio || '0425','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(12,12,to_date( anio || '0425','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(13,13,to_date( anio || '0425','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(14,14,to_date( anio || '0425','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(15,15,to_date( anio || '0425','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(16,16,to_date( anio || '0425','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(17,17,to_date( anio || '0425','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(18,18,to_date( anio || '0125','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(19,19,to_date( anio || '0430','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(20,20,to_date( anio || '0430','YYYYMMDD'),'Factura 10',300, 54, 3540);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(21,21,to_date( anio || '0130','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(22,22,to_date( anio || '0220','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(23,23,to_date( anio || '0225','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(24,24,to_date( anio || '0227','YYYYMMDD'),'Factura 10',300, 54, 354);
  
  insert into FACTURA (fac_id, con_id, fac_fecha, fac_descripcion, fac_precio, fac_igv, fac_apagar)
  VALUES(25,25,to_date( anio || '0320','YYYYMMDD'),'Factura 10',300, 54, 354);
 
END;

/
commit;


-- ======================================================
-- FIN
-- ======================================================

select * from SEDE;
select * from USUARIO;
select * from PEDIDO;
select * from PRODUCTO;
select * from COMPANIA;
select * from PROVEEDOR;
select * from CONTRATO;
select * from FACTURA;

