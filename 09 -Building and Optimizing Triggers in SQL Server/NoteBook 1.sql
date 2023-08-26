USE ITI2;

SELECT * FROM tab45;

/*TRIGGER DEFINITION (WITH AFTER) */

-- CREATE THE TRIGGER BY GIVING IT A DESCRIPTIVE NAME
CREATE TRIGGER NAMETrigger
-- THE TRIGGER TO BE ATTACHED TO A TABLE
ON tab45
-- THE TRIGGER BEHAVIOR TYPE
AFTER INSERT
-- THE BEGINING OF THE TRIGGER EXECUTION
AS
-- THE ACTION EXECUTED BY THE TRIGGER
PRINT('AN INSERT OF DATA WAS MADE IN THE TAB45 TABLE')

-- INSERT INTO TAB45

INSERT INTO tab45(id,name,degree,sal,did)
VALUES(36,'MINA','Master',20000,50)


INSERT INTO tab45(name,degree,sal,did)
VALUES('MINA','Master',20000,50)

-- DELETE EXEC
DELETE tab45
WHERE ID IS NULL

/*Trigger definition (with INSTEAD OF)*/

-- Create the trigger by giving it a descriptive name
CREATE TRIGGER PreventDeleteFromtab45
-- The trigger needs to be attached to a table
ON tab45
-- The trigger behavior type
INSTEAD OF DELETE
-- The beginning of the trigger workflow
AS
-- The action executed by the trigger
PRINT ('You are not allowed to delete rows from the tab45 table.');

-- DELETE EXEC
DELETE tab45
WHERE ID = 36 


/* INSTEAD OF trigger usage example */ 

CREATE TABLE Bubles
(
Brand Varchar(10),
Power Varchar(10),
Stock int
)
   
INSERT INTO Bubles(Brand,Power,Stock)
VALUES('Ecco','30W',30),
      ('Miry','50W',100 ),
	  ('Lume','52W',100)

SELECT * FROM Bubles

CREATE TABLE insert_bubles
(
Brand Varchar(10),
Power Varchar(10),
Stock int
)

SELECT * FROM insert_bubles


-- CREATE TRIGGER ON BUBLE PREVENT INSERT IF THE RECORD EXISTS
CREATE TRIGGER BulbsStockTrigger
ON Bubles
INSTEAD OF INSERT
AS
IF EXISTS (SELECT * 
FROM Bubles AS b
INNER JOIN insert_bubles AS i
ON b.Brand = i.Brand
WHERE b.Stock = 0)
BEGIN 
     UPDATE b
	 SET b.power = i.power,
	     b.stock = i.stock
     FROM Bubles AS b
	 INNER JOIN insert_bubles AS i
	 ON b.Brand = i.Brand
     WHERE b.Stock = 0 
END
ELSE
    INSERT INTO Bubles
	SELECT * FROM insert_bubles


INSERT INTO insert_bubles(Brand,Power,Stock)
VALUES('Ecco','30W',30)


INSERT INTO Bubles(Brand,Power,Stock)
VALUES('Ecco','30W',30)
