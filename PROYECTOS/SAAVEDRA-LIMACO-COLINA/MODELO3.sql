

-- ==========================================================
-- Inicio de Proceso
-- ==========================================================

SET TERMOUT ON
SET ECHO OFF
SET SERVEROUTPUT ON
BEGIN
	DBMS_OUTPUT.PUT_LINE('Inicio del proceso...');
END ;
/
SET TERMOUT OFF


-- ==========================================================
-- CREACIÃ“N DEL ESQUEMA
-- ==========================================================

-- Verificar Cuenta

declare
  n number(3);
begin
  select count(*) into n from dba_users where username = 'PRESTAMO';
  if(n = 1) then
    execute immediate 'drop user prestamo cascade';
  end if;
  execute immediate 'create user prestamo identified by admin';  
end;
/

-- Asigna privilegios

grant connect, resource to prestamo;
grant UNLIMITED TABLESPACE to prestamo;

-- ConexiÃ³n con la base de datos

connect prestamo/admin


-- ==========================================================
-- Crear la Tabla  lector
-- ==========================================================

CREATE TABLE prestamo.lector (
    idlector             CHAR(3) NOT NULL,
    Apellido_lector      VARCHAR2(20) NOT NULL,
    Nombre_lector        VARCHAR2(20) NOT NULL,
    Telefono_lector      VARCHAR2(20) NOT NULL,
    DNI                  NUMBER(8) NOT NULL,
    Distrito_lector      VARCHAR2(50) NOT NULL,
    Fec_Nac_lector        DATE NOT NULL,
    Genero_lector         VARCHAR2(20) NOT NULL,
    CONSTRAINT pk_lector PRIMARY KEY ( idlector )
);

-- ==========================================================
-- Crear la Tabla prestamo.prestamo
-- ==========================================================

CREATE TABLE prestamo.prestamo(
    nropres               CHAR(3) NOT NULL,
    Fecha_Prestamo        DATE NOT NULL,
    Cantidad_Libros       CHAR(40) NOT NULL,
    idlector              CHAR(3) NOT NULL,
    CONSTRAINT pk_prest PRIMARY KEY ( nropres),
    CONSTRAINT fk_lector_prest 
        FOREIGN KEY ( idlector) 
        REFERENCES prestamo.lector ( idlector)
);


-- ==========================================================
-- Crear la Tabla de Editorial
-- ==========================================================

CREATE TABLE prestamo.editorial (
    ideditorial          CHAR(3) NOT NULL,
    Nombre_Editorial     VARCHAR2(20) NOT NULL,
    Pais_Editorial       VARCHAR2(100) NOT NULL,
    Distrito_Editorial   VARCHAR2(100) NOT NULL,
    Telefono_Editorial   VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_editorial  PRIMARY KEY ( ideditorial    )
 
);
-- ==========================================================
-- Crear la Tabla de libro
-- ==========================================================

CREATE TABLE prestamo.libro (
    idlibro       CHAR(4) NOT NULL,
    titulo        VARCHAR2(20) NOT NULL,
    nroCopias     CHAR(100) NOT NULL,
     ISBNCHAR     NUMBER NOT NULL,
    FechaPub      DATE NOT NULL,
    ideditorial   CHAR(3) NOT NULL,

    CONSTRAINT pk_libro PRIMARY KEY ( idlibro),
    CONSTRAINT fk_libro_editorial 
        FOREIGN KEY ( ideditorial) 
        REFERENCES prestamo.editorial ( ideditorial)
);

-- ==========================================================
-- Crear la Tabla de Autor
-- ==========================================================

CREATE TABLE prestamo.autor (
    idautor         CHAR(3) NOT NULL,
    Nombre_autor    VARCHAR2(20) NOT NULL,
    Apellido_autor  VARCHAR2(20) NOT NULL,
     Pais_autor      VARCHAR2(20) NOT NULL,
     Genero_autor    VARCHAR2(20) NOT NULL,
    FechaAutor       DATE NOT NULL,

    CONSTRAINT pk_autor PRIMARY KEY ( idautor  )
  
);



