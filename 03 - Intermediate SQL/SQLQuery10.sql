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

-- 
SELECT 
     [UnitPrice]
    ,[TotalProductCost]
    ,[SalesAmount]
    ,[TaxAmt]
    ,[OrderDate]
FROM [AdventureWorksDW2014].[dbo].[FactResellerSales]




