-- EXERCISE

--QN 1.
--For Items with ID 1000 – 1999 in the Item table set the SubCategory  ID to  “Foil” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (itemID >= 1000) AND (itemID <= 1999)

-- Updating (as instructed in QN 1)
UPDATE dbo.Item
	SET SubCategoryID = 'Foil'
WHERE (itemID >= 1000) AND (itemID <= 1999)
GO


--QN 2.
--For Items with ID 2000 – 2350  in the Item table set the sub Category  ID to  “Soda” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (itemID >= 2000) AND (itemID <= 2350)

-- Updating (as instructed in QN 2)
UPDATE dbo.Item
	SET SubCategoryID = 'Soda'
WHERE (itemID >= 2000) AND (itemID <= 2350)
GO


--QN 3.
--For Items with ID 2351 – 2371 in the Item table set the sub Category  ID to  “Beer”

--Viewing
--SELECT * FROM dbo.Item
--WHERE (itemID >= 2351) AND (itemID <= 2371)

-- Updating (as instructed in QN 3)
UPDATE dbo.Item
	SET SubCategoryID = 'Beer'
WHERE (itemID >= 2351) AND (itemID <= 2371)
GO
--QN 4.
--For Items with ID 2372 – 2380 in the Item table set the sub Category  ID to  “Wine” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 2372) AND (ItemID <= 2380)

--Updating (as instructed in QN 4)
UPDATE dbo.Item
	SET SubCategoryID = 'Wine'
WHERE (ItemID >= 2372) AND (ItemID <= 2380)
GO


--QN 5.
--For Items with ID 2381 – 2385 in the Item table set the sub Category  ID to  “Milk” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 2381) AND (ItemID <= 2385)

--Updating (as instructed in QN 5)
UPDATE dbo.Item
	SET SubCategoryID = 'Milk'
WHERE (ItemID >= 2381) AND (ItemID <= 2385)
GO


--QN 6.
--For Items with ID 2386 – 2399 in the Item table set the sub Category  ID to  “Juice”

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 2386) AND (ItemID <= 2399)

--Updating (as instructed in QN 6)
UPDATE dbo.Item
	SET SubCategoryID = 'Juice'
WHERE (ItemID >= 2386) AND (ItemID <= 2399)
GO


--QN 7. 
--For Items with ID 3000 –   3450 in the Item table set the sub Category  ID to  “Bread” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 3000) AND (ItemID <= 3450)

--Updating (as instructed in QN 7)
UPDATE dbo.Item
	SET SubCategoryID = 'Bread'
WHERE (ItemID >= 3000) AND (ItemID <= 3450)
GO


--QN 8.
--For Items with ID 3451 – 3497 in the Item table set the sub Category  ID to  “Cereals” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 3451) AND (ItemID <= 3497)

--Updating (as instructed in QN 8)
UPDATE dbo.Item
	SET SubCategoryID = 'Cereals'
WHERE (ItemID >= 3451) AND (ItemID <= 3497)
GO


--QN 9.
--For Items with ID 4000 – 4519 in the Item table set the sub Category  ID to  “Beans” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 4000) AND (ItemID <= 4519)

--Updating (as instructed in QN 9)
UPDATE dbo.Item
	SET SubCategoryID = 'Beans'
WHERE (ItemID >= 4000) AND (ItemID <= 4519)
GO


--QN 10.
--For Items with ID 4520 – 4528 in the Item table set the sub Category  ID to  “Flour” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 4520) AND (ItemID <= 4528)

--Updating (as instructed in QN 10)
UPDATE dbo.Item
	SET SubCategoryID = 'Flour'
WHERE (ItemID >= 4520) AND (ItemID <= 4528)
GO


--QN 11.
--For Items with ID 4529 –   4530 in the Item table set the sub Category  ID to  “Salt” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 4529) AND (ItemID <= 4530)

--Updating (as instructed in QN 11)
UPDATE dbo.Item
	SET SubCategoryID = 'Salt'
WHERE (ItemID >= 4529) AND (ItemID <= 4530)
GO


--QN 12.
--For Items with ID 4531 – 4535 in the Item table set the sub Category  ID to  “Soup” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 4531) AND (ItemID <= 4535)

--Updating (as instructed in QN 12)
UPDATE dbo.Item
	SET SubCategoryID = 'Soup'
WHERE (ItemID >= 4531) AND (ItemID <= 4535)
GO


--QN 13.
--For Items with ID 5679 – 5680 in the Item table set the sub Category  ID to  “Sausage” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 5679) AND (ItemID <= 5680)

--Updating (as instructed in QN 13)
UPDATE dbo.Item
	SET SubCategoryID = 'Sausage'
WHERE (ItemID >= 5679) AND (ItemID <= 5680)
GO


--QN 14.
--For Items with ID 6000 –  6850 in the Item table set the sub Category  ID to  “Fruits” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 6000) AND (ItemID <= 6850)

--Updating (as instructed in QN 14)
UPDATE dbo.Item
	SET SubCategoryID = 'Fruits'
WHERE (ItemID >= 6000) AND (ItemID <= 6850)
GO


--QN 15.
--For Items with ID 6851 –   6999 in the Item table set the sub Category  ID to  “Vegetables” 

--Viewing
--SELECT * FROM dbo.Item
--WHERE (ItemID >= 6851) AND (ItemID <= 6999)

--Updating (as instructed in QN 15)
UPDATE dbo.Item
	SET SubCategoryID = 'Vegetables'
WHERE (ItemID >= 6851) AND (ItemID <= 6999)
GO


--QN 16.
--Set the UoM for all Items in the Produce Category to kg

UPDATE dbo.Item
	SET UoM = 'kg'
WHERE ItemID IN (
SELECT A.ItemID FROM Item A, ItemSubCategory B
WHERE A.SubCategoryID = B.SubCategoryID AND  B.CategoryID = 'Produce')


--QN 17.
--Rename  Item Description to fit the sub category you have chosen and set appropriate prices.

UPDATE A
SET A.ItemDesc = C.Categoryname
FROM Item A
INNER JOIN ItemSubCategory B
ON A.SubCategoryID = B.SubCategoryID
INNER JOIN ItemCategory C ON B.CategoryID = C.CategoryID


--QN 19.
--Generate random sale Transactions  from year 2021 to Current to populate the SaleTnx table by Executing the stored procedure dbo.spGenerateSalesTransactions

EXECUTE dbo.spGenerateSalesTransactions '2021-01-01'