create table prestamo.detalle_prestamo (
  nropres      CHAR(3) NOT NULL,
  idlibro       CHAR(4) NOT NULL,
  descripcion   VARCHAR2(50) NOT NULL,

CONSTRAINT FK_DETALLE_PRESTAMO FOREIGN KEY (nropres) REFERENCES prestamo.prestamo (nropres) ,
CONSTRAINT FK_DETALLE_LIBRO FOREIGN KEY (idlibro)       REFERENCES prestamo.libro (idlibro )

);
create table  prestamo.libro_autor (



idlibro            CHAR(4) NOT NULL,
idautor            CHAR(3) NOT NULL,
descripcion_libro    VARCHAR2(50) NOT NULL,
CONSTRAINT FK_DETALLELIBRO FOREIGN KEY (idlibro)       REFERENCES prestamo.libro (idlibro ),
CONSTRAINT FK_DETALLEAUTOR FOREIGN KEY (idautor)       REFERENCES prestamo.autor (idautor)
);
 

DELETE FROM PRESTAMO.prestamo; 
ALTER TABLE prestamo.prestamo MODIFY cantidad_libros number ;
select * from  prestamo.prestamo


-- ==========================================================
-- Cargar datos a la tabla: prestamo
-- ==========================================================

INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P01', to_date('20190120','YYYYMMDD' ),'2','L01' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P02', to_date('20190521','YYYYMMDD' ),'2','L02' );


-- ==========================================================
-- Cargar datos a la tabla: Editorial
-- ==========================================================

INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E01', 'Coquito','Peru', 'Comas','7645-550' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E02', 'Santillan','Peru', 'Lince','764-4550' );



-- ==========================================================
-- Cargar datos a la tabla: libro
-- ==========================================================
INSERT INTO prestamo.libro (  idlibro   ,titulo   ,nroCopias  ,ISBNCHAR  ,FechaPub     ,ideditorial    ) VALUES ( 'LI01', 'Romeo y julieta','20', 0001, to_date('20190522','YYYYMMDD' ),'E01' );


-- ==========================================================
-- Cargar datos a la tabla: autor
-- ==========================================================

INSERT INTO prestamo.autor ( idautor,Nombre_autor ,Apellido_autor  ,Pais_autor  ,Genero_autor  ,FechaAutor  ) VALUES ( 'A01', 'Isabella','Allende' ,'Chile','fenemino',to_date('19800522','YYYYMMDD' ));
select * from prestamo.detalle_prestamo

INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P01', 'LI01' ,'Entregado' );
INSERT INTO  prestamo.libro_autor  ( idlibro    ,idautor ,descripcion_libro) VALUES ( 'LI01', 'A01' ,'Romanticismo' );
-- ==========================================================
-- Cargar datos a la tabla: Editorial
-- ==========================================================

-- ==========================================================
-- Cargar datos a la tabla: Editorial
-- ==========================================================

INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E03', 'Multigrafica Burgos','Peru', 'Santiago de Surco','742-2004' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E04', 'Grafica Universal','Peru', 'San Isidro','434-8560' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E05', 'Blackie Books','España', 'Barcelona','34-934160959' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E06', 'Ediciones de la Flor','Argentina', 'Rosario','5411-4304-5529' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E07', 'Ediciones Arlequín','Mexico', 'Jalisco','52-33-3657-3786' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E08', 'Backstage Brasil','Brasil', 'Rio de Janeiro','21-25575704' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E09', 'El Mercurio-Aguilar','Chile', 'Antofagasta','2879-41-68' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E10', 'OM Ediciones','Chile', 'Rancagua','56-2-2860-6800' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E11', 'Salo S.A.','Chile', 'Rancagua','941209268' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E12', 'Enterbrain','Japon', 'Tokyo','21-28874784' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E13', 'Nostra Ediciones','Mexico', 'Michoacán','61-35585689' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E14', 'LOM Ediciones','Chile', 'Iquique','56-2-2860-6800' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E15', 'Textofilia','Mexico', 'Zacatecas','52-55-5575-8964' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E16', 'Ediciones Era','Mexico', 'Chihuahua','52-55-5486-9065' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E17', 'Guillermo Stahl Cia.','Peru', 'San Isidro','7136-990' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E18', 'Editorial Séneca','Mexico', 'Veracruz','52-55-5474-8863' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E19', 'Editorial Perfil','Argentina', 'Buenos Aires','54-11-7091-4921' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E20', 'Editorial Futura','Peru', 'Santiago de Surco','7325-990' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E21', 'Editorial Grijalbo','Mexico', 'Jalisco','55-5522-1520' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E22', 'Servicios Graficos','Mexico', 'Chihuahua','55-65364-4550' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E23', 'El Observador Press','Peru', 'Rimac','3895-771' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E24', 'Ediciones UDP','Peru', 'Lince','784-4770' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E25', 'Premio Planeta','España', 'Barcelona','34-93-4928000' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E26', 'Random House, Inc.','Peru', 'Nueva York','1-800-793-2665' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E27', 'HarperCollins','Estados Unidos', 'Nueva York','1-212-207-7000' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E28', 'Penguin Group','Estados Unidos', 'Florida','5255-3067-8400' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E29', 'Libros del Zorzal','Argentina', 'Buenos Aires','5411-4867-1661' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E30', 'Editorial Polar','Argentina', 'Mendoza','5411-11-4970-277' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E31', 'Editorial Melos','Argentina', 'Santa Cruz','54-11-4371-9841' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E32', 'Editorial Mansalva','Argentina', 'Tucumán','54-11-5482-1942' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E33', 'Editorial Losada','Argentina', 'Mendoza','54-11-4863-2758' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E34', 'Data Becker','Alemania', 'Munich','49-221-31-29-11' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E35', 'Taschen','Alemania', 'Berlin','49-221-20-18-00' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E36', 'Motorpress','Alemania', 'Munich','49-6201-606-328' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E37', 'Wiley-VCH','Alemania', 'Bremen','49-6201-606-109' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E38', 'Ullstein Verlag','Alemania', 'Berlin','49-30-827-870' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E39', 'Editorial Haynes','Argentina', 'Tucumán','54-11-5219-2259' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E40', 'Editorial Claridad','Argentina', 'Santa Cruz','54-11-5235-7576' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E41', 'Editorial Argenta','Argentina', 'Rosario','54-11-4381-7674' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E42', 'Ediciones INTA','Argentina', 'Rosario','54-11-4372-3829' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E43', 'Ediciones de Mente','Argentina', 'Rosario','54-11-4371-1825' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E44', 'Unibiblos','Colombia', 'Bogotá','57-1-281-2641' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E45', 'Camara del Libro','Colombia', 'Cali','57-1-3230111' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E46', 'Editorial El tiempo','Colombia', 'Cali','57-1-2940100' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E47', 'Editorial Antioquia','Colombia', 'Bogota','57-4-2195012' );
INSERT INTO prestamo.editorial ( ideditorial  ,Nombre_Editorial,  Pais_Editorial,Distrito_Editorial,Telefono_Editorial ) VALUES ( 'E48', 'Editorial del Rosario','Colombia', 'Bogota','57-4-3206113' );



select * from prestamo.libro_autor



-- ==========================================================
-- Cargar datos a la tabla: Detalle_prestamo
-- ==========================================================
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P01', 'LI01' ,'Entregado' );

INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P03', 'LI02' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P04', 'LI03' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P05', 'LI04' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P06', 'LI05' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P07', 'LI06' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P08', 'LI07' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P09', 'LI08' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P10', 'LI09' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P11', 'LI10' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P12', 'LI11' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P13', 'LI12' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P14', 'LI13' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P15', 'LI14' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P16', 'LI15' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P17', 'LI16' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P18', 'LI17' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P19', 'LI18' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P20', 'LI19' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P21', 'LI20' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P22', 'LI21' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P23', 'LI22' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P24', 'LI23' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P25', 'LI24' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P26', 'LI25' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P27', 'LI26' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P28', 'LI27' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P29', 'LI28' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P30', 'LI29' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P31', 'LI30' ,'Entregado' );


