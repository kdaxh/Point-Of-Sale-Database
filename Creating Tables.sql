-- CREATING TABLES FOR THE DATABASE


CREATE TABLE dbo.ItemCategory(
	CategoryID varchar(15) NOT NULL,
	Categoryname varchar(50),
	CONSTRAINT PK_ItemCategory PRIMARY KEY(CategoryID)
)
GO

CREATE TABLE dbo.ItemSubCategory(
	SubCategoryID varchar(15) NOT NULL,
	SubCategoryname varchar(50),
	CategoryID varchar(15),
	CONSTRAINT PK_ItemSubCategory PRIMARY KEY(SubCategoryID),
	CONSTRAINT FK_ItemSubCategory_ItemCategory FOREIGN KEY(CategoryID)
		REFERENCES dbo.ItemCategory(CategoryID)
)
GO

CREATE TABLE dbo.WorldRegion(
	WldRegion varchar(20) NOT NULL,
	CONSTRAINT PK_WorldRegion PRIMARY KEY(WldRegion)
)
GO

CREATE TABLE dbo.Country(
	Country varchar(20) NOT NULL,
	WldRegion varchar(20),
	IsLocal bit Default(0),
	CONSTRAINT PK_Country PRIMARY KEY(Country),
	CONSTRAINT FK_Country_WorldRegion FOREIGN KEY(WldRegion)
		REFERENCES dbo.WorldRegion(WldRegion)
)
GO

CREATE TABLE dbo.UoM(
	UoM varchar(10) NOT NULL,
	CONSTRAINT PK_UoM PRIMARY KEY(UoM)
)
GO

CREATE TABLE dbo.Item(
	ItemID int NOT NULL,
	ItemDesc varchar(60),
	SubCategoryID varchar(15),
	OrgCountry varchar(20),
	UoM varchar(10),
	SupplierUnitPrice money,
	RetailUnitPrice money,
	IsAvailable bit DEFAULT(1),
	OrderLevel int,
	CONSTRAINT PK_Item PRIMARY KEY(ItemID),
	CONSTRAINT FK_Item_ItemSubCategory FOREIGN KEY(SubCategoryID)
		REFERENCES dbo.ItemSubCategory(SubCategoryID),
	CONSTRAINT FK_Item_Country FOREIGN KEY(OrgCountry)
		REFERENCES dbo.Country(Country),
	CONSTRAINT FK_Item_UoM FOREIGN KEY(UoM)
		REFERENCES dbo.UoM(UoM)
)
GO

CREATE TABLE dbo.Store(
	StoreID varchar(6),
	StoreName varchar(40),
	CONSTRAINT PK_Store PRIMARY KEY(StoreID)
)
GO


CREATE TABLE dbo.SaleTnx(
	TransID int NOT NULL IDENTITY(1,1),
	TransDate datetime NOt NULL,
	StoreID varchar(6) NOT NULL,
	ItemID int NOT NULl,
	Quantity Real,
	UnitPrice money,
	Amount money,
	Profit money,
	UserID varchar(40) DEFAULT(suser_sname()),
	RecordDate datetime DEFAULT(getdate()),
	Host varchar(50) DEFAULT(host_name()),
	CONSTRAINT PK_SaleTnx PRIMARY KEY(TransID),
	CONSTRAINT FK_SaleTnx_Item FOREIGN KEY(ItemID)
		REFERENCES dbo.Item(ItemID),
	CONSTRAINT FK_SaleTnx_Srore FOREIGN KEY(StoreID)
		REFERENCES dbo.Store(StoreID)
)
GO