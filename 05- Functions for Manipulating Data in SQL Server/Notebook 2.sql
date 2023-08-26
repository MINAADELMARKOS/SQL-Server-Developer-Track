-- ==> Time zones in SQL Server
-- 1- Local time zone
-- 2- UTC time zone (Universal Time Coordinate)


-- Functions that return the date and time of the operating system
SELECT -- Higher-precision
          SYSDATETIME() AS SYSDATETIME_,
		  SYSUTCDATETIME() AS SYSUTCDATETIME_,
		  SYSDATETIMEOFFSET() AS SYSDATETIMEOFFSET_,
       -- Lower-precision
	      GETDATE() AS GETDATE_,
		  GETUTCDATE() AS GETUTCDATE_,
		  CURRENT_TIMESTAMP AS CURRENT_TIMESTAMP_

DECLARE @date datetime = '2019-03-24'

SELECT YEAR(@date) AS year,
       DATENAME(YEAR,@date) AS year_name,
	   MONTH(@date) AS month,
	   DATENAME(MONTH,@date) AS month_name,
	   DAY(@date) AS day,
	   DATENAME(DAY,@date) AS day_name,
	   DATENAME(WEEKDAY,@date) AS weekday


-- ISDATE(expression)
DECLARE @date1 NVARCHAR(20) = '2019-05-05'
DECLARE @date2 NVARCHAR(20) = '2019-01-XX'
DECLARE @date3 CHAR(20) = '2019-05-05 12:45:59.9999999'
DECLARE @date4 CHAR(20) = '2019-05-05 12:45:59'

SELECT
ISDATE(@date1) AS valid_date,
ISDATE(@date2) AS invalid_date,
ISDATE(@date3) AS valid_datetime2,
ISDATE(@date4) AS valid_datetime;

