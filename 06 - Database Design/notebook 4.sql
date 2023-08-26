-- Granting and REvoke Access To a View

GRANT Privilegs OR REVOKE Privilegs
ON OBJECT
TO ROLE OR FROM ROLE

-- Privilges:- SELECT/INSERT/UPDATE/DELETE
-- OBJECTS:- TABLE/VIEW/SCHEMA
-- ROLES:- DB user OR Group Of DB user
GRANT UPDATE ON tab45 TO PUBLIC;
REVOKE INSERT ON tab44 FROM data_engineer;

-- CREATE A ROLE
-- 1- Empty Role 
CREATE ROLE data_engineer;
-- 2- Role with some attributes set
CREATE ROLE intern WITH PASSWORD 'MINAADEL123' VALID UNTIL '2023-08-25';


CREATE ROLE mina;


CREATE USER YourUser WITH PASSWORD = 'YourPassword';
ALTER LOGIN YourUser WITH PASSWORD = 'YourPassword', CHECK_EXPIRATION = ON, CHECK_POLICY = OFF;
