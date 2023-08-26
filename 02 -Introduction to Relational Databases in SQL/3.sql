USE ITI2
-- CREATE TABLE
IF EXISTS(SELECT * FROM SYS.OBJECTS WHERE NAME ='MARKETTABLE')
DROP TABLE MARKETTABLE
GO

IF NOT EXISTS (SELECT * FROM SYS.objects WHERE NAME = 'MARKETTABLE')
CREATE TABLE MARKETTABLE(
  fname varchar(25),
  lname varchar(25),
  proft int,
  gross int
)
GO

-- FETCH DATA
SELECT * FROM MARKETTABLE

-- INSERT DATA
insert into MARKETTABLE
values ('mina','adel',25.32,36),
       ('maria','hany',23.63,584),
	   ('mama','mom', 10.26,568),
	   ('ref','soc', 25.99,365),
	   ('dof','bef', 10.26,547),
	   ('bob','gek', 33.25,243),
	   ('doc','lok', 25.89,857),
	   ('zok','png', 74.78,587),
	   ('mok','mal', 85.85,356),
	   ('kok','ckx', 25.12,578)
-- FETCH DATA
SELECT * FROM MARKETTABLE


-- CREATE TABLE FOR DEALWITH SERIES DATATYPE

IF EXISTS (SELECT * FROM SYS.objects WHERE NAME = 'carsmodels')
DROP TABLE carsmodels 
GO

IF NOT EXISTS (SELECT * FROM SYS.OBJECTS WHERE NAME = 'carsmodels')
CREATE TABLE carsmodels(
make varchar(25),
model varchar(25),
color varchar(25)
)

-- SELECT THE TABLE
SELECT * FROM carsmodels

--INSERT DATA INTO TABLE 
INSERT INTO carsmodels
VALUES('Ford','Mustang','blue'),
      ('Oldsmobile','Cutlass','black'),
	  ('Oldsmobile','Delta','silver'),
	  ('Oldsmobile','Delta','silver'),
	  ('Oldsmobile','Delta','silver'),
	  ('Mercedes','190-D','champagne'),
	  ('Toyota','Camry','red'),
	  ('Jaguar','XJS','blue'),
	  ('Volkswagen','Blitz','black')

-- SELECT THE TABLE
SELECT * FROM carsmodels

--ADD COLUMN 'ID' WITH DATATYPE 'SERIAL'
-- SQL SERVER DON'T HAVE 'SERIES' DATATYPE BUT YOU CAN USE 'INT' WITH 'IDENTITY(1,1'
-- TO MAKE THE SAME ACTION
ALTER TABLE carsmodels
ADD id int IDENTITY(1,1) PRIMARY KEY;	

-- SELECT THE TABLE
SELECT * FROM carsmodels

--YOU CAN'T ADD BECAUES THE 'IDENTITY' ON 
INSERT INTO carsmodels
VALUES ('Opel','Astra','green', 1);

-- ADD NEW TABLE TO BE A SURROGATE KEY
ALTER TABLE carsmodels
ADD SURROGATE_KEY VARCHAR(45)

-- UPDATE THE TABLE TO GIVE VALUE FOR SURROGATE_KEY
UPDATE carsmodels
SET SURROGATE_KEY = CONCAT(make,model,color,id)

-- SELECT THE TABLE
SELECT * FROM carsmodels

-- MODIFY CONSTRAINTS
-- BUT YOU CAN'T RUN BECAUSE EVERY TABLE HAVE ONE PRIMARY KEY
ALTER TABLE carsmodels
ALTER COLUMN SURROGATE_KEY PRIMARY KEY;



SELECT COUNT(DISTINCT(make, model)) 
FROM carsmodels;

