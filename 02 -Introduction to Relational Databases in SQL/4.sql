-- Create table manufacturing
IF EXISTS (SELECT * FROM SYS.objects WHERE NAME = 'manufacturing')
DROP TABLE manufacturing
GO

IF NOT EXISTS (SELECT * FROM SYS.objects WHERE NAME = 'manufacturing')
CREATE TABLE manufacturing(
name varchar(20) primary key
)

insert into manufacturing
values ('ford'),('vm'),('gm')

-- GET THE DATA
SELECT * FROM manufacturing

-- CREATE TABLE 
IF EXISTS (SELECT * FROM SYS.objects WHERE NAME = 'CARS')
DROP TABLE CARS
GO


IF NOT EXISTS (SELECT * FROM SYS.objects WHERE NAME = 'CARS')
CREATE TABLE CARS(
model varchar(20) primary key,
manucatering_name varchar(20) REFERENCES manufacturing (name)
)

INSERT INTO CARS
values('RANGER','ford'),
      ('battle','vm') 
		
select * from CARS


