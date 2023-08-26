CREATE TABLE name_informations
(
id int identity(0,1),
dname varchar(5),
age int
)

select * from name_informations

set ansi_warnings off

insert into name_informations(dname,age)
values ('mina',25),
       ('nesreen',28),
	   ('nermeen',30),
	   ('Rana',24)

SELECT * FROM name_informations

-- Add Constrains
ALTER TABLE name_informations
ADD CONSTRAINT UNIQUE_NAME_INFORMATION UNIQUE(dname);

-- INSERT VALUES IN name_informations

INSERT INTO name_informations(dname,age)
VALUES('mina',25)
-- Handel The Error
BEGIN TRY
     
		INSERT INTO name_informations(dname,age)
		VALUES('adel',50)

END TRY
BEGIN CATCH

	SELECT 'An error occurred! You are in the CATCH block' AS message;

END CATCH

-- Error anatomy
SELECT * FROM sys.messages

DROP TABLE Error_Message
-- Create Error Table

CREATE TABLE Error_Message_ 
(error_num int,
 erroe_server int,
 error_state_num int,
 error_procedure_ varchar(10),
 error_line_num int,
 error_messages varchar(100)
)
SELECT * FROM Error_Message_
SET ansi_warnings OFF

-- Handel The Error

BEGIN TRY
     
		INSERT INTO name_informations(dname,age)
		VALUES('mina',25)

END TRY
BEGIN CATCH

	INSERT INTO Error_Message_(error_num,erroe_server,error_state_num ,
	                          error_procedure_ ,error_line_num ,error_messages)
	VALUES(ERROR_NUMBER(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE())
	
	SELECT * FROM Error_Message_
END CATCH