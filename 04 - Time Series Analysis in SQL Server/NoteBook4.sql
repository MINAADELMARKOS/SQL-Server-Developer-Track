/****** Script for SelectTopNRows command from SSMS  ******/
-- RANK()     ==> Ascending integer value starting from 1. Can have ties. Can skip numbers.
-- DENSE_RANK ==> Ascending integer value starting from 1. Can have ties. Will not skip numbers.
SELECT
       [EmployeeKey]
      ,[PromotionKey]
      ,[SalesTerritoryKey]
      ,[SalesAmount]
	  ,ROW_NUMBER() OVER(PARTITION BY SalesTerritoryKey order by SalesAmount) AS Row_num
	  ,rank() OVER(PARTITION BY SalesTerritoryKey order by SalesAmount) AS rank_num
	  ,DENSE_RANK() OVER(PARTITION BY SalesTerritoryKey order by SalesAmount) AS denserank_num
  FROM [AdventureWorksDW2014].[dbo].[FactResellerSales]
  WHERE SalesTerritoryKey IN (2,3)


-- RUNNING TOTALS
SELECT 
       EmployeeKey
      ,PromotionKey
      ,SalesTerritoryKey
      ,SalesAmount
	  ,SUM(SalesAmount) OVER(PARTITION BY SalesTerritoryKey
	                         ORDER BY EmployeeKey
							  RANGE BETWEEN UNBOUNDED PRECEDING
							  AND CURRENT ROW) AS Row_num
FROM FactResellerSales


SELECT 
       EmployeeKey
      ,PromotionKey
      ,SalesTerritoryKey
      ,SalesAmount
	  ,AVG(SalesAmount) OVER(PARTITION BY SalesTerritoryKey
	                          ORDER BY EmployeeKey ASC
							  ROWS BETWEEN 1 PRECEDING
							  AND CURRENT ROW) AS Row_num
FROM FactResellerSales

