

select SID || ',' || SERIAL# SID, USERNAME, blocking_session 
from v$session 
where username = 'SYSTEM';

ALTER SYSTEM KILL SESSION '133,75' IMMEDIATE;