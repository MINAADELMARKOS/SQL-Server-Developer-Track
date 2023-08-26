-- RAISEERROR ('message', severity, state);

-- THROW [ { error_number | @local_variable },
--        { message | @local_variable },
--        { state | @local_variable } ]
--[ ; ]

-- #####################################################
--RAISEERROR('No staff member with such id.', 16, 1)
--THROW 52000,'No staff member with id 15', 1;
-- #####################################################
SET ansi_warnings OFF

-- RAISERROR with message string
IF NOT EXISTS (SELECT * FROM name_informations WHERE id = 15)
RAISERROR('NO Student with Such id',16,1);

IF NOT EXISTS (SELECT * FROM name_informations WHERE id = 15)
RAISERROR('NO %s with Such %d',16,1,'Student',15);


IF NOT EXISTS (SELECT * FROM name_informations WHERE id = 15)
RAISERROR('%d%%  Discount',16,1,50);

RAISERROR(60000,16,1)


SELECT * FROM sys.messages
where message_id >50000

-- RAISERROR - Example with TRY...CATCH level 9

BEGIN TRY
		IF NOT EXISTS (SELECT * FROM name_informations WHERE id = 15)
		RAISERROR('NO Student with Such id',9,1);
END TRY
BEGIN CATCH
     SELECT 'You are in the CATCH block' AS message_text
END CATCH

-- RAISERROR - Example with TRY...CATCH level 10

BEGIN TRY
		IF NOT EXISTS (SELECT * FROM name_informations WHERE id = 15)
		RAISERROR('NO Student with Such id',10,1);
END TRY
BEGIN CATCH
     SELECT 'You are in the CATCH block' AS message_text
END CATCH

-- RAISERROR - Example with TRY...CATCH level 16

BEGIN TRY
		IF NOT EXISTS (SELECT * FROM name_informations WHERE id = 15)
		RAISERROR('NO Student with Such id',16,1);
END TRY
BEGIN CATCH
     SELECT 'You are in the CATCH block' AS message_text
END CATCH

-- Throw Without Parameters:

BEGIN TRY
    SELECT 1 / 0; -- Division by zero error
END TRY
BEGIN CATCH
    THROW; -- Re-throw the caught exception
END CATCH;


-- Throw with Ambiguity:

BEGIN TRY
    SELECT 1 / 0; -- Division by zero error
END TRY
BEGIN CATCH
    PRINT 'Caught an exception';
    THROW; -- Error: Ambiguous throw, multiple catch blocks
END CATCH;

-- Throw with Parameters:
---- THROW error_number, message, state [ ; ]
BEGIN TRY
    IF NOT EXISTS (SELECT * FROM name_informations WHERE id = 15)
        THROW 50001, 'Value cannot exceed 100.', 1;
END TRY
BEGIN CATCH
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;

-- FORMATMESSAGE Function:
DECLARE @msg NVARCHAR(100);
SET @msg = FORMATMESSAGE('Value %d is not valid.', 42);
RAISERROR(@msg, 16, 1);


DECLARE @email NVARCHAR(100);
SET @email = 'invalidemail';
DECLARE @msg1 NVARCHAR(200);
SET @msg = FORMATMESSAGE('The email address %s is not valid.', @email);
THROW 50001, @msg, 1;
