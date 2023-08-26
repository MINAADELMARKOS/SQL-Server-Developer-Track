-- DATES FROM PARTS

-- DATEFROMPARTS(year,month,day)
-- TIMEFROMPARTS(hour, minute, second, fraction, precision)
-- DATETIMEFROMPARTS(year, month, day, hour, minute, second, fraction, precision)
-- SMALLDATETIMEFROMPARTS(year,month,day,hour,minute)

SELECT 
      DATETIMEFROMPARTS(1918,11,11,05,45,17,995) AS DT,
	  DATETIME2FROMPARTS(1918,11,11,05,45,17,0,0) AS DT20,
	  DATETIME2FROMPARTS(1918,11,11,05,45,17,995,3) AS DT23,
	  DATETIME2FROMPARTS(1918,11,11,05,45,17,9951234,7) AS DT27

-- WORKING WITH OFFSETS

SELECT 
      DATETIMEOFFSETFROMPARTS(2009,08,14,21,00,00,0,5,30,0) AS IST,
	  DATETIMEOFFSETFROMPARTS(2009,08,14,21,00,00,0,5,30,0) AT TIME ZONE 'UTC' AS UTC

-- GOTCHAS WHEN WORKING WITH PARTS
SELECT DATEFROMPARTS(1999,12,NULL) AS PART1
SELECT DATEFROMPARTS(10000,01,01) AS PART2_NOTVALID
SELECT DATETIME2FROMPARTS(1918, 11,11,05,45,17,995,0) AS PART3_NOTVALID

--#################################################################################--

-- CASTING STRING

SELECT CAST('09/14/99' AS DATE) AS USDate
SELECT CAST('1985-01-12' AS DATE) AS USDate

-- CONVRTING STRING
SELECT CONVERT(DATETIME2(3), 'April 4, 2019 11:52:29.998 PM') AS April4

-- PARSING STRING
SELECT PARSE('25 December 2014' AS DATE USING 'de-de') AS Weihnachten;

-- ################################
-----Function Conversions Per Second

---CONVERT() 251,997
---CAST() 240,347
---PARSE() 12,620
-- ################################


-- SETTING LANGUAGE

SET LANGUAGE 'ENGLISH'
DECLARE
       @FrenchDate NVARCHAR(30) = N'18 avril 2019',
	   @FrenchNumberDate NVARCHAR(30) = N'18/4/2019';

SELECT CAST(@FrenchDate AS DATETIME),
       CAST(@FrenchNumberDate AS DATETIME)

-- ###############################################################--

--Handling invalid dates

-- CAST()      TRY_CAST()
-- CONVERT()   TRY_CONVERT()
-- PARSE()     TRY_PARSE()

SELECT 
      PARSE('01/08/2019' AS DATE USING 'en-us') AS January8US,
	  PARSE('01/08/2019' AS DATE USING 'fr-fr') AS August1FR



SELECT 
      PARSE('01/13/2019' AS DATE USING 'en-us') AS January13US,
	  PARSE('01/13/2019' AS DATE USING 'fr-fr') AS March1FR


SELECT 
      TRY_PARSE('01/13/2019' AS DATE USING 'en-us') AS January13US,
	  TRY_PARSE('01/13/2019' AS DATE USING 'fr-fr') AS March1FR