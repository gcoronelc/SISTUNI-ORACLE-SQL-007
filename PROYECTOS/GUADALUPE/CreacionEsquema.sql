/**
 *
 * DBMS           :  ORACLE
 * Esquema        :  EX
 * Descripción    :  Modelo de EXcimiento sencillo
 * Script         :  Crea el esquema y sus respectivas tablas
 * Creado por     :  Brenda Guadusupe Moreno
 * Fecha          :  10-MAY-2019
 * 
**/


-- =============================================
-- CREACIÓN DEL USUARIO
-- =============================================

DECLARE
	N INT;
	COMMAND VARCHAR2(200);
BEGIN
	COMMAND := 'DROP USER EX CASCADE';
	SELECT COUNT(*) INTO N
	FROM DBA_USERS
	WHERE USERNAME = 'EX';
	IF ( N = 1 ) THEN
		EXECUTE IMMEDIATE COMMAND;
	END IF;
END;
/


CREATE USER EX IDENTIFIED BY admin;

GRANT CONNECT, RESOURCE TO EX;

ALTER USER EX
QUOTA UNLIMITED ON USERS;

GRANT CREATE VIEW TO EX;



-- =============================================
-- CONECTARSE A LA APLICACIÓN
-- =============================================

CONNECT EX/admin


-- ======================================================
-- TABLA SEDE
-- ======================================================

CREATE TABLE SEDE
( 
	sed_id               INT NOT NULL ,
	sed_nombre           varchar2(100)  NOT NULL ,
	sed_descripcion      varchar2(100)  NOT NULL 
);


-- ======================================================
-- RESTRICCIONES DE LA TABLA SEDE
-- ======================================================

--Clave Primaria
ALTER TABLE SEDE
	ADD CONSTRAINT PK_DEPARTAMENTO 
	PRIMARY KEY (sed_id);

--El NOMBRE de la SEDE es unico
ALTER TABLE SEDE
	ADD CONSTRAINT sed_nombre 
	UNIQUE (sed_nombre);

-- ======================================================
-- TABLA USUARIO
-- ======================================================

CREATE TABLE USUARIO
( 
	usu_id               INT  NOT NULL ,
	sed_id               INT  NOT NULL ,
	usu_nombre           varchar2(100)  NOT NULL ,
	usu_direccion        varchar2(100)  NOT NULL ,
	usu_telefono         varchar2(20)  NULL ,
	usu_email            varchar2(100)  NULL 	
);

-- ======================================================
-- RESTRICCIONES DE LA TABLA USUARIO
-- ======================================================

-- CLAVE PRIMARIA

ALTER TABLE USUARIO
	ADD CONSTRAINT pk_USUARIO 
	PRIMARY KEY (usu_id);
	
	
-- CLAVE FORANEA

ALTER TABLE USUARIO
	ADD CONSTRAINT FK_USUARIO_SEDE
	FOREIGN KEY (sed_id) 
	REFERENCES SEDE(sed_id);


-- El email del USUARIO es único

ALTER TABLE USUARIO
	ADD CONSTRAINT u_EMAIL
	UNIQUE (usu_email);

-- ======================================================
-- TABLA PRODUCTO
-- ======================================================

CREATE TABLE PRODUCTO
( 
	prd_id               INT NOT NULL ,
	prd_nombre           varchar2(100)  NOT NULL ,
	prd_descripcion      varchar2(100)  NOT NULL 
);

-- ======================================================
-- RESTRICCIONES DE LA TABLA PRODUCTO
-- ======================================================

--Clave Primaria
ALTER TABLE PRODUCTO
	ADD CONSTRAINT PK_PRODUCTO 
	PRIMARY KEY (prd_id);

--El NOMBRE de la PRODUCTO es unico
ALTER TABLE PRODUCTO
	ADD CONSTRAINT prd_nombre 
	UNIQUE (prd_nombre);

-- ======================================================
-- TABLA PEDIDO
-- ======================================================

CREATE TABLE PEDIDO
( 
	usu_id				 INT NOT NULL ,
	prd_id               INT NOT NULL ,
	ped_id               INT NOT NULL ,
	ped_descripcion      varchar2(100)  NOT NULL ,
	ped_cantidad         decimal(10,2)  NOT NULL ,
	ped_fechaini         date  NOT NULL ,
	ped_fechafin         date  NULL ,
	ped_estado           varchar2(100)  NULL
);

-- ======================================================
-- RESTRICCIONES DE LA TABLA PEDIDO
-- ======================================================

ALTER TABLE PEDIDO
	ADD CONSTRAINT PK_PEDIDO 
	PRIMARY KEY (usu_id, prd_id, ped_id);


ALTER TABLE PEDIDO
	ADD CONSTRAINT FK_PEDIDO_USUARIO 
	FOREIGN KEY (usu_id) 
	REFERENCES USUARIO(usu_id);


