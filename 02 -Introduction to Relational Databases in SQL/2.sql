USE ITI2

-- CHECK ABOUT TABLE NAME THEN CREATE TABLE 
IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME = 'WEATHER')
DROP TABLE weather
GO

IF NOT EXISTS (SELECT * FROM SYSOBJECTS WHERE NAME = 'weather' )
CREATE TABLE weather(temperture int, wind_speed text)

GO

-- FEATCH DATA FROM TABLE
SELECT * FROM weather

-- GET OBJECTS FOR EVERY TABLE 
SELECT * FROM sysobjects

-- INSERT DATA INTO TABLE

INSERT INTO weather
VALUES (12,'25'),
       (25,'52'),
	   (41,'14')


-- FEATCH DATA FROM TABLE
SELECT * FROM weather

-- YOU CAN'T MAKE THIS EQUATION 
SELECT temperture * wind_speed AS WEATHEHER_CHILL
FROM weather

-- YOU CAN'T CONVERT TEXT DATA TIME TO INT IN ONE STEP
-- USE CONVERT FUNCTION TO CAST TEXT TO VARCHAR THEN INT 
SELECT temperture,
       wind_speed,
       temperture * CONVERT (INT, CONVERT (varchar(20), wind_speed)) AS WEATHEHER_CHILL
FROM weather
---------------------------------
-- CREATE TABLE
IF EXISTS(SELECT * FROM SYS.OBJECTS WHERE NAME ='faketable123')
DROP TABLE faketable123
GO

IF NOT EXISTS (SELECT * FROM SYS.objects WHERE NAME = 'faketable123')
CREATE TABLE faketable123(
  name varchar(25),
  avg_grads numeric(5,3)
)
GO

-- FEATCH DATA
select * from faketable123


-- INSERT DATA
insert into faketable123
values ('mina',25.32),
       ('maria',23.63),
	   ('mama', 10.26),
	   ('ref', 25.99),
	   ('dof', 10.26),
	   ('bob', 33.25),
	   ('doc', 25.89),
	   ('zok', 74.78),
	   ('mok', 85.85),
	   ('kok', 25.12)

-- FETCH DATA
select * from faketable123

-- SELECT ROUND UPPER AND DOWN
select name,avg_grads,cast(avg_grads as int) , round(avg_grads,0)
from faketable123

-- MODIFY CONSTRAINTS
ALTER TABLE faketable123
ALTER COLUMN name varchar(125) NOT NULL;

-- truncate table 
TRUNCATE TABLE faketable123

-- INSERT DATA IN TABLE
insert into faketable123
values ('mina',25.32),
       ('maria',23.63),
	   ('mama', 10.26)
--ADD CONSTRAUNT
ALTER TABLE faketable123
ADD CONSTRAINT UN_name unique(name)

-- YOU CAN'T ADD ROW BECAUSE NAME COL NOT ALLOW NULL VALUES
insert into faketable123(avg_grads)
values (25.32)

-- YOU CAN'T ADD ROW BECAUSE NAME UNIQUE VALUE
insert into faketable123
values ('mina',25.32)

