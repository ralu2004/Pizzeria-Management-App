USE [PizzaRestaurant]
GO

/****** Object:  Table [dbo].[inventory]    Script Date: 10/10/2024 10:19:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[inventory](
	[InventoryID] [int] NOT NULL,
	[ItemID] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_inventory] PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GRANT ALTER ON [dbo].[inventory] TO [Inventory] AS [dbo]
GO

GRANT DELETE ON [dbo].[inventory] TO [Inventory] AS [dbo]
GO

GRANT INSERT ON [dbo].[inventory] TO [Inventory] AS [dbo]
GO

GRANT SELECT ON [dbo].[inventory] TO [Inventory] AS [dbo]
GO

GRANT UPDATE ON [dbo].[inventory] TO [Inventory] AS [dbo]
GO

ALTER TABLE [dbo].[inventory]  WITH NOCHECK ADD  CONSTRAINT [FK_inventory_ItemID] FOREIGN KEY([ItemID])
REFERENCES [dbo].[item] ([ItemID])
GO

ALTER TABLE [dbo].[inventory] NOCHECK CONSTRAINT [FK_inventory_ItemID]
GO


