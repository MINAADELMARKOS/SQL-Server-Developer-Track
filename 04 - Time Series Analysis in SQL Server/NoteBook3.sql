SELECT TOP (1000) [did]
      ,[dname]
      ,[CALENDER_YEAR]
  FROM [ITI2].[dbo].[tab12]


SELECT COUNT(*) AS ALL_ROWS,
       COUNT(CALENDER_YEAR),
	   COUNT(DISTINCT CALENDER_YEAR) AS YEARS,
	   COUNT(DISTINCT NULLIF(CALENDER_YEAR,1998)) AS Y2
FROM [ITI2].[dbo].[tab12]