USE [PizzaRestaurant]
GO
/****** Object:  Table [dbo].[item]    Script Date: 04/08/2024 4:47:06 PM ******/
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
