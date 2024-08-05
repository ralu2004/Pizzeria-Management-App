USE [PizzaRestaurant]
GO
/****** Object:  Table [dbo].[inventory]    Script Date: 04/08/2024 4:47:06 PM ******/
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
ALTER TABLE [dbo].[inventory]  WITH NOCHECK ADD  CONSTRAINT [FK_inventory_ItemID] FOREIGN KEY([ItemID])
REFERENCES [dbo].[item] ([ItemID])
GO
ALTER TABLE [dbo].[inventory] NOCHECK CONSTRAINT [FK_inventory_ItemID]
GO
