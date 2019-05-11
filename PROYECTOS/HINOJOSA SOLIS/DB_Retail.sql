--1. CREAR el Tablespace
CREATE TABLESPACE TDB_RETAIL
DATAFILE 'I:\APP\TDB\DF_RETAIL.DBF'
SIZE 10M;

--Validar espacio total en MB
SELECT 
	tablespace_name,
	round(sum(BYTES/1024/1024),0) ESPACIO_MB
FROM dba_data_files b
WHERE tablespace_name LIKE 'TDB_RE%'
GROUP BY b.tablespace_name
ORDER BY 1;

----------------------------------------------------------------------------
--2. CREAR Usuario
CREATE USER RETAIL IDENTIFIED BY admin;

SELECT USERNAME FROM DBA_USERS
WHERE USERNAME LIKE 'RETAIL%';

----------------------------------------------------------------------------
--3. Asignar Tablespace al Usuario
ALTER USER RETAIL 
	DEFAULT TABLESPACE TDB_RETAIL 
	QUOTA UNLIMITED ON TDB_RETAIL;
	
SELECT USERNAME, DEFAULT_TABLESPACE 
FROM DBA_USERS
WHERE USERNAME LIKE 'RETAIL%';

SELECT * FROM DBA_TS_QUOTAS
WHERE USERNAME LIKE 'RETAIL%';

----------------------------------------------------------------------------
--4. Asignar privilegios a Usuario
GRANT CREATE SESSION TO RETAIL;

GRANT CREATE TABLE TO RETAIL;

----------------------------------------------------------------------------
--5. CREAR TABLAS

CREATE TABLE RETAIL.t_Cliente(
	id_Cliente char(7) NOT NULL,
	id_ClienteTipo char(3) NOT NULL,
	c_Estado char(1) NOT NULL,
	v_Nombres varchar(100) NULL,
	v_Apellidos varchar(100) NULL,
	id_DocIdent char(3) NULL,
	c_NumDocIdent nchar(15) NULL,
	v_RazonSocial varchar(150) NULL,
	c_Ruc nchar(13) NULL,
	c_RucNat nchar(13) NULL,
	v_Direccion nchar(10) NULL,
	c_Telefono nchar(15) NULL,
	c_Celular nchar(20) NULL,
	v_email varchar(150) NULL,
	id_UsuarioCrea char(5) NULL,
	d_FechaCrea date NULL,
	idUsuarioMod char(5) NULL,
	d_FechaMod date NULL,
	nSaldoSol numeric(14, 4) NULL,
	nSaldoDol numeric(14, 4) NULL,
 CONSTRAINT PK_t_Cliente PRIMARY KEY (id_Cliente)
);


CREATE TABLE RETAIL.t_Usuario(
	id_Usuario char(5) NOT NULL,
	v_Nombres varchar(100) NOT NULL,
	v_Apellidos varchar(100) NOT NULL,
	id_DocIdent char(3) NULL,
	c_NumDocIdent nchar(15) NULL,
	c_Login nchar(10) NOT NULL,
	v_Clave varchar(10) NOT NULL,
	v_Direccion nchar(10) NULL,
	c_Telefono nchar(15) NULL,
	c_Celular nchar(20) NULL,
	v_email varchar(150) NULL,
	id_Estado char(3) NOT NULL,
	id_UsuarioCrea char(5) NULL,
	d_FechaCrea date NULL,
	id_UsuarioMod char(5) NULL,
	d_FechaMod date NULL,
 CONSTRAINT PK_t_Usuario PRIMARY KEY (id_Usuario)
);


CREATE TABLE RETAIL.t_DocumentoTipo(
	id_DocTipo char(2) NOT NULL,
	v_Descripcion varchar(50) NOT NULL,
	v_DescCorta varchar(10) NOT NULL,
 CONSTRAINT PK_t_DocumentoTipo PRIMARY KEY (id_DocTipo)
);


CREATE TABLE RETAIL.t_ParametroTipo(
	id_ParametroTipo char(3) NOT NULL,
	v_Descripcion varchar(100) NOT NULL,
	v_Observacion varchar(250) NULL,
 CONSTRAINT PK_t_ParametroTipo PRIMARY KEY (id_ParametroTipo)
);


CREATE TABLE RETAIL.t_Parametro(
	id_Parametro char(3) NOT NULL,
	id_ParametroTipo char(3) NOT NULL,
	v_Descripcion varchar(50) NOT NULL,
	c_DescCorta nchar(5) NULL,
	v_Observacion varchar(250) NULL,
 CONSTRAINT PK_t_Parametro PRIMARY KEY (id_Parametro)
);
ALTER TABLE RETAIL.t_Parametro ADD CONSTRAINT FK_t_Parametro_ParametroTipo FOREIGN KEY(id_ParametroTipo)
REFERENCES RETAIL.t_ParametroTipo (id_ParametroTipo);


