CREATE TABLE [customers] (
    [CustomerID] int NOT NULL,
    [FirstName] varchar(50) NOT NULL,
    [LastName] varchar(50) NOT NULL,
    CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED ([CustomerID] ASC)
);

CREATE TABLE [address] (
    [AddressID] int NOT NULL,
    [DeliveryAddress1] varchar(200) NOT NULL,
    [DeliveryAddress2] varchar(200) NULL,
    [DeliveryCity] varchar(50) NOT NULL,
    [Zipcode] varchar(20) NOT NULL,
    CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED ([AddressID] ASC)
);

CREATE TABLE [item] (
    [ItemID] varchar(10) NOT NULL,
    [SKU] varchar(20) NOT NULL,
    [ItemName] varchar(100) NOT NULL,
    [ItemCat] varchar(100) NOT NULL,
    [ItemSize] varchar(10) NOT NULL,
    [ItemPrice] decimal(10,2) NOT NULL,
    CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED ([ItemID] ASC)
);

CREATE TABLE [orders] (
    [ID] int NOT NULL,
    [OrderID] varchar(10) NOT NULL,
    [CreatedAt] datetime NOT NULL,
    [ItemID] varchar(10) NOT NULL,
    [Quantity] int NOT NULL,
    [CustomerID] int NOT NULL,
    [Delivery] bit NOT NULL,
    [AddressID] int NOT NULL,
    CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_orders_CustomerID] FOREIGN KEY([CustomerID]) REFERENCES [customers]([CustomerID]),
    CONSTRAINT [FK_orders_AddressID] FOREIGN KEY([AddressID]) REFERENCES [address]([AddressID]),
    CONSTRAINT [FK_orders_ItemID] FOREIGN KEY([ItemID]) REFERENCES [item]([ItemID])
);

CREATE TABLE [ingredient] (
    [IngredientID] varchar(10) NOT NULL,
    [IngredientName] varchar(200) NOT NULL,
    [IngredientWeight] int NOT NULL,
    [IngredientMass] varchar(20) NOT NULL,
    [IngredientPrice] decimal(5,2) NOT NULL,
    CONSTRAINT [PK_ingredient] PRIMARY KEY CLUSTERED ([IngredientID] ASC)
);

CREATE TABLE [recipe] (
    [ID] int NOT NULL,
    [RecipeID] varchar(20) NOT NULL,
    [IngredientID] varchar(10) NOT NULL,
    [Quantity] int NOT NULL,
    CONSTRAINT [PK_recipe] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_recipe_IngredientID] FOREIGN KEY([IngredientID]) REFERENCES [ingredient]([IngredientID])
);

CREATE TABLE [inventory] (
    [InventoryID] int NOT NULL,
    [ItemID] varchar(10) NOT NULL,
    [Quantity] int NOT NULL,
    CONSTRAINT [PK_inventory] PRIMARY KEY CLUSTERED ([InventoryID] ASC),
    CONSTRAINT [FK_inventory_ItemID] FOREIGN KEY([ItemID]) REFERENCES [item]([ItemID])
);

CREATE TABLE [staff] (
    [StaffID] varchar(20) NOT NULL,
    [FirstName] varchar(50) NOT NULL,
    [LastName] varchar(50) NOT NULL,
    [Position] varchar(100) NOT NULL,
    [HourlyRate] decimal(5,2) NOT NULL,
    CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED ([StaffID] ASC)
);

CREATE TABLE [shift] (
    [ShiftID] varchar(20) NOT NULL,
    [DayOfWeek] varchar(10) NOT NULL,
    [StartTime] time NOT NULL,
    [EndTime] time NOT NULL,
    CONSTRAINT [PK_shift] PRIMARY KEY CLUSTERED ([ShiftID] ASC)
);

CREATE TABLE [rota] (
    [ID] int NOT NULL,
    [RotaID] varchar(20) NOT NULL,
    [Date] datetime NOT NULL,
    [ShiftID] varchar(20) NOT NULL,
    [StaffID] varchar(20) NOT NULL,
    CONSTRAINT [PK_rota] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_rota_ShiftID] FOREIGN KEY([ShiftID]) REFERENCES [shift]([ShiftID]),
    CONSTRAINT [FK_rota_StaffID] FOREIGN KEY([StaffID]) REFERENCES [staff]([StaffID])
);
