-- PROCEDURE TO POPULATE THE SALES TRANSACTION TABLE

CREATE PROCEDURE dbo.spGenerateSalesTransactions(
	@StartDate dateTime
)
AS
BEGIN

	-- Turn off rows affected msg when SQl Stement is executed
	SET NOCOUNT ON 

	DECLARE @ItemNo int, @StoreNo int
	DECLARE @Quantity int

	DECLARE @TotalItems int, @TotalStores int
	DECLARE @TotalQtty int

	DECLARE @ItemID int, @StoreID varchar(6)
	DECLARE @Qtty int

	DECLARE @CurDate datetime, @Today datetime

	DECLARE @WeekDay int
	DECLARE @TotalTrans int



	---Create temporary table for Items Random number Reference
	CREATE TABLE #Item(
		RefNo int IDENTITY(1,1) PRIMARY KEY,
		ItemID int
	)

	-- Get all available items
	INSERT INTO #Item(ItemID)
	SELECT ItemID 
	FROM Item

	---Create temporary table for Stores Random number Reference

	CREATE TABLE #Store(
		RefNo int IDENTITY(1,1) PRIMARY KEY,
		StoreID varchar(6)
	)
	-- Get All available Stores

	INSERT INTO #Store(StoreID)
	SELECT StoreID
	FROM Store



	-- Increase chances of Mlimani City bein selected by registeriing it Several times

	INSERT INTO #Store(StoreID)
	SELECT 'MC' AS StoreID

	INSERT INTO #Store(StoreID)
	SELECT 'MC' AS StoreID

	INSERT INTO #Store(StoreID)
	SELECT 'MC' AS StoreID	


	-- Create temporary table for Quantity.
	CREATE TABLE #Qtty(
		RefNo int identity(1,1),
		Quantity int
	)

	DECLARE @I int
	-- make sure value 1 appears 20 times in the table to increase its chances
	SET @I = 1
	WHILE @I < 21
		BEGIN
		
			INSERT INTO #Qtty
			VALUES(1)

			SET @I = @I + 1
		END

	SET @I = 2
	WHILE @I < 11
		BEGIN
		
			INSERT INTO #Qtty
			VALUES(@I)

			SET @I = @I + 1
		END

	SET @CurDate = @StartDate
	SET @Today = GETDATE()

	-- Get total records in tempoarary tables

	SET @Totalitems = (SELECT COUNT(RefNo) FROM #Item)
	SET @TotalStores = (SELECT COUNT(RefNo) FROM #Store)
	SET @TotalQtty = (SELECT COUNT(RefNo) FROM #Qtty)

	WHILE @CurDate < @Today
		BEGIN

			-- Get day of week, Sunday = 1, saturday = 7
			SET @WeekDay = DATEPART(weekday,@CurDate)

			IF @WeekDay IN(1,7)
				SET @TotalTrans = 3000 + FLOOR(800 * RAND())
			ELSE
				SET @TotalTrans = 1000 + FLOOR(500 * RAND())

			SET @I = 1
			WHILE @I <= @TotalTrans
				BEGIN

					-- Select Sale Item at random
						-- get random index no into items temporaty table
					/*
					SET @ItemNo = FLOOR(@TotalItems * RAND())
					
					IF @ItemNo = 0 
						SET @ItemNo = 1
					*/

					SET @ItemNo = CEILING(@TotalItems * RAND())
												
					SET @ItemID = (SELECT ItemID 
									FROM  #Item
									WHERE RefNo = @ItemNo)

					-- Select Store at random

					SET @StoreNo = CEILING(@TotalStores * RAND())
												
					SET @StoreID = (SELECT StoreID 
									FROM  #Store
									WHERE RefNo = @StoreNo)


					-- Select Quantity at random

					SET @Qtty = CEILING(@TotalQtty * RAND())
							
					SET @Quantity = (SELECT Quantity 
									FROM  #Qtty
									WHERE RefNo = @Qtty)

					-- Insert a new sales Record

					INSERT INTO SaleTnx(TransDate, StoreID, ItemID, 
						Quantity, UnitPrice,Amount, Profit)
					SELECT @CurDate AS TransDate, @StoreID AS StoreID, 
						@ItemID AS ItemID, @Quantity AS Quantity, 
						RetailUnitPrice AS UnitPrice, 
						(@Quantity * RetailUnitPrice) AS Amount,
						(RetailUnitPrice -SupplierUnitPrice) * 
						@Quantity AS Profit
					FROM  Item
					WHERE ItemID = @ItemID
				
					SET @I = @I + 1
				END
			
			-- Get Next Date
			SET @CurDate = DATEADD(day,1,@CurDate)



		END



END

GO