CREATE TABLE RETAIL.t_Modena(
    id_Moneda char(2) NOT NULL,
    v_Descripcion varchar(20) NOT NULL,
	c_Simbolo nchar(3) NULL,
 CONSTRAINT PK_t_Modena PRIMARY KEY (id_Moneda)
);


CREATE TABLE RETAIL.t_Banco(
    id_Banco char(2) NOT NULL,
    v_Descripcion varchar(20) NOT NULL,
	c_DescCorta nchar(5) NULL,
 CONSTRAINT PK_t_Banco PRIMARY KEY (id_Banco)
);


CREATE TABLE RETAIL.t_Tarjeta(
    id_Tarjeta char(2) NULL,
    v_Descripcion varchar(20) NOT NULL,
	c_DescCorta nchar(5) NULL,
    c_TipoTarjeta char(1) NOT NULL,
 CONSTRAINT PK_t_Tarjeta PRIMARY KEY (id_Tarjeta)
);


CREATE TABLE RETAIL.t_DocVenta19(
	id_Doc char(7) NOT NULL,
	id_DocTipo char(2) NOT NULL,
	id_TipoVenta char(3) NOT NULL,
	id_Cliente char(7) NOT NULL,
	c_Numero char(11) NULL,
	d_Fecha date NOT NULL,
	n_ImporteSol numeric(14, 4) NOT NULL,
	n_ImporteDol numeric(14, 4) NOT NULL,
	n_TipoCambio numeric(6, 4) NOT NULL,
	n_Igv numeric(4, 2) NOT NULL,
	id_Moneda char(2) NOT NULL,
	id_Estado char(3) NOT NULL,
	id_UsuarioCrea char(5) NULL,
	d_FechaCrea date NULL,
	idUsuarioMod char(5) NULL,
	d_FechaMod date NULL,
    id_Promocion char(7) NULL,
	v_Observacion varchar(400) NULL,
 CONSTRAINT PK_t_DocVenta19 PRIMARY KEY (id_Doc)
);
ALTER TABLE RETAIL.t_DocVenta19 ADD CONSTRAINT FK_t_DocVenta19_Cliente FOREIGN KEY(id_Cliente)
REFERENCES RETAIL.t_Cliente (id_Cliente);


CREATE TABLE RETAIL.t_DocVentaDet19(
	id_Doc char(7) NOT NULL,
	c_Secuencia char(3) NOT NULL,
	c_CodigoBarra char(9) NOT NULL,
	v_Descripcion varchar(100) NULL,
	n_PorcDesc numeric(5, 2) NOT NULL,
	n_Cantidad smallint NOT NULL,
	n_CantidadNC smallint NULL,
	n_PrecioUnitSol numeric(14, 4) NOT NULL,
	n_PrecioSIgvSol numeric(14, 4) NOT NULL,
	n_ImporteSol numeric(14, 4) NOT NULL,
	n_PrecioUnitDol numeric(14, 4) NOT NULL,
	n_PrecioSIgvDol numeric(14, 4) NOT NULL,
	n_ImporteDol numeric(14, 4) NOT NULL,
	n_PrecioRegSol numeric(14, 4) NULL,
	n_PrecioRegDol numeric(14, 4) NULL,
    c_Promocion char(1) NULL
);
ALTER TABLE RETAIL.t_DocVentaDet19 ADD CONSTRAINT FK_t_DocVentaDet_DocVenta19 FOREIGN KEY(id_Doc)
REFERENCES RETAIL.t_DocVenta19 (id_Doc);


CREATE TABLE RETAIL.t_DocVentaPag19(
	id_Doc char(7) NOT NULL,
	c_Secuencia char(3) NOT NULL,
    id_TipoPago char(3) NOT NULL,
    id_Moneda char(2) NOT NULL,
    id_Banco char(2) NULL,
    id_Tarjeta char(2) NULL,
    id_DocRef char(7) NULL,
	n_Importe numeric(14, 4) NOT NULL
);
ALTER TABLE RETAIL.t_DocVentaPag19 ADD CONSTRAINT FK_t_DocVentaPag_DocVenta19 FOREIGN KEY(id_Doc)
REFERENCES RETAIL.t_DocVenta19 (id_Doc);


CREATE TABLE RETAIL.t_Linea(
	id_Linea char(3) NOT NULL,
    v_Descripcion varchar(20) NOT NULL,
	c_DescCorta nchar(5) NULL,
 CONSTRAINT PK_t_Linea PRIMARY KEY (id_Linea)
);

CREATE TABLE RETAIL.t_Departamento(
	id_Departamento char(3) NOT NULL,
    v_Descripcion varchar(20) NOT NULL,
	c_DescCorta nchar(5) NULL,
 CONSTRAINT PK_t_Departamento PRIMARY KEY (id_Departamento)
);

CREATE TABLE RETAIL.t_Clase(
	id_Clase char(3) NOT NULL,
    v_Descripcion varchar(20) NOT NULL,
	c_DescCorta nchar(5) NULL,
 CONSTRAINT PK_t_Clase PRIMARY KEY (id_Clase)
);

CREATE TABLE RETAIL.t_SubClase(
	id_SubClase char(3) NOT NULL,
    v_Descripcion varchar(20) NOT NULL,
	c_DescCorta nchar(5) NULL,
 CONSTRAINT PK_t_SubClase PRIMARY KEY (id_SubClase)
);


CREATE TABLE RETAIL.t_ClasificacionArt(
	id_ClasArt char(7) NOT NULL,
    id_Linea char(3) NOT NULL,
    id_Departamento char(3) NOT NULL,
    id_Clase char(3) NOT NULL,
    id_SubClase char(3) NOT NULL,
 CONSTRAINT PK_t_ClasificacionArt PRIMARY KEY (id_ClasArt)
);


CREATE TABLE RETAIL.t_Articulo(
	id_Articulo char(7) NOT NULL,
    id_Marca char(3) NOT NULL,
    id_ClasArt char(7) NOT NULL,
    id_Proveedor char(3) NOT NULL,
    id_Temporada char(3) NOT NULL,
    c_CodArtProv nchar(10) NOT NULL,
 CONSTRAINT PK_t_Articulo PRIMARY KEY (id_Articulo)
);
ALTER TABLE RETAIL.t_Articulo ADD CONSTRAINT FK_t_Articulo_ClasificacionArt FOREIGN KEY(id_ClasArt)
REFERENCES RETAIL.t_ClasificacionArt (id_ClasArt);

CREATE TABLE RETAIL.t_ArticuloOrig(
	id_Articulo char(7) NOT NULL,
    c_SecuenciaOrig char(3) NOT NULL,
    v_DescOrig nchar(100) NOT NULL
);
ALTER TABLE RETAIL.t_ArticuloOrig ADD CONSTRAINT FK_t_ArticuloOrig_Articulo FOREIGN KEY(id_Articulo)
REFERENCES RETAIL.t_Articulo (id_Articulo);

CREATE TABLE RETAIL.t_ArticuloColor(
	id_Articulo char(7) NOT NULL,
    c_SecuenciaColor char(3) NOT NULL,
    c_SecuenciaOrig char(3) NOT NULL,
    id_Color char(3) NOT NULL,
    v_CodArtProv nchar(100) NOT NULL,
    n_PrecioRegSol numeric(14, 4) NULL,
	n_PrecioRegDol numeric(14, 4) NULL
);
ALTER TABLE RETAIL.t_ArticuloColor ADD CONSTRAINT FK_t_ArticuloColor_Articulo FOREIGN KEY(id_Articulo)
REFERENCES RETAIL.t_Articulo (id_Articulo);

CREATE TABLE RETAIL.t_ArticuloTalla(
    id_Articulo char(7) NOT NULL,
    c_SecuenciaColor char(3) NOT NULL,
    id_Tallaje char(3) NOT NULL,
    id_Talla char(4) NOT NULL,
    c_CodigoBarra char(9) NOT NULL,
    c_EAN13 char(13) NOT NULL,
    c_SKU char(7) NOT NULL
);
ALTER TABLE RETAIL.t_ArticuloTalla ADD CONSTRAINT FK_t_ArticuloTalla_Articulo FOREIGN KEY(id_Articulo)
REFERENCES RETAIL.t_Articulo (id_Articulo);


----------------------------------------------------------------------------
--6.

/*INSERT INTO RETAIL.T_CLIENTE
SELECT LEVEL, 'DATO_'||LEVEL, SYSDATE
FROM DUAL CONNECT BY LEVEL <= 10;*/

SELECT * FROM RETAIL.T_CLIENTE
WHERE
    id_ClienteTipo = 'X'    --X: Natural | Juridico
    AND c_Estado = 'Y';      --Y: A | I

SELECT * FROM RETAIL.T_CLIENTE
WHERE d_FechaCrea BETWEEN '01/01/2016' AND '01/05/2019'



























