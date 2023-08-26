-- TRANSACTIONS
USE ITI2;
GO
CREATE TABLE tblPhysicalAddress(
Addressid int,
EmployeeNumber int,
HouseNumber VARCHAR(5),
StreetAddress VARCHAR(20),
City VARCHAR(10),
PostalCode VARCHAR(10)
);

CREATE TABLE tblMailingAddress(
Addressid int,
EmployeeNumber int,
HouseNumber VARCHAR(5),
StreetAddress VARCHAR(20),
City VARCHAR(10),
PostalCode VARCHAR(10)
);

INSERT INTO tblPhysicalAddress
VALUES(1,101,'#10','King Street','LONDOON','CR27DW')

INSERT INTO tblMailingAddress
VALUES(1,101,'#10','King Street','LONDOON','CR27DW')


GO
---------------------------------------
SELECT * FROM tblPhysicalAddress
SELECT * FROM tblMailingAddress
---------------------

CREATE PROCEDURE spUpdateAddress
AS
BEGIN 
    BEGIN TRY
	   BEGIN TRANSACTION
	     UPDATE tblPhysicalAddress SET City = 'LONDON'
		 WHERE Addressid = 1 AND EmployeeNumber = 101

		 UPDATE tblMailingAddress SET City = 'LONDON'
		 WHERE Addressid = 1 AND EmployeeNumber = 101
       COMMIT TRANSACTION
	   PRINT 'Transaction Committed'
	END TRY
	BEGIN CATCH
	   ROLLBACK TRANSACTION
	   PRINT 'TRANSACTION ROLLBACK'
	END CATCH
END
------------------------------------------
SELECT * FROM tblPhysicalAddress
SELECT * FROM tblMailingAddress
-----------------------------------------
ALTER PROCEDURE spUpdateAddress
AS
BEGIN 
    BEGIN TRY
	   BEGIN TRANSACTION
	     UPDATE tblPhysicalAddress SET City = 'LONDON1'
		 WHERE Addressid = 1 AND EmployeeNumber = 101

		 UPDATE tblMailingAddress SET City = 'LONDON LONDON MIMIMIMIMI'
		 WHERE Addressid = 1 AND EmployeeNumber = 101
       COMMIT TRANSACTION
	   PRINT 'Transaction Committed'
	END TRY
	BEGIN CATCH
	   ROLLBACK TRANSACTION
	   PRINT 'TRANSACTION ROLLBACK'
	END CATCH
END