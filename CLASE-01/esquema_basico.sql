1.- Iniciar sesión con usuario SYSTEM
	
	CONNECT SYSTEM/oracle
	
2.- Crear la cuenta

	CREATE USER demo IDENTIFIED BY admin;
	
3.- Asignarle el privilegio CREATE SESSION 
    para que pueda iniciar sesión.
	
	GRANT CREATE SESSION TO demo;
	
4.- Asignarle recursos al usuario.

	GRANT RESOURCE TO demo;
	
	
	


	