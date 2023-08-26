--Get Date Functions
SELECT getdate()
SELECT getutcdate()
SELECT SYSDATETIME()
SELECT SYSUTCDATETIME()

-- Breaking down a date

DECLARE @d DATETIME2(3) = '2019-03-01 08:17:19.332';

SELECT YEAR(@d) as year_num,
       MONTH(@d) as month_num,
	   Day(@d) as day_num

-- Parsing dates with date parts
DECLARE @m DATETIME2(3) = '2019-03-01 08:17:19.332';

SELECT DATEPART(YEAR,@m) AS Theyear
SELECT DATEPART(MONTH,@m) AS Themonth
SELECT DATEPART(DAY,@m) AS Theday


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


-- Rounding dates
DECLARE @SomeTime2 DATETIME2(7) = '2023-08-10 14:29:36';

SELECT DATEADD(DAY,DATEDIFF(DAY,0,@SomeTime2),0),
       DATEADD(HOUR,DATEDIFF(HOUR,0,@SomeTime2),0),
	   DATEADD(MINUTE,DATEDIFF(MINUTE,0,@SomeTime2),0)

-- Formatting functions 
--- CAST()
--- CONVERT()
--- FORMAT()

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




-- HOW TO GET START FISCAL YEAR
DECLARE @somedate3 DATETIME2(3) = '2023-09-16 11:13:19.033'

SELECT 
       DATEADD(MONTH,-6,             -- 2023-07-01 00:00:00.000 -- FISCAL YEAR
	   DATEADD(YEAR,                 -- 2024-01-01 00:00:00.000
	   DATEDIFF(YEAR,0,              -- 124 YEARS
       DATEADD(MONTH,6,@somedate3)   -- 2024-02-16 11:13:19.033
	   ),0
	   )
	   )

 --#############################################################################--
 -- this query calculates and presents the fiscal year-related information for each date in the dbo.Calendar table. 
 -- It uses a subquery with date manipulation functions to determine the fiscal year start date and then calculates the fiscal day and week of the year for each date. 
 --This type of query is useful for reporting and analysis when fiscal years don't align with calendar years.

SELECT fy.FYStart,
       FisycalDayOfYear = DATEDIFF(DAY,fy.FYStart,FullDateAlternateKey)+1,
	   FisycalWeekOfYear = DATEDIFF(week,fy.FYStart,FullDateAlternateKey)+1
from [AdventureWorksDW2014].[dbo].[DimDate] as d
CROSS APPLY
(
SELECT FYStart=
       DATEADD(MONTH,-6,             -- 2023-07-01 00:00:00.000 -- FISCAL YEAR
	   DATEADD(YEAR,                 -- 2024-01-01 00:00:00.000
	   DATEDIFF(YEAR,0,              -- 124 YEARS
       DATEADD(MONTH,6,d.FullDateAlternateKey)   -- 2024-02-16 11:13:19.033
	   ),0
	   )
	   )
) AS fy

-- this query calculates and presents fiscal year-related information, including the start date of the fiscal year, the day of the fiscal year, and the week of the fiscal year, for each date in the dbo.Calendar table. 
-- It involves complex date manipulation using nested functions and the DATEDIFF function to perform the necessary calculations. 
-- This type of query can be useful for various reporting and analysis purposes in scenarios where fiscal years are not aligned with calendar years.

SELECT 
       FYStart = 
	         DATEADD(MONTH,-6,
			    DATEADD(YEAR,
				   DATEDIFF(YEAR,0,
				       DATEADD(MONTH,6,FullDateAlternateKey)),0)),

       FiscalDayOfYear = 
	         DATEDIFF(DAY,
			     DATEADD(MONTH,-6,
				    DATEADD(YEAR,
					  DATEDIFF(YEAR,0,
					     DATEADD(MONTH,6,FullDateAlternateKey)),0)),FullDateAlternateKey)+1,

		FiscalWEEKOfYear = 
			DATEDIFF(DAY,
				DATEADD(WEEK,-6,
				DATEADD(YEAR,
					DATEDIFF(YEAR,0,
						DATEADD(MONTH,6,FullDateAlternateKey)),0)),FullDateAlternateKey)+1

FROM [AdventureWorksDW2014].[dbo].[DimDate]