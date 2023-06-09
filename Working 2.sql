--QN 1.
/*
List a summary of items sold at Mlimani City during the October to December 2021 period. For each item list 
Item ID, Item name, total Quantity, unit price, total amount, and total profit.
*/

SELECT A.ItemID, B.ItemDesc, SUM(A.Quantity) AS TotalQuantity, A.UnitPrice, SUM(A.Amount) AS TotalAmount
    ,SUM(A.Profit) AS TotalProfit
FROM dbo.SaleTnx A
LEFT OUTER JOIN dbo.Item B ON A.ItemID = B.ItemID
WHERE A.StoreID = 'MC' AND A.TransDate BETWEEN '2021-10-01' AND '2021-12-31'
GROUP BY A.ItemID, B.ItemDesc, UnitPrice

--QN 2.
/*
List the total revenue and profit for each store during year 2018. For each Store show the Store ID, Store Name,
Total Revenue, Total profit. Arrange the list in Total profit descending Order.
*/



--QN 3.
/*
List the most profitable item during year 2016. Show the Item ID, item Name, Total quantity, and Total profit.
*/

--QN 4.
/*
List the total profit for each store on year basis since year 2010. The column headers are Store ID, Store name,
2010, 2011, 2012, 2013, 2014, 2015, 2016, and 2017, Total Profit . Required to show total profit for each year
under respective year column header Arrange list to Store ID ascending order.
*/

--QN 5.
/*
List total revenue for each Item on store basis for year 2014 � 2018 period. The column headers are Item ID, Item
name, Store ID1, store ID2, �,Store ID n, and Total Revenue. Required to show total item revenue for each store
under respective store ID column header.
*/

--QN 6.
/*
List Total Sales made by each store per day of week during year 2018, The Column headers are Store ID, Store name,
Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, and Total sales. Arrange list per total sales
descending order.
*/




















------QUESTION 2
--SELECT A.StoreID, B.StoreName,SUM(A.Amount) TotalRevenue,SUM(A.Profit) TotalProfit 
--FROM [dbo].[SaleTnx] A
--LEFT OUTER JOIN [dbo].[Store] B
--ON A.StoreID = B.StoreID
--WHERE A.TransDate BETWEEN '2018-01-01' AND '2018-12-31'
--GROUP BY A.StoreID,  B.StoreName
--ORDER BY SUM(A.Profit) DESC

------QUESTION 3
--SELECT TOP 1 A.ItemID, B.ItemDesc, SUM(A.Quantity) TotalQuantity , SUM(A.Profit) TotalProfit 
--FROM [dbo].[SaleTnx] A
--LEFT OUTER JOIN [dbo].[Item] B
--ON A.ItemID = B.ItemID
--WHERE  A.TransDate BETWEEN '2016-01-01' AND '2016-12-31' 
--GROUP BY A.ItemID, B.ItemDesc
--ORDER BY SUM(A.Profit) DESC

------QUESTION 4
--SELECT D.StoreID, D.StoreName,
--	SUM(CASE WHEN TransactionYear = 2010 THEN Sumproft END) AS [2010],
--	SUM(CASE WHEN TransactionYear = 2011 THEN Sumproft END) AS [2011],
--	SUM(CASE WHEN TransactionYear = 2012 THEN Sumproft END) AS [2012],
--	SUM(CASE WHEN TransactionYear = 2013 THEN Sumproft END) AS [2013],
--	SUM(CASE WHEN TransactionYear = 2014 THEN Sumproft END) AS [2014],
--	SUM(CASE WHEN TransactionYear = 2015 THEN Sumproft END) AS [2015],
--	SUM(CASE WHEN TransactionYear = 2016 THEN Sumproft END) AS [2016],
--	SUM(CASE WHEN TransactionYear = 2017 THEN Sumproft END) AS [2017], 
--	SUM(Sumproft) TotalRevenue
--FROM
--	(   SELECT  A.StoreID, B.StoreName,  Year(A.TransDate) TransactionYear, SUM(A.Profit) Sumproft 
--		FROM [SaleTnx] A
--		LEFT OUTER JOIN [dbo].[Store] B
--		ON A.StoreID = B.StoreID
--		WHERE A.TransDate between '2010-01-01' and '2017-12-31'
--		GROUP BY A.TransDate , A.StoreID, B.StoreName
--	) AS D
--GROUP BY D.StoreID, D.StoreName
--ORDER BY D.StoreID 


