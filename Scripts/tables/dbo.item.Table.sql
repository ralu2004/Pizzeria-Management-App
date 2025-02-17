USE [PizzaRestaurant]
GO

/****** Object:  Table [dbo].[item]    Script Date: 10/10/2024 10:19:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[item](
	[ItemID] [varchar](10) NOT NULL,
	[SKU] [varchar](20) NOT NULL,
	[ItemName] [varchar](100) NOT NULL,
	[ItemCat] [varchar](100) NOT NULL,
	[ItemSize] [varchar](10) NOT NULL,
	[ItemPrice] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_item] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GRANT ALTER ON [dbo].[item] TO [Inventory] AS [dbo]
GO

GRANT DELETE ON [dbo].[item] TO [Inventory] AS [dbo]
GO

GRANT INSERT ON [dbo].[item] TO [Inventory] AS [dbo]
GO

GRANT SELECT ON [dbo].[item] TO [Inventory] AS [dbo]
GO

GRANT UPDATE ON [dbo].[item] TO [Inventory] AS [dbo]
GO


