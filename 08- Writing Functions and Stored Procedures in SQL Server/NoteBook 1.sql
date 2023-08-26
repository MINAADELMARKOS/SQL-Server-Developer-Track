-- Parsing dates with date parts
DECLARE @m DATETIME2(3) = '2019-03-01 08:17:19.332';

SELECT DATEPART(YEAR,@m) AS Theyear
SELECT DATEPART(MONTH,@m) AS Themonth
SELECT DATEPART(DAY,@m) AS Theday

--DECLARE @m DATETIME2(3) = '2019-03-01 08:17:19.332';

SELECT DATENAME(YEAR,@m) AS Theyear
SELECT DATENAME(MONTH,@m) AS Themonth
SELECT DATENAME(DAY,@m) AS Theday

-- Adding and subtracting dates
DECLARE @SomeTime DATETIME2(7) = '1992-07-14 14:49:36.2294852'

SELECT 
      DATEADD(DAY , 1 , @SomeTime) AS NextDay,
	  DATEADD(DAY, -1 , @SomeTime) AS PriorDay

SELECT DATEADD(HOUR, -3, DATEADD(DAY,-4,@SomeTime)) AS Minus4Days3Hours

-- Comparing dates

DECLARE @StartTime DATETIME2(7) = '1998-05-10 14:29:36',
        @EndTime DATETIME2(7) = '2023-08-16 18:00:00';


SELECT DATEDIFF(SECOND,@StartTime,@EndTime) AS SecondsEl,
       DATEDIFF(MINUTE,@StartTime,@EndTime) AS MinuteEl,
	   DATEDIFF(HOUR,@StartTime,@EndTime) AS HourEl,
	   DATEDIFF(DAY,@StartTime,@EndTime) AS DayEl,
	   DATEDIFF(MONTH,@StartTime,@EndTime) AS MONTHEl,
	   DATEDIFF(YEAR,@StartTime,@EndTime) AS YEAREl

-- #$#$#$#$#$#$# -- 
---- CAST()
DECLARE @somedate DATETIME2(3) = '1991-06-04 08:00:09',
        @somestring NVARCHAR(30) = '1991-06-04 08:00:09',
		@oldDatetime Datetime = '1991-06-04 08:00:09';

SELECT CAST(@somedate AS NVARCHAR(30)) AS DateToString,
       CAST(@somestring AS DATETIME2(3)) AS StringToDate,
	   CAST(@oldDatetime AS NVARCHAR(30)) AS oldDateToString;
       
---- CONVERT()

DECLARE @somedate1 DATETIME2(3) = '1991-06-04 08:00:09'

SELECT DATENAME(WEEKDAY,CONVERT(DATE,@somedate1)) 
SELECT CONVERT(NVARCHAR(30),@somedate1,100),   -- Jun  4 1991  8:00AM
       CONVERT(NVARCHAR(30),@somedate1,101),   -- 06/04/1991
	   CONVERT(NVARCHAR(30),@somedate1,102),   -- 1991.06.04
	   CONVERT(NVARCHAR(30),@somedate1,103),   -- 04/06/1991
	   CONVERT(NVARCHAR(30),@somedate1,104),   -- 04.06.1991
	   CONVERT(NVARCHAR(30),@somedate1,105),   -- 04-06-1991
	   CONVERT(NVARCHAR(30),@somedate1,106),   -- 04 Jun 1991
	   CONVERT(NVARCHAR(30),@somedate1,107),   -- Jun 04, 1991
	   CONVERT(NVARCHAR(30),@somedate1,108),   -- 08:00:09
	   CONVERT(NVARCHAR(30),@somedate1,109),   -- Jun  4 1991  8:00:09.000AM
	   CONVERT(NVARCHAR(30),@somedate1,110)    -- 06-04-1991

---- FORMAT()
DECLARE @somedate2 DATETIME2(3) = '1793-02-21 11:13:19.033'

SELECT FORMAT(@somedate2,'yyyy-mm-dd'),  -- 1793-13-21
       FORMAT(@somedate2,'ddd-mmm_yy')   -- Thu-13_93


-- #################################################

DECLARE @StratTime AS TIME
SET @StratTime = '08:00 AM'

DECLARE @bBeginStudents AS VARCHAR(100)
SET
   @bBeginStudents = (
      SELECT top(1) st_fname
	  FROM students)

SELECT * FROM @bBeginStudents