-- ==========================================================
-- Cargar datos a la tabla: libro
-- ==========================================================
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI02', 'Departamento de especulaciones','20',0001,to_date('19980928','YYYYMMDD' ),'E03');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI03', 'Las Diez mil cosas','30',0002,to_date('19900117','YYYYMMDD' ),'E04');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI04', 'Dos inglesas y el amor','10',0001,to_date('20000626','YYYYMMDD' ),'E05');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI05', 'El Hermano del famoso Jack','15',0003,to_date('20010517','YYYYMMDD' ),'E10');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI06', 'La Hierba amarga','23',0004,to_date('20051010','YYYYMMDD' ),'E03');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI07', 'Pequeño fracaso','5',0004,to_date('19990531','YYYYMMDD' ),'E03');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI08', 'Personajes secundarios','5',0005,to_date('20001014','YYYYMMDD' ),'E11');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI09', 'El Río de la vida','1',0002,to_date('19981121','YYYYMMDD' ),'E20');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI10', 'Shiela Levine está muerta y vive en Nueva York','6',0001,to_date('19990105','YYYYMMDD' ),'E04');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI11', 'Signor Hoffman','2',0006,to_date('19991222','YYYYMMDD' ),'E04');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI12', 'La Vuelta del torno','2',0007,to_date('20151211','YYYYMMDD' ),'E21');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI13', 'Azarel','3',0009,to_date('20160707','YYYYMMDD' ),'E22');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI14', 'Camino nocturno','2',0010,to_date('20170912','YYYYMMDD' ),'E23');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI15', 'El Claro del bosque','9',0011,to_date('20130824','YYYYMMDD' ),'E24');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI16', 'En otro tiempo. Años de juventud en Galitzia oriental','5',0012,to_date('19961013','YYYYMMDD' ),'E25');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI17', 'Guerra del 15','20',0013,to_date('19800602','YYYYMMDD' ),'E26');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI18', 'El Joven Moncada','10',0014,to_date('20050901','YYYYMMDD' ),'E27');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI19', 'Käsebier conquista Berlín','30',0015,to_date('20040519','YYYYMMDD' ),'E28');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI20', 'El Retorno de Filip Latinovicz','15',0016,to_date('20030510','YYYYMMDD' ),'E29');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI21', 'Las dos vidas de Floria','26',0017,to_date('20020908','YYYYMMDD' ),'E30');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI22', 'Otro mundo','2',0018,to_date('20010901','YYYYMMDD' ),'E31');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI23', 'Diario de un hombre superfluo','5',0019,to_date('19891107','YYYYMMDD' ),'E32');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI24', 'Kew gardens y otros cuentos','10',0020,to_date('19900905','YYYYMMDD' ),'E33');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI25', 'La Llamada de lo salvaje','11',0021,to_date('20150323','YYYYMMDD' ),'E34');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI26', '99 películas que las nuevas generaciones deben conocer','15',0022,to_date('20140817','YYYYMMDD' ),'E35');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI27', 'Algo más que teatro','10',0023,to_date('20130926','YYYYMMDD' ),'E36');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI28', 'Aprendizaje-servicio y misión cívica de la universidad. Una propuesta de desarrollo','9',0024,to_date('20130119','YYYYMMDD' ),'E37');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI29', 'Complejidad y relaciones en educación infantil','3',0025,to_date('20110528','YYYYMMDD' ),'E38');
INSERT INTO prestamo.libro ( idlibro,titulo,nroCopias,ISBNCHAR,FechaPub,ideditorial)  VALUES ( 'LI30', 'Conocer y alimentar el cerebro de nuestros hijos. Claves para un óptimo aprendizaje y comportamiento','2',0026,to_date('20100608','YYYYMMDD' ),'E39');

-- ==========================================================
-- Cargar datos a la tabla: Autor
-- ==========================================================
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A02', 'GOLDSCHMIDT','James', 'CANADA','M',to_date('19510928','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A03', 'SALVI','Fundacion', 'ARGENTINA','M',to_date('19640117','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A04', 'MACDONALD','John D.', 'EEUU','M',to_date('19630626','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A05', 'DAVIES','Robertson', 'CANADA','M',to_date('19640517','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A06', 'MALET','Leo', 'MEXICO','M',to_date('19631010','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A07', 'CARLETON','Jetta', 'AUSTRALIA','F',to_date('19600531','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A08', 'OFLAHERTY','Liam', 'REINO UNIDO','M',to_date('19631014','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A09', 'OFFILL','Jenny', 'CANADA','F',to_date('19621121','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A10', 'DERMOUT','Maria', 'CHILE','F',to_date('19600105','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A11', 'PIERRE ROCHE','Henri', 'CHILE','M',to_date('19621222','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A12', 'TRAPIDO','Barbara', 'PERU','F',to_date('19621211','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A13', 'MINCO','Marga', 'MEXICO','F',to_date('19630707','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A14', 'SHTEYNGART','Gary', 'SUECIA','M',to_date('19620912','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A15', 'JOHNSON','Joyce', 'COLOMBIA','F',to_date('19370824','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A16', 'MACLEAN','Norman', 'PERU','M',to_date('19601013','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A17', 'PARENT','Gail', 'COLOMBIA','M',to_date('19800602','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A18', 'HALFON','Eduardo', 'PERU','M',to_date('19850901','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A19', 'JAMES','Henry', 'PERU','M',to_date('19690519','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A20', 'PAP','Karoly', 'FINLANDIA','F',to_date('19650510','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A21', 'HOHL','Ludwig', 'ALEMANIA','M',to_date('19750908','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A22', 'MADIERI','Marisa', 'BRASIL','F',to_date('19690901','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A23', 'MORGENSTERN','Soma', 'ALEMANIA','F',to_date('19891107','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A24', 'STUPARICH','Giani', 'FRANCIA','F',to_date('19540905','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A25', 'LERNET HOLENIA','Alexander', 'EEUU','M',to_date('19890323','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A26', 'TERGIT','Gabriele', 'FRANCIA','F',to_date('19690817','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A27', 'KRLEZA','Miroslav', 'EEUU','M',to_date('19830926','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A28', 'MARTINEZ BELLI','Laura', 'ESPAÑA','F',to_date('19670119','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A29', 'CERVERA','Alfons', 'ESPAÑA','M',to_date('19690528','YYYYMMDD' ));
INSERT INTO prestamo.autor ( idautor,Nombre_autor, Apellido_autor,Pais_autor,Genero_autor,FechaAutor )  VALUES ( 'A30', 'TURGUENEV','Iván', 'RUSIA','M',to_date('19880608','YYYYMMDD' ));


-- ==========================================================
-- Cargar datos a la tabla: libro_autor
-- ==========================================================

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI02', 'A02','Cuando se conocieron eran jóvenes y estaban llenos de esperanza. Aunque ambos vivían en Nueva York, solían enviarse cartas en las que imaginaban cómo sería su futuro. El remitente era siempre el mismo: Departamento de especulaciones. Se casaron, tuvieron un hijo y sortearon como pudieron los pequeños obstáculos de la vida familiar.');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI03', 'A03','En la primera mitad del siglo XX, en una isla del archipiélago de las Molucas, se conservan ya pocos de los antiguos jardines de especias, en uno de ellos vive Felicia la dama del Pequeño Jardín, última descendiente de una familia holandesa propietaria de plantaciones de nuez moscada. Toda su familia ha muerto hace ya tiempo, y aunque en apariencia no le queda nada');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI04', 'A04','En esta delicada novela, magistralmente llevada al cine por Truffant, Roché se adentra en sus recuerdos para rescatar una singular historia de amor: la de dos hermanas que se enamoran del mismo hombre. Apenas estrenado el siglo XX, en Inglaterra, un joven francés y dos hermanas inglesas forman un amistoso trío de sorprendente franqueza y camaradería. Pero cuando hace su aparición el amor todo sufrirá un vuelco. ');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI05', 'A05','En el Londres de los setenta todo parece posible para una chica elegante y moderna como Katherine, quien al poco tiempo de comenzar sus estudios unviersitarios entra en contacto con Jacob Goldman, un carismático profesor de filosofía que no tardará en presentarle a su estrafalaria familia. Cuando Katherine conozca a la mujer de Jacob..');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI06', 'A06','Durante la ocupación nazi de Holanda, en la segunda guerra mundial, los padres y los hermanos de la escritora de origen judío Marga Minco fueron deportados a campos de concentración. Ninguno regresó. En La hierba amarga, su primera novela, Minco evocó con sencillez y distanciamiento sus recuerdos de los años de la guerra: la noche en que toda la familia se reunió para coser en los abrigos las estrellas de tela que los identificaban como judíos ...');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI07', 'A07','A finales de los setenta, los cambios en la política mundial tendrían una influencia decisiva en la vida de Igor, un niño enclenque y asmático de Leningrado. Jimmy Carter y Leonid Brézhnev han acordado intercambiar cereales entre sus dos países; a cambio, la URSS aceptará que judíos soviéticos puedan emigrar a EE.UU. La famila de Igor será una de las que se aprovecharán de ese acuerdo. Ya en EE.UU. a Igor no le quedará más remedio que convertirse en Gary para ahorrarse problemas. ');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI08', 'A08','A finales de los años cincuenta, un puñado de artistas procedentes de los círculos contraculturales de Nueva York y San Francisco que coincidían en sus postulados artísticos y en su rechazo a las convenciones de su tiempo, y entre los que se encontraban Jack Kerouac, Allen Ginsberg, Gregory Corso, Willem de Kooning y William S. Borroughs, se convirtieron en símbolo del malestar de toda una generación de jóvenes norteamericanos.');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI09', 'A09','El río de la vida, primera de las tres historias que forman este libro, un padre transmite a sus dos hijos su pasión por la pesca con mosca. Los ríos tienen su orden y los chicos aprenden a conocerlo, pero las aguas siempre esconden algún misterio. La vida, como los ríos, fluye sin que muchas veces podamos resolver los interrogantes que nos plantea; al final de la suya, uno de los hijos rememora los acontecimientos del último verano en que pescó junto a su padre y ...');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI10', 'A10','Sheila es una chica mona. Su madre dice que es guapísima, claro, pero ya sabe cómo son las madres. Vive en Manhattan con su mejor amiga, Linda, que es más alta y delgada que ella. Sheila no piensa demasiado en el futuro y su vida transcurre como la de cualquier otra chica. Sin embargo, su despreocupación termina el día en que cumple treinta y cae en la cuenta de que no tiene pareja. Sheila intentará resolverlo, pero no es tarea fácil.');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI11', 'A11','Un escritor viaja a Italia para honrar la memoria de su abuelo polaco, prisionero de Auschwitz; recorre las costas de Guatemala, desde una playa de arena negra en el Pacífico hasta una playa de arena blanca en el Atlántico; llega a Harlem, tras la nostalgia de un salón de jazz, y busca en Polonia el legado familiar heredado por su abuelo. Porque todos nuestros viajes, como dice el narrador, son en realidad un solo viaje.');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI12', 'A12','Considerado de manera unánime como una obra maestra de la literatura gótica, la narración de este clásico arranca de una manera convencional: un grupo de amigos comparte historias de fantasmas en torno al fuego una noche de Navidad. Uno de ellos contará la de una joven e inexperta institutriz que acepta hacerse cargo de dos niños, Miles y Flora, en una remota mansión de la campiña inglesa. ');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI13', 'A13','Gyuri, el niño que protagoniza esta novela marcadamenta autobiográfica, es el hijo del rabino reformista de una ciudad que es idéntica en todo a Sopron, lugar de nacimiento de Károly Pap y donde a comienzos del siglo XX vivía una de las comunidades judías más antiguas de Hungría. A diferencia de sus hermanos Gyuri, es educado por su abuelo paterno, Jeremías, un fanático ortodoxo que se prepara para viajar a Jerusalén. ');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI14', 'A14','Una hoja cae sobre un hombre desamparado en mitad de la calle, un matrimonio en las tristísimas afueras de una triste ciudad encuentra compañía en un erizo que acaba convirtiéndose en un monstruo, el onírico paisaje del turbio invierno holandés, una figura tan silenciosa y oscura que se confunde con la noche, un pequeño país a orillas del mar donde las jóvenes se vuelven feas después de casarse, tres viejas de un pueblo de montaña');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI15', 'A15','Esta delicada fábula floral narra la historia de Dafne, una margarita que nace una mañana de marzo en un prado rodeado de robles, pinos y matas de enebro. El claro del bosque es la descripción luminosa y leve de una pequeña polis vegetal, un microcosmos en el que Dafne descubre las leyes implacables de la existencia. ');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI16', 'A16','Galitzia oriental, situada en los confines del imperio austrohúngaro y hoy parte de Ucrania, fue la cuna de algunos de los escritores centroeuropeos más destacados del siglo XX. Uno de ellos, Soma Morgenstern, emprendió en estos textos, redactados en distintos momentos de su exilio neoyorquino, el relato autobiográfico de una infancia feliz transcurrida en una tierra en la que convivieron ucranianos, polacos y judíos hasta el comienzo de la Segunda Guerra Mundial. ');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI17', 'A17','La obra, publicada en 1931, recoge los apuntes que Giani Stuparich tomó durante los dos primeros meses de la guerra en Monfalcone, en el noreste de Italia, cuando participó desde las trincheras en las sangrientas batallas del Isonzo. El libro conserva la vivacidad propia del momento en que se redactó, en pleno conflicto, y ofrece una visión no solo de la contienda, sino sobre todo de las reacciones psicológicas de un joven voluntario que se enfrenta a una realidad brutal. ');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI18', 'A18','Un atractivo aventurero pone en marcha una refinada maquinación, cuyo objetivo se desvelará poco antes del desenlace de esta historia hilarante situada en Argentina y España. El dinero, la clase social y el amor son los ingredientes principales de este relato lleno de ironía, en el que no escasean los diálogos chispeantes que se suceden a un ritmo vivísimo.');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI19', 'A19','Esta sátira de 1931, de diálogos chispeantes y personajes emblemáticos, relata el ascenso vertiginoso y la caída súbita de una estrella del mundo del espectáculo. Por casualidad, para llenar una página a última hora, el Berliner Rundschau publica un artículo sobre un tal Käsebier, un cantautor rubio, gordo, de carnes blandas, al que los periodistas convertirán en uno de los productos de más éxito de la emergente industria cultural del Berlín de los años veinte. ');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI20', 'A20','Filip, un pintor en plena crisis creativa que después de la Gran Guerra regresa a su país tras largos años de ausencia, llega a la estación de Kaptol en Zagreb y emprende viaje hacia el norte de Croacia. Allí, en la llanura de Panonia, vive su madre. En ese ambiente marcado por la decadencia de las tradiciones habsburguesas, por el encuentro y el desencuentro entre los distintos pueblos del área danubiana y por los olores y los colores del mundo rural, Filip se abandona al flujo violento');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI21', 'A21','Otrora es una pequeña comunidad en la que residen Manrique e Ifigenia, un matrimonio sin hijos que acoge como sirvienta a Antónima, una joven que hasta ese momento vivía en un alejado paraje con la vieja Teófila. La pareja había acudido a Teófila, curandera con fama de bruja, en busca de un remedio que permitiera a Ifigenia quedar embarazada. El relato adquiere a partir de ese momento una dimensión mágica, surreal, al tiempo que inquietante, porque quien queda embarazada es ');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI22', 'A22','¿Y la revolución, padre, qué nos queda a ti y a mí de tu vieja revolución, cuando aún creías que la vida tenía un sentido y no el que descubriste tantos años después en las amargas profundidades del pozo? ¿Qué nos queda? Es ésa una de las preguntas que llenan esta última novela de Alfons Cervera. Una pregunta que, como tantas de las otras que salen en sus páginas, apenas encontrará la respuesta velada de un padre que decidió morirse sin abrir la boca. .');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI23', 'A23','Antes de morir, Chulkaturin decide iniciar un diario con el que se despedirá de este mundo. No sabe qué puede contar, pues se considera un hombre superfluo, prescindible por completo. Su infancia fue normal y no ha hecho nada reseñable en su vida. Ni siquiera cuando conoció a Yelizaveta… El concepto de hombre superfluo, como hombre inteligente, sensible e idealista pero nihilista e indeciso, se hizo popular gracias a la publicación de esta obra de Iván Turguénev en 1850. ');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI24', 'A24','Tres relatos de Virginia Woolf son los que componen este libro y que muestran lo que a ella le gustaba denominar momentos de existencia. En ellos, personajes y acciones quedan supeditados a imágenes poéticas, alejadas de las banalidades de la vida. En Kew Gardens nos introduce, como diría T.S. Eliot, en un montón de imágenes rotas que van desde el movimiento perezoso del caracol a las conversaciones de los paseantes de jardín. ');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI25', 'A25','Buck es un perro que lleva una buena vida en un rancho de California con su amo, el juez Miller, hasta que lo roban y venden para pagar una deuda de juego. Se lo llevan a Alaska y allí pasa a manos de un par de canadienses entregados a la fiebre del oro que lo entrenan como perro de trineo. La dureza del entorno provocará que Buck vaya recuperando su lado salvaje, única forma de sobrevivir en las frías tierras del norte.');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI26', 'A26','La obra ofrece, a través de una lectura amena, una herramienta útil para acercarnos a un puñado de filmes clave del arte cinematográfico, mediante un esquema ágil y práctico (ficha, sinopsis, comentario, reflexión para el aula y una escena para el recuerdo), y que van desde 1895 hasta el 2000, con un claro objetivo: que los jóvenes se acerquen a obras fundamentales para el imaginario contemporáneo, películas de singular belleza, de enorme interés,');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI27', 'A27','Algo más que teatro, es un libro dedicado principalmente, aunque no exclusivamente, a educadores que quieran trabajar la educación en valores de una forma diferente: nuestra propuesta es utilizar el teatro como herramienta y excusa para llegar a profundizar sobre temas como la prevención de drogodependencias, el acoso escolar, la coeducación o las redes sociales, bajo un prisma alentador.');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI28', 'A28','La universidad tiene una misión cívica que cumplir. En cada tiempo y lugar. Pero, sobre todo, en la sociedad del conocimiento, ya que este no es posible sin diálogo y sin construcción del discurso epistémico en profesores y estudiantes. Al respecto y de un modo muy gradual, el aprendizaje-servicio se ha ido constituyendo en vector de innovación universitaria, en tanto que estimula la conexión entre las dimensiones académicas y comunitarias del aprendizaje.');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI29', 'A29','En este libro los autores nos invitan a pensar y a repensar la complejidad propia de los espacios educativos destinados a la pequeña infancia. Abordan el cómo y el porqué de las emociones cotidianas que se manifiestan a edades muy tempranas. Nos invitan a valorar la importancia de la observación como acto creativo, como herramienta fundamental para la reflexión, pero también para descubrir lo sutil y desvelarlo, para ir más allá del hecho de mirar');

