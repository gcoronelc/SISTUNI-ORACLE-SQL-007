--------------------------------------------------------
-- Archivo creado  - s�bado-mayo-11-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CLIENTE
--------------------------------------------------------

  CREATE TABLE "EVELYN"."CLIENTE" 
   (	"DNI_CLIE" VARCHAR2(10 BYTE), 
	"NOMBRE" VARCHAR2(60 BYTE), 
	"DIRECCION" VARCHAR2(60 BYTE), 
	"TELEFONO" VARCHAR2(10 BYTE), 
	"IDMECANICO" CHAR(5 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table COCHES
--------------------------------------------------------

  CREATE TABLE "EVELYN"."COCHES" 
   (	"MAT" VARCHAR2(6 BYTE), 
	"MARCA" VARCHAR2(10 BYTE), 
	"MODELO" VARCHAR2(10 BYTE), 
	"A�O_FAB" NUMBER(38,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FACTURAS
--------------------------------------------------------

  CREATE TABLE "EVELYN"."FACTURAS" 
   (	"NUM_FACTURA" CHAR(5 BYTE), 
	"FECHA" DATE, 
	"IMPORTE" FLOAT(126), 
	"DNI_CLIE" VARCHAR2(10 BYTE), 
	"IDREPORTE" VARCHAR2(10 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MECANICO
--------------------------------------------------------

  CREATE TABLE "EVELYN"."MECANICO" 
   (	"IDMECANICO" CHAR(5 BYTE), 
	"NOMBRE" VARCHAR2(25 BYTE), 
	"APELLIDO" VARCHAR2(25 BYTE), 
	"PUESTO" VARCHAR2(20 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REPORTE
--------------------------------------------------------

  CREATE TABLE "EVELYN"."REPORTE" 
   (	"IDREPORTE" VARCHAR2(10 BYTE), 
	"CONCEPTO" VARCHAR2(100 BYTE), 
	"CANTIDAD" NUMBER(38,0), 
	"IDRESPUESTO" VARCHAR2(10 BYTE), 
	"IDMECANICO" CHAR(5 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table REPUESTO
--------------------------------------------------------

  CREATE TABLE "EVELYN"."REPUESTO" 
   (	"IDRESPUESTO" VARCHAR2(10 BYTE), 
	"DESCRIPCION" VARCHAR2(60 BYTE), 
	"COSTOUNIT" NUMBER(38,0), 
	"IDTRABAJO" CHAR(2 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TRABAJOS
--------------------------------------------------------

  CREATE TABLE "EVELYN"."TRABAJOS" 
   (	"IDTRABAJO" CHAR(2 BYTE), 
	"HORAS" NUMBER(38,0), 
	"FECHA_REP" DATE, 
	"MAT" VARCHAR2(6 BYTE), 
	"IDMECANICO" CHAR(5 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into EVELYN.CLIENTE
SET DEFINE OFF;
Insert into EVELYN.CLIENTE (DNI_CLIE,NOMBRE,DIRECCION,TELEFONO,IDMECANICO) values ('75572331','EVELYN','GLORIA-ATE','987334399','001  ');
Insert into EVELYN.CLIENTE (DNI_CLIE,NOMBRE,DIRECCION,TELEFONO,IDMECANICO) values ('45896548','AXEL','SANJUAN-ATE','987458264','002  ');
Insert into EVELYN.CLIENTE (DNI_CLIE,NOMBRE,DIRECCION,TELEFONO,IDMECANICO) values ('86541298','DANIEL','RUISE�ORES','974125846','003  ');
Insert into EVELYN.CLIENTE (DNI_CLIE,NOMBRE,DIRECCION,TELEFONO,IDMECANICO) values ('87459625','TERESA','TUPAC-ATE','945155684','004  ');
Insert into EVELYN.CLIENTE (DNI_CLIE,NOMBRE,DIRECCION,TELEFONO,IDMECANICO) values ('84751269','JUANA','LAS FLORES-SJL','941258647','005  ');
Insert into EVELYN.CLIENTE (DNI_CLIE,NOMBRE,DIRECCION,TELEFONO,IDMECANICO) values ('14587958','EDGAR','VOLVO-STA ANITA','974856243','006  ');
REM INSERTING into EVELYN.COCHES
SET DEFINE OFF;
Insert into EVELYN.COCHES (MAT,MARCA,MODELO,"A�O_FAB") values ('AB1564','TOYOTA','YARIS','1999');
Insert into EVELYN.COCHES (MAT,MARCA,MODELO,"A�O_FAB") values ('JK3569','TOYOTA','ECTY','2004');
Insert into EVELYN.COCHES (MAT,MARCA,MODELO,"A�O_FAB") values ('GH1564','SUZUKI','CLIC','2002');
Insert into EVELYN.COCHES (MAT,MARCA,MODELO,"A�O_FAB") values ('TG4589','REFAULT','NEVER','2001');
Insert into EVELYN.COCHES (MAT,MARCA,MODELO,"A�O_FAB") values ('FD5489','HYUNDAI','MOFLI','2005');
Insert into EVELYN.COCHES (MAT,MARCA,MODELO,"A�O_FAB") values ('WF4521','REFAULT','CLIC','2003');
Insert into EVELYN.COCHES (MAT,MARCA,MODELO,"A�O_FAB") values ('FD1258','REFAULT','ABN4','2010');
REM INSERTING into EVELYN.FACTURAS
SET DEFINE OFF;
Insert into EVELYN.FACTURAS (NUM_FACTURA,FECHA,IMPORTE,DNI_CLIE,IDREPORTE) values ('F001 ',to_date('15/08/17','DD/MM/RR'),'56','75572331','REP1');
Insert into EVELYN.FACTURAS (NUM_FACTURA,FECHA,IMPORTE,DNI_CLIE,IDREPORTE) values ('F002 ',to_date('25/09/17','DD/MM/RR'),'124','45896548','REP2');
REM INSERTING into EVELYN.MECANICO
SET DEFINE OFF;
Insert into EVELYN.MECANICO (IDMECANICO,NOMBRE,APELLIDO,PUESTO) values ('001  ','EDDIE','REYES','AMORTIGUADOR');
Insert into EVELYN.MECANICO (IDMECANICO,NOMBRE,APELLIDO,PUESTO) values ('002  ','BRUNO','RUBI�OS','CHASIS');
Insert into EVELYN.MECANICO (IDMECANICO,NOMBRE,APELLIDO,PUESTO) values ('003  ','JORDAN','ROCCA','MOTOR');
Insert into EVELYN.MECANICO (IDMECANICO,NOMBRE,APELLIDO,PUESTO) values ('004  ','JEAN','GAL','CHAPA');
Insert into EVELYN.MECANICO (IDMECANICO,NOMBRE,APELLIDO,PUESTO) values ('005  ','MARCIO','FLORES','AMORTIGUADOR');
Insert into EVELYN.MECANICO (IDMECANICO,NOMBRE,APELLIDO,PUESTO) values ('006  ','HOLTON','TRAVER','CHASIS');
Insert into EVELYN.MECANICO (IDMECANICO,NOMBRE,APELLIDO,PUESTO) values ('007  ','WILMER','PAMPA','MOTOR');
Insert into EVELYN.MECANICO (IDMECANICO,NOMBRE,APELLIDO,PUESTO) values ('008  ','ANTONY','ARGUEDAS','CHAPA');
REM INSERTING into EVELYN.REPORTE
SET DEFINE OFF;
REM INSERTING into EVELYN.REPUESTO
SET DEFINE OFF;
Insert into EVELYN.REPUESTO (IDRESPUESTO,DESCRIPCION,COSTOUNIT,IDTRABAJO) values ('R01','VALVULAS','10','T1');
Insert into EVELYN.REPUESTO (IDRESPUESTO,DESCRIPCION,COSTOUNIT,IDTRABAJO) values ('R02','SOPLETE','26','T2');
Insert into EVELYN.REPUESTO (IDRESPUESTO,DESCRIPCION,COSTOUNIT,IDTRABAJO) values ('R03','RETROVISOR','35','T3');
Insert into EVELYN.REPUESTO (IDRESPUESTO,DESCRIPCION,COSTOUNIT,IDTRABAJO) values ('R04','VARILLA','45','T4');
REM INSERTING into EVELYN.TRABAJOS
SET DEFINE OFF;
Insert into EVELYN.TRABAJOS (IDTRABAJO,HORAS,FECHA_REP,MAT,IDMECANICO) values ('T1','5',to_date('17/05/18','DD/MM/RR'),'AB1564','001  ');
Insert into EVELYN.TRABAJOS (IDTRABAJO,HORAS,FECHA_REP,MAT,IDMECANICO) values ('T2','4',to_date('18/05/18','DD/MM/RR'),'JK3569','002  ');
Insert into EVELYN.TRABAJOS (IDTRABAJO,HORAS,FECHA_REP,MAT,IDMECANICO) values ('T3','2',to_date('18/05/18','DD/MM/RR'),'GH1564','002  ');
Insert into EVELYN.TRABAJOS (IDTRABAJO,HORAS,FECHA_REP,MAT,IDMECANICO) values ('T4','3',to_date('25/06/18','DD/MM/RR'),'TG4589','003  ');
Insert into EVELYN.TRABAJOS (IDTRABAJO,HORAS,FECHA_REP,MAT,IDMECANICO) values ('T5','5',to_date('26/06/18','DD/MM/RR'),'FD5489','004  ');
Insert into EVELYN.TRABAJOS (IDTRABAJO,HORAS,FECHA_REP,MAT,IDMECANICO) values ('T6','1',to_date('01/07/18','DD/MM/RR'),'WF4521','005  ');
Insert into EVELYN.TRABAJOS (IDTRABAJO,HORAS,FECHA_REP,MAT,IDMECANICO) values ('T7','4',to_date('15/07/18','DD/MM/RR'),'FD1258','006  ');
Insert into EVELYN.TRABAJOS (IDTRABAJO,HORAS,FECHA_REP,MAT,IDMECANICO) values ('T8','2',to_date('27/08/18','DD/MM/RR'),'GH1564','007  ');
Insert into EVELYN.TRABAJOS (IDTRABAJO,HORAS,FECHA_REP,MAT,IDMECANICO) values ('T9','5',to_date('16/09/18','DD/MM/RR'),'JK3569','008  ');
--------------------------------------------------------
--  DDL for Index SYS_C009945
--------------------------------------------------------

  CREATE UNIQUE INDEX "EVELYN"."SYS_C009945" ON "EVELYN"."CLIENTE" ("DNI_CLIE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C009966
--------------------------------------------------------

  CREATE UNIQUE INDEX "EVELYN"."SYS_C009966" ON "EVELYN"."FACTURAS" ("NUM_FACTURA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C009927
--------------------------------------------------------

  CREATE UNIQUE INDEX "EVELYN"."SYS_C009927" ON "EVELYN"."COCHES" ("MAT") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table REPORTE
--------------------------------------------------------

  ALTER TABLE "EVELYN"."REPORTE" MODIFY ("IDREPORTE" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."REPORTE" MODIFY ("CONCEPTO" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."REPORTE" MODIFY ("CANTIDAD" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."REPORTE" MODIFY ("IDRESPUESTO" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."REPORTE" MODIFY ("IDMECANICO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FACTURAS
--------------------------------------------------------

  ALTER TABLE "EVELYN"."FACTURAS" MODIFY ("NUM_FACTURA" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."FACTURAS" MODIFY ("FECHA" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."FACTURAS" MODIFY ("IMPORTE" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."FACTURAS" MODIFY ("DNI_CLIE" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."FACTURAS" MODIFY ("IDREPORTE" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."FACTURAS" ADD PRIMARY KEY ("NUM_FACTURA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table TRABAJOS
--------------------------------------------------------

  ALTER TABLE "EVELYN"."TRABAJOS" MODIFY ("IDTRABAJO" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."TRABAJOS" MODIFY ("HORAS" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."TRABAJOS" MODIFY ("FECHA_REP" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."TRABAJOS" MODIFY ("MAT" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."TRABAJOS" MODIFY ("IDMECANICO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MECANICO
--------------------------------------------------------

  ALTER TABLE "EVELYN"."MECANICO" MODIFY ("IDMECANICO" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."MECANICO" MODIFY ("NOMBRE" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."MECANICO" MODIFY ("APELLIDO" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."MECANICO" MODIFY ("PUESTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COCHES
--------------------------------------------------------

  ALTER TABLE "EVELYN"."COCHES" MODIFY ("MAT" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."COCHES" MODIFY ("MARCA" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."COCHES" MODIFY ("MODELO" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."COCHES" ADD PRIMARY KEY ("MAT")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table REPUESTO
--------------------------------------------------------

  ALTER TABLE "EVELYN"."REPUESTO" MODIFY ("DESCRIPCION" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."REPUESTO" MODIFY ("COSTOUNIT" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."REPUESTO" MODIFY ("IDTRABAJO" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."REPUESTO" MODIFY ("IDRESPUESTO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CLIENTE
--------------------------------------------------------

  ALTER TABLE "EVELYN"."CLIENTE" MODIFY ("DNI_CLIE" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."CLIENTE" MODIFY ("NOMBRE" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."CLIENTE" MODIFY ("DIRECCION" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."CLIENTE" MODIFY ("IDMECANICO" NOT NULL ENABLE);
 
  ALTER TABLE "EVELYN"."CLIENTE" ADD PRIMARY KEY ("DNI_CLIE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FACTURAS
--------------------------------------------------------

  ALTER TABLE "EVELYN"."FACTURAS" ADD FOREIGN KEY ("DNI_CLIE")
	  REFERENCES "EVELYN"."CLIENTE" ("DNI_CLIE") ENABLE;
