-- DataCamp
-- 02- Introduction To Relational DataBase in SQL

-- GET ALL SCHEMAS AND ALL TABLES
SELECT table_schema,table_name
FROM INFORMATION_SCHEMA.tables

-- GET PERSON SCHEMA AND THEIR TABLES 
SELECT table_schema,table_name
FROM INFORMATION_SCHEMA.tables
WHERE table_schema = 'PERSON'

-- GET DATA FROM PERSON.PERSON
SELECT * FROM Person.Person

-- GET COLUMN NAME AND DATA TYPES FOR PERSON TABLE
SELECT table_name,column_name,data_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'PERSON' AND table_schema = 'PERSON';

-- GET DATA FROM PERSON.PERSON
SELECT * FROM Person.Person

-- COUNT ALL DATA IN PERSON TABLE 
SELECT COUNT(*) FROM Person.Person

-- COUNT UNIQUE DATA IN PERSON TABLE
SELECT COUNT(DISTINCT LastName),
       COUNT(DISTINCT EmailPromotion )
FROM Person.Person

-- SELECT UNIQUE LASTNAME
SELECT DISTINCT LastName, PersonType, EmailPromotion 
FROM Person.Person

-- CREATE TABLE TO INSERT DATA IN IT
CREATE TABLE faketable123(
first_name varchar(125),
person_type varchar(25),
email_promotion bit
)

-- INSERT BASED ON SELECT 
insert into faketable123
SELECT DISTINCT LastName, PersonType,EmailPromotion
FROM Person.Person

-- SELECT DATA IN table
select * from faketable123

-- insert data with VALUES()
insert into faketable123(first_name,email_promotion)
values ('mina',2)

-- IN SQL SERVER YOU CAN'T RENAME TABLES OR COLUMNS WITH 'ALTER TABLE' 
-- BUT YOU CAN USE SP_RENAEME

ALTER TABLE faketable123
RENAME COLUMN first_name TO last_name;

-- USE SP_ TO RENAME COL_NAME AND TABLE_NAME
sp_rename 'faketable123.first_name', 'lname', 'COLUMN';
SP_RENAME 'faketable123' , 'MYFAKETABLE'

select * from MYFAKETABLE

-- ALTER TABLE TO ADD NEW COL
ALTER TABLE MYFAKETABLE
ADD EMAIL VARCHAR(255)

-- ALTER TABLE TO DROP EMAIL
ALTER TABLE MYFAKETABLE
DROP COLUMN EMAIL

-- DROP TABLE
drop table MYFAKETABLE