INSERT INTO prestamo.libro_autor (idlibro ,idautor ,descripcion_libro)  VALUES ( 'LI30', 'A30','En este libro, la autora saca a relucir la importancia que la alimentación (y puntualmente la suplementación) puede llegar a tener de cara a apoyar el desarrollo cognitivo y emocional de niños y adolescentes. Por un lado, se intenta explicar al lector, de una manera didáctica y cercana, las bases que sustentan una adecuada maduración cerebral, para luego poder entender qué puede ir mal en este proceso que explique posibles problemas de aprendizaje y/o comportamiento';. -- ==========================================================
-- Cargar datos a la tabla: Detalle_prestamo
-- ==========================================================
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P01', 'LI01' ,'Entregado' );

INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P03', 'LI02' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P04', 'LI03' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P05', 'LI04' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P06', 'LI05' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P07', 'LI06' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P08', 'LI07' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P09', 'LI08' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P10', 'LI09' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P11', 'LI10' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P12', 'LI11' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P13', 'LI12' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P14', 'LI13' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P15', 'LI14' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P16', 'LI15' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P17', 'LI16' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P18', 'LI17' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P19', 'LI18' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P20', 'LI19' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P21', 'LI20' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P22', 'LI21' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P23', 'LI22' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P24', 'LI23' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P25', 'LI24' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P26', 'LI25' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P27', 'LI26' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P28', 'LI27' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P29', 'LI28' ,'Entregado' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P30', 'LI29' ,'Devuelto' );
INSERT INTO prestamo.detalle_prestamo ( nropres  ,idlibro  ,descripcion   ) VALUES ( 'P31', 'LI30' ,'Entregado' );



