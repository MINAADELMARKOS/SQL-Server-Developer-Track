--Get Date Functions
SELECT getdate()
SELECT getutcdate()
SELECT SYSDATETIME()
SELECT SYSUTCDATETIME()

-- Breaking down a date

DECLARE @d DATETIME2(3) = '2019-03-01 08:17:19.332';
-- DATEPART can extract more parts of dates such as (year,month,day) WHEREAS DATENAME() can only extract (month name or week day)
DECLARE @m DATETIME2(3) = '2019-03-01 08:17:19.332';
        @EndTime DATETIME2(7) = '2023-08-16 18:00:00';

SELECT DATEDIFF(SECOND,@StartTime,@EndTime) AS SecondsEl,
       DATEDIFF(MINUTE,@StartTime,@EndTime) AS MinuteEl,
	   DATEDIFF(HOUR,@StartTime,@EndTime) AS HourEl,
	   DATEDIFF(DAY,@StartTime,@EndTime) AS DayEl,
	   DATEDIFF(MONTH,@StartTime,@EndTime) AS MONTHEl,
        @somestring NVARCHAR(30) = '1991-06-04 08:00:09',
		@oldDatetime Datetime = '1991-06-04 08:00:09';

	@Python3ReleaseDate DATETIME2(3) = '2008-12-03 19:45:00.033';
    
SELECT
	-- 20081203
	FORMAT(@Python3ReleaseDate, 'yyyyMMdd') AS F1,
	-- 2008-12-03
	FORMAT(@Python3ReleaseDate, 'yyyy-MM-dd') AS F2,
	-- Dec 03+2008 (the + is just a "+" character)
	FORMAT(@Python3ReleaseDate, 'MMM dd+yyyy') AS F3,
	-- 12 08 03 (month, two-digit year, day)
	FORMAT(@Python3ReleaseDate, 'MM yy dd') AS F4,
	-- 03 07:45 2008.00
    -- (day hour:minute year.second)
	FORMAT(@Python3ReleaseDate, 'dd hh:mm yyyy.ss') AS F5;