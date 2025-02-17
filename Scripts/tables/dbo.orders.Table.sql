USE [PizzaRestaurant]
GO

/****** Object:  Table [dbo].[orders]    Script Date: 10/10/2024 10:20:08 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[orders](
	[ID] [int] NOT NULL,
	[OrderID] [varchar](10) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ItemID] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Delivery] [bit] NOT NULL,
	[AddressID] [int] NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GRANT INSERT ON [dbo].[orders] TO [KitchenStaff] AS [dbo]
GO

GRANT SELECT ON [dbo].[orders] TO [KitchenStaff] AS [dbo]
GO

GRANT UPDATE ON [dbo].[orders] TO [KitchenStaff] AS [dbo]
GO

GRANT DELETE ON [dbo].[orders] TO [Manager] AS [dbo]
GO

GRANT INSERT ON [dbo].[orders] TO [Manager] AS [dbo]
GO

GRANT SELECT ON [dbo].[orders] TO [Manager] AS [dbo]
GO

GRANT UPDATE ON [dbo].[orders] TO [Manager] AS [dbo]
GO

ALTER TABLE [dbo].[orders]  WITH NOCHECK ADD  CONSTRAINT [FK_orders_AddressID] FOREIGN KEY([AddressID])
REFERENCES [dbo].[address] ([AddressID])
GO

ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_AddressID]
GO

ALTER TABLE [dbo].[orders]  WITH NOCHECK ADD  CONSTRAINT [FK_orders_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[customers] ([CustomerID])
GO

ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_CustomerID]
GO

ALTER TABLE [dbo].[orders]  WITH NOCHECK ADD  CONSTRAINT [FK_orders_ItemID] FOREIGN KEY([ItemID])
REFERENCES [dbo].[item] ([ItemID])
GO

ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_ItemID]
GO