-- ==========================================================
-- Cargar datos a la tabla: prestamo
-- ==========================================================

INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P03', to_date('20190220','YYYYMMDD' ),'3','L03' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P04', to_date('20180322','YYYYMMDD' ),'5','L04' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P05', to_date('20190420','YYYYMMDD' ),'1','L05' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P06', to_date('20190321','YYYYMMDD' ),'6','L06' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P07', to_date('20190220','YYYYMMDD' ),'7','L07' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P08', to_date('20180521','YYYYMMDD' ),'2','L08' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P09', to_date('20190520','YYYYMMDD' ),'1','L09' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P10', to_date('20190322','YYYYMMDD' ),'3','L10' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P11', to_date('20190420','YYYYMMDD' ),'1','L11' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P12', to_date('20190321','YYYYMMDD' ),'6','L12' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P13', to_date('20190220','YYYYMMDD' ),'2','L13' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P14', to_date('20180521','YYYYMMDD' ),'2','L14' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P15', to_date('20190220','YYYYMMDD' ),'3','L15' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P16', to_date('20180322','YYYYMMDD' ),'3','L16' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P17', to_date('20170420','YYYYMMDD' ),'1','L17' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P18', to_date('20180321','YYYYMMDD' ),'10','L18');
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P19', to_date('20170220','YYYYMMDD' ),'1','L19' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P20', to_date('20150521','YYYYMMDD' ),'5','L20' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P21', to_date('20190220','YYYYMMDD' ),'8','L21' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P22', to_date('20140322','YYYYMMDD' ),'3','L21' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P23', to_date('20110420','YYYYMMDD' ),'1','L23' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P24', to_date('20190321','YYYYMMDD' ),'6','L24' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P25', to_date('20180220','YYYYMMDD' ),'2','L25' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P26', to_date('20180521','YYYYMMDD' ),'2','L26' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P27', to_date('20190220','YYYYMMDD' ),'3','L27' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P28', to_date('20190122','YYYYMMDD' ),'3','L28' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P29', to_date('20190420','YYYYMMDD' ),'1','L29' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P30', to_date('20190422','YYYYMMDD' ),'5','L04' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P31', to_date('20190322','YYYYMMDD' ),'1','L08' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P32', to_date('20190121','YYYYMMDD' ),'1','L14' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P33', to_date('20190121','YYYYMMDD' ),'4','L16' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P34', to_date('20190220','YYYYMMDD' ),'1','L17' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P35', to_date('20190220','YYYYMMDD' ),'1','L18');
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P36', to_date('20190220','YYYYMMDD' ),'2','L19' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P37', to_date('20190220','YYYYMMDD' ),'1','L20' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P38', to_date('20180620','YYYYMMDD' ),'3','L17' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P39', to_date('20180520','YYYYMMDD' ),'4','L18');
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P40', to_date('20180420','YYYYMMDD' ),'6','L19' );
INSERT INTO prestamo.prestamo ( nropres  ,Fecha_Prestamo,Cantidad_Libros  ,idlector) VALUES ( 'P41', to_date('20180320','YYYYMMDD' ),'2','L20' );


select * from prestamo.prestamo 



COMMIT;