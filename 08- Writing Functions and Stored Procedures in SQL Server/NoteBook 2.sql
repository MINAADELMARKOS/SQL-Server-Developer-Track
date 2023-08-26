CREATE FUNCTION dbo.GetTomorrow()
RETURNS DATE 
AS 
BEGIN
RETURN(SELECT DATEADD(DAY,1,GETDATE()))
END;


SELECT dbo.GetTomorrow()


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [ProductKey]
      ,[UnitPrice]
      ,[ExtendedAmount]
      ,[ProductStandardCost]
      ,[TotalProductCost]
      ,[SalesAmount]
      ,[TaxAmt]
      ,[Freight]
      ,[OrderDate]
      ,[DueDate]
  FROM [AdventureWorksDW2014].[dbo].[FactInternetSales]
-- CREATE FUNCTION (SCALAR WITHOUT PARAMETERS)
CREATE FUNCTION dbo.GetTotalOrders()
RETURNS INT
AS
BEGIN
     DECLARE @TotalOrders INT;
	 SELECT @TotalOrders = COUNT(*) FROM FactInternetSales;
	 RETURN @TotalOrders;
END;
-- CALL THE FUNCTION
SELECT dbo.GetTotalOrders() AS TOTAL_ORDERS

-- CREATE FUNCTION (SCALAR WITH PARAMETERS)
CREATE FUNCTION dbo.CalculateDiscount(
                 @price DECIMAL(10,2),
				 @discount DECIMAL(5,2)
				 )
RETURNS DECIMAL(10,2)
AS
BEGIN
     DECLARE @discountedPrice DECIMAL(10, 2);
	 SET @discountedPrice = @price - (@price * @discount / 100);
	 RETURN @discountedPrice;
END;

-- CALL THE FUNCTION
DECLARE @originalPrice DECIMAL(10, 2) = 500000.00;
DECLARE @discountPercentage DECIMAL(5, 2) = 50.00;
SELECT dbo.CalculateDiscount(@originalPrice, @discountPercentage) AS DiscountedPrice;


CREATE FUNCTION GetRideHrsOneDay(@DateParm Date)
RETURNS NUMERIC
AS
BEGIN
RETURN
      (SELECT SUM(DATEDIFF(SECOND,OrderDate,DueDate))/3600
       FROM FactInternetSales
	   WHERE CONVERT(DATE,OrderDate) = @DateParm
	   )
END

DECLARE @DATESETADD DATE = '2012-05-21'
SELECT GetRideHrsOneDay(@DATESETADD)

-- Inline Table-Valued Functions (ITVFs):

CREATE FUNCTION dbo.GetCustomersByCity(@city NVARCHAR(50))
RETURNS TABLE
AS 
RETURN
(
    SELECT CustomerID, FirstName, LastName
    FROM Customers
    WHERE City = @city
);

-- Multi-Statement Table-Valued Functions (MSTVFs):

CREATE FUNCTION dbo.GetOrdersByCustomer(@customerId INT)
RETURNS @Orders TABLE
(
    OrderID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2)
)
AS
BEGIN
    INSERT INTO @Orders (OrderID, OrderDate, TotalAmount)
    SELECT OrderID, OrderDate, TotalAmount
    FROM Orders
    WHERE CustomerID = @customerId;
    
    RETURN;
END;
