CREATE TABLESPACE TBS_MECANICO
DATAFILE 'I:\app\TBS\TBS_MECANICO.DBF'
SIZE 10M;


CREATE TABLE COCHES(
MAT VARCHAR(6)NOT NULL  PRIMARY KEY,
MARCA VARCHAR(10)NOT NULL,
MODELO VARCHAR(10)NOT NULL,
A�O_FAB INT
)
TABLESPACE TBS_MECANICO;

CREATE TABLE MECANICO(
IDMECANICO CHAR(5) NOT NULL PRIMARY KEY,
NOMBRE VARCHAR(25)NOT NULL,
APELLIDO VARCHAR(25)NOT NULL,
PUESTO VARCHAR(20)NOT NULL
)
TABLESPACE TBS_MECANICO;

CREATE TABLE TRABAJOS(
IDTRABAJO CHAR(2) NOT NULL PRIMARY KEY,
HORAS INT NOT NULL,
FECHA_REP DATE NOT NULL,
MAT VARCHAR(6) NOT NULL,
IDMECANICO CHAR(5) NOT NULL,
FOREIGN KEY (MAT) REFERENCES COCHES (MAT),
FOREIGN KEY (IDMECANICO) REFERENCES MECANICO (IDMECANICO)
)
TABLESPACE TBS_MECANICO;


CREATE TABLE CLIENTE(
DNI_CLIE varchar(10) NOT NULL PRIMARY KEY,
NOMBRE varchar (60) not null,
DIRECCION varchar (60) not null,
TELEFONO varchar(10),
IDMECANICO CHAR(5) NOT NULL,
FOREIGN KEY (IDMECANICO) REFERENCES MECANICO (IDMECANICO)
)
TABLESPACE TBS_MECANICO;


CREATE TABLE REPUESTO(
IDRESPUESTO varchar(10) not null PRIMARY KEY,
DESCRIPCION varchar (60) not null,
COSTOUNIT int not null,
IDTRABAJO CHAR(2) NOT NULL,
FOREIGN KEY (IDTRABAJO) REFERENCES TRABAJOS (IDTRABAJO)
)
TABLESPACE TBS_MECANICO;

CREATE TABLE REPORTE(
IDREPORTE varchar (10) not null PRIMARY KEY,
CONCEPTO varchar (100) not null,
CANTIDAD int not null,
IDRESPUESTO varchar(10) not null,
IDMECANICO char(5) not null,
FOREIGN KEY (IDMECANICO) REFERENCES MECANICO(IDMECANICO),
FOREIGN KEY (IDRESPUESTO) REFERENCES REPUESTO (IDRESPUESTO)
)
TABLESPACE TBS_MECANICO;


CREATE TABLE FACTURAS(
NUM_FACTURA CHAR(5) not null PRIMARY KEY,
FECHA date not null,
IMPORTE FLOAT not null,
DNI_CLIE varchar(10) not null, 
IDREPORTE varchar(10) not null,
FOREIGN KEY (DNI_CLIE) REFERENCES CLIENTE (DNI_CLIE),
FOREIGN KEY (IDREPORTE) REFERENCES REPORTE (IDREPORTE)
)
TABLESPACE TBS_MECANICO;

---------------------
------CONSULTAS------
----------------------

--MODIFICAR EL A�O DE FABRICACION DEL COCHE CON MATRICULA 'GH1564':
UPDATE COCHES
SET A�O_FAB = 2002
WHERE mat ='GH1564';

--COCHES QUE NO FUERON FABRICADOS   ENTRE 1995 y 2005:
 SELECT * FROM coches
WHERE A�O_FAB NOT BETWEEN 1995 AND 2005;

--OBTENER LAS DOS PRIMERAS REVISION DE ITV PARA LOS COCHES

SELECT MAT,A�O_FAB, A�O_FAB+5 "Primera revision", A�O_FAB+7 "Segunda revision", A�O_FAB+9 "Tercera revision" FROM coches;

--OBTENER TODO LOS TRABAJOS INCLUYENDO EL MECANICO QUE LOS REALIZA
SELECT * FROM MECANICO,TRABAJOS
WHERE MECANICO.IDMECANICO=TRABAJOS.IDMECANICO;

--OBTENER LAS MARCAS Y MODELOS DE LOS COCHES REPARADOS DE PUESTO MOTOR
SELECT DISTINCT marca,modelo
FROM coches c, trabajos t,mecanico m WHERE c.mat=t.mat AND t.IDMECANICO=m.IDMECANICO AND
puesto='MOTOR';

--CONTAR EL NUMERO DE PUESTOS DISTINTOS EN LA TABLA MECANICOS
 SELECT COUNT(distinct puesto) "Numero de puestos" FROM MECANICO;

--OBTENER EL TOTAL DE HORAS TRABAJADAS POR EL MECANICO D AMORTIGUACION:
SELECT SUM(HORAS) "HORAS TRABAJADAS"
FROM MECANICO,TRABAJOS
WHERE puesto='AMORTIGUADOR' AND
mecanico.IDMECANICO=trabajos.IDMECANICO;


--OBTENER EL NUMERO MAXIMO DE HORAS TRABAJADAS SOBRE UN COCHE
SELECT MAX(horas) FROM coches,TRABAJOS ;


--OBTENER EL PROMEDIO DE HORAS TRABAJADAS CON RENAULT:
SELECT ROUND(AVG(horas),2)
FROM coches,trabajos
WHERE coches.mat=trabajos.mat AND
marca='REFAULT';

--OBTENER LOS COCHES EN LOSS QUE SE A TRABAJADO MAS DE 2 HORAS
SELECT mat,SUM(horas)
FROM trabajos
GROUP by mat
HAVING SUM(horas)>2;


--OBTENER LOS MECANICOOS DE CHASIS O AMORTIGUACION QUE HAN REPARADO MAS DE UN COCHE
SELECT MECANICO.IDMECANICO,
COUNT(MAT) "Numero de coches" FROM MECANICO,TRABAJOS
WHERE MECANICO.IDMECANICO =trabajos.idmecanico AND
puesto in('CHASIS','AMORTIGUADOR')
GROUP by MECANICO.IDMECANICO
HAVING COUNT( mat)>1;

--OBTENER LOS MECANICOS QUE PERTENECEN AL MISMO PUESTO QUE EDDIE

SELECT nombre
FROM mecanico
WHERE puesto = ( SELECT puesto
FROM mecanico
WHERE nombre = 'EDDIE')
AND nombre!='EDDIE';

--OBTENER LOS COCHES REPARADOS POR ALGUN MECANICO DE MOTOR
 SELECT mat
FROM trabajos
WHERE IDMECANICO IN ( SELECT IDMECANICO
FROM mecanico
WHERE puesto = 'MOTOR');

 SELECT mat
FROM trabajos
WHERE IDMECANICO IN ( SELECT IDMECANICO
FROM mecanico
WHERE NOMBRE = 'BRUNO');