ALTER TABLE PEDIDO
	ADD CONSTRAINT FK_PEDIDO_PRODUCTO 
	FOREIGN KEY (prd_id) 
	REFERENCES PRODUCTO(prd_id);
	

ALTER TABLE PEDIDO
	ADD CONSTRAINT  CHK_PEDIDO_CANTIDAD
	CHECK  ( ped_cantidad > 0.0 );

-- ======================================================
-- TABLA COMPANIA
-- ======================================================

CREATE TABLE COMPANIA
( 
	com_id               INT  NOT NULL ,
	com_nombre           varchar2(100)  NOT NULL ,
	com_RUC              varchar2(10)  NOT NULL,
	com_telefono         varchar2(9)  NOT NULL ,
	com_correo           varchar2(100)  NOT NULL ,
	com_direccion        varchar2(100)  NOT NULL  
);

-- ======================================================
-- RESTRICCIONES DE LA TABLA COMPANIA
-- ======================================================

-- CLAVE PRIMARIA

ALTER TABLE COMPANIA
	ADD CONSTRAINT pk_COMPANIA 
	PRIMARY KEY (com_id);
	
	
-- El RUC del COMPANIA es único

ALTER TABLE COMPANIA
	ADD CONSTRAINT c_RUC
	UNIQUE (com_RUC);

-- ======================================================
-- TABLA PROVEEDOR
-- ======================================================

CREATE TABLE PROVEEDOR
( 
	pro_id               INT  NOT NULL ,
	com_id               INT  NOT NULL ,
	pro_nombre           varchar2(100)  NOT NULL ,
	pro_DNI              varchar2(8)  NOT NULL,
	pro_telefono         varchar2(9)  NOT NULL ,
	pro_correo           varchar2(100)  NOT NULL 
);

-- ======================================================
-- RESTRICCIONES DE LA TABLA PROVEEDOR
-- ======================================================

-- CLAVE PRIMARIA

ALTER TABLE PROVEEDOR
	ADD CONSTRAINT pk_PROVEEDOR 
	PRIMARY KEY (pro_id);
	
	
-- CLAVE FORANEA

ALTER TABLE PROVEEDOR
	ADD CONSTRAINT FK_PROVEEDOR_COMPANIA
	FOREIGN KEY (com_id) 
	REFERENCES COMPANIA(com_id);


-- El DNI del PROVEEDOR es único

ALTER TABLE PROVEEDOR
	ADD CONSTRAINT p_DNI
	UNIQUE (pro_DNI);

-- ======================================================
-- TABLA CONTRATO
-- ======================================================

CREATE TABLE CONTRATO
( 
	con_id               INT  NOT NULL ,
	pro_id               INT  NOT NULL ,
	usu_id               INT  NOT NULL ,
	prd_id               INT  NOT NULL ,
	ped_id               INT  NOT NULL ,
	con_fecha            date  NOT NULL,
	con_descripcion      varchar2(100)  NOT NULL ,
	con_precio           decimal(10,2)  NOT NULL 
);

-- ======================================================
-- RESTRICCIONES EN LA TABLA CONTRATO
-- ======================================================

-- Clave Primaria

ALTER TABLE CONTRATO
	ADD CONSTRAINT PK_CONTRATO 
	PRIMARY KEY (con_id);


-- Clave Foránea

ALTER TABLE CONTRATO
	ADD CONSTRAINT FK_CONTRATO_PROVEEDOR 
	FOREIGN KEY (pro_id) 
	REFERENCES PROVEEDOR(pro_id);

-- Clave Foránea

ALTER TABLE CONTRATO
	ADD CONSTRAINT FK_CONTRATO_USUARIO 
	FOREIGN KEY (usu_id, prd_id, ped_id) 
	REFERENCES PEDIDO(usu_id, prd_id, ped_id);


-- ======================================================
-- TABLA FACTURA
-- ======================================================

CREATE TABLE FACTURA
( 
	fac_id               INT  NOT NULL ,
	con_id               INT  NOT NULL ,
	fac_fecha            date  NOT NULL ,
	fac_descripcion      varchar2(100)  NOT NULL ,
	fac_precio           decimal(10,2)  NOT NULL ,
	fac_igv              decimal(10,2)  NOT NULL ,
	fac_apagar           decimal(10,2)  NOT NULL
);

-- ======================================================
-- RESTRICCIONES EN LA TABLA FACTURA
-- ======================================================

-- Clave Primaria

ALTER TABLE FACTURA
	ADD CONSTRAINT PK_FACTURA
	PRIMARY KEY (fac_id);

-- Clave Foránea

ALTER TABLE FACTURA
	ADD CONSTRAINT FK_FACTURA_CONTRATO
	FOREIGN KEY (con_id) 
	REFERENCES CONTRATO(con_id);