------ QUESTION 5
--SELECT D.ItemID, D.ItemDesc,
--	SUM(CASE WHEN StoreID_ = 'KC' THEN TotalRevenue END) AS [KC],
--	SUM(CASE WHEN StoreID_ = 'MC' THEN TotalRevenue END) AS [MC],
--	SUM(CASE WHEN StoreID_ = 'MF' THEN TotalRevenue END) AS [MF],
--	SUM(CASE WHEN StoreID_ = 'OB' THEN TotalRevenue END) AS [OB],
--	SUM(CASE WHEN StoreID_ = 'QC' THEN TotalRevenue END) AS [QC],
--	SUM(CASE WHEN StoreID_ = 'SP' THEN TotalRevenue END) AS [SP], SUM(TotalRevenue) TotalRevenue
--FROM
--	(   SELECT  A.ItemID, B.ItemDesc, A.StoreID StoreID_ ,SUM(Amount) TotalRevenue 
--		FROM [dbo].[SaleTnx] A
--		LEFT OUTER JOIN [dbo].[Item] B
--		ON A.ItemID = B.ItemID
--		WHERE TransDate between '2014-01-01' and '2018-12-31'
--		GROUP BY A.ItemID, B.ItemDesc, A.StoreID
--	) AS D
--GROUP BY D.ItemID, D.ItemDesc


------QUESTION 6
--SELECT D.StoreID, D.StoreName,
--	SUM(CASE WHEN day_of_Week = 'Monday' THEN TotalSales END) AS [Monday],
--	SUM(CASE WHEN day_of_Week = 'Tuesday' THEN TotalSales END) AS [Tuesday],
--	SUM(CASE WHEN day_of_Week = 'Wednesday' THEN TotalSales END) AS [Wednesday],
--	SUM(CASE WHEN day_of_Week = 'Thursday' THEN TotalSales END) AS [Thursday],
--	SUM(CASE WHEN day_of_Week = 'Friday' THEN TotalSales END) AS [Friday],
--	SUM(CASE WHEN day_of_Week = 'Saturday' THEN TotalSales END) AS [Saturday], 
--	SUM(CASE WHEN day_of_Week = 'Sunday' THEN TotalSales END) AS [Sunday], SUM(TotalSales) TotalSales
--FROM
--	(   SELECT  A.StoreID, B.StoreName,  DATENAME(DW,A.TransDate) day_of_Week, SUM(A.Amount) TotalSales
--		FROM SaleTnx A
--		LEFT OUTER JOIN Store B
--		ON A.StoreID = B.StoreID
--		WHERE year(A.TransDate) = 2018
--		GROUP BY DATENAME(DW,A.TransDate) , A.StoreID, B.StoreName
--	) AS D
--GROUP BY  D.StoreID, D.StoreName

--UNION all

--SELECT 'Total', 'All Store',
--	SUM(CASE WHEN day_of_Week = 'Monday' THEN TotalSales END) AS [Monday],
--	SUM(CASE WHEN day_of_Week = 'Tuesday' THEN TotalSales END) AS [Tuesday],
--	SUM(CASE WHEN day_of_Week = 'Wednesday' THEN TotalSales END) AS [Wednesday],
--	SUM(CASE WHEN day_of_Week = 'Thursday' THEN TotalSales END) AS [Thursday],
--	SUM(CASE WHEN day_of_Week = 'Friday' THEN TotalSales END) AS [Friday],
--	SUM(CASE WHEN day_of_Week = 'Saturday' THEN TotalSales END) AS [Saturday], 
--	SUM(CASE WHEN day_of_Week = 'Sunday' THEN TotalSales END) AS [Sunday], SUM(TotalSales) TotalSales
--FROM
--	(   SELECT  A.StoreID, B.StoreName,  DATENAME(DW,A.TransDate) day_of_Week, SUM(A.Amount) TotalSales
--		FROM SaleTnx A
--		LEFT OUTER JOIN Store B
--		ON A.StoreID = B.StoreID
--		WHERE year(A.TransDate) = 2018
--		GROUP BY DATENAME(DW,A.TransDate) , A.StoreID, B.StoreName
--	) 
--AS D

----SELECT D.StoreID, D.StoreName,
----	SUM(CASE WHEN day_of_Week = 'Monday' THEN TotalSales END) AS [Monday],
----	SUM(CASE WHEN day_of_Week = 'Tuesday' THEN TotalSales END) AS [Tuesday],
----	SUM(CASE WHEN day_of_Week = 'Wednesday' THEN TotalSales END) AS [Wednesday],
----	SUM(CASE WHEN day_of_Week = 'Thursday' THEN TotalSales END) AS [Thursday],
----	SUM(CASE WHEN day_of_Week = 'Friday' THEN TotalSales END) AS [Friday],
----	SUM(CASE WHEN day_of_Week = 'Saturday' THEN TotalSales END) AS [Saturday], 
----	SUM(CASE WHEN day_of_Week = 'Sunday' THEN TotalSales END) AS [Sunday], SUM(TotalSales) TotalSales
----FROM
----	(   SELECT  A.StoreID, B.StoreName,  DATENAME(DW,A.TransDate) day_of_Week, SUM(A.Amount) TotalSales
----		FROM [SaleTnx] A
----		LEFT OUTER JOIN [dbo].[Store] B
----		ON A.StoreID = B.StoreID
----		WHERE year(A.TransDate) = 2018
----		GROUP BY DATENAME(DW,A.TransDate) , A.StoreID, B.StoreName
----	) AS D
----GROUP BY  D.StoreID, D.StoreName
----ORDER BY SUM(TotalSales) DESC