/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ProductKey]
      ,[SalesTerritoryKey]
      ,[OrderQuantity]
      ,[UnitPrice]
      ,[ExtendedAmount]
      ,[ProductStandardCost]
      ,[TotalProductCost]
      ,[SalesAmount]
      ,[TaxAmt]
      ,[Freight]
      ,[OrderDate]
  FROM [AdventureWorksDW2014].[dbo].[FactResellerSales]


  SELECT [ProductKey]
      ,[SalesTerritoryKey]
      ,[OrderQuantity]
      ,[UnitPrice]
      ,[ExtendedAmount]
      ,[ProductStandardCost]
      ,[TotalProductCost]
      ,[SalesAmount]
      ,[TaxAmt]
      ,[Freight]
      ,[OrderDate],
	  lead(SalesAmount) over(partition by SalesTerritoryKey order by OrderDate) as lead_fun,
	  lag(SalesAmount) over(partition by SalesTerritoryKey order by OrderDate) as lag_fun
  FROM [AdventureWorksDW2014].[dbo].[FactResellerSales]


-- Get Required Data
SELECT 
     [UnitPrice]
    ,[TotalProductCost]
    ,[SalesAmount]
    ,[TaxAmt]
    ,[OrderDate]
FROM [AdventureWorksDW2014].[dbo].[FactResellerSales]

-- Analyzing Daily Slaes Totals, Monthly Website Traffic, Or Hourly Call Volumes
SELECT  
	DATEPART(YEAR,OrderDate) AS YearNum,
	DATEPART(MONTH,OrderDate) AS MonthNum,
	SUM(SalesAmount) AS TotalSales
FROM [AdventureWorksDW2014].[dbo].[FactResellerSales]
GROUP BY DATEPART(YEAR,OrderDate), DATEPART(MONTH,OrderDate)
ORDER BY YearNum,MonthNum


-- DOWNSAMPLING DATA
--- Downsampling reduce the granularity of data by aggregation in into lager time intervals
----- Converting high-frequency data to hourly averages, summarizing stock prices from minutes to days
SELECT  
	 DATEADD(DAY,DATEDIFF(DAY,0,OrderDate),0) AS Date_,
	 AVG(SalesAmount) AS Avgsales
FROM [AdventureWorksDW2014].[dbo].[FactResellerSales]
GROUP BY DATEADD(DAY,DATEDIFF(DAY,0,OrderDate),0)

-- Calculating rolling averages, finding peaks in stock prices, or analyzing temperature trends.
SELECT OrderDate,
       SalesAmount,
       AVG(SalesAmount) OVER (ORDER BY OrderDate ROWS BETWEEN 7 PRECEDING AND CURRENT ROW) AS SevenDayAvg
FROM [AdventureWorksDW2014].[dbo].[FactResellerSales];


---- Building a Calendar Table

-- Step 1: Create a Calendar Table
CREATE TABLE Calendar (
    Date DATE PRIMARY KEY,
    Year INT,
    Quarter INT,
    Month INT,
    Week INT,
    Day INT,
    DayOfWeek INT,
    DayOfYear INT,
    IsWeekend BIT
);

-- Step 2: Populate the Calendar Table
DECLARE @StartDate DATE = '2000-01-01';
DECLARE @EndDate DATE = '2030-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO Calendar (Date, Year, Quarter, Month, Week, Day, DayOfWeek, DayOfYear, IsWeekend)
    VALUES (
        @StartDate,
        DATEPART(YEAR, @StartDate),
        DATEPART(QUARTER, @StartDate),
        DATEPART(MONTH, @StartDate),
        DATEPART(WEEK, @StartDate),
        DATEPART(DAY, @StartDate),
        DATEPART(WEEKDAY, @StartDate),
        DATEPART(DAYOFYEAR, @StartDate),
        CASE WHEN DATEPART(WEEKDAY, @StartDate) IN (1, 7) THEN 1 ELSE 0 END -- function to determine whether a given date's weekday falls on a weekend day (Sunday, represented as 1, or Saturday, represented as 7), and assigns a value of 1 if it's a weekend day, or 0 if it's not.
    );

    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;

SELECT * FROM Calendar




