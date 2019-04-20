
alter system 
set db_domain='uni.pe' 
scope=spfile;

connect / as sysdba

shutdown immediate

startup



