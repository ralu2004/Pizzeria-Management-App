USE [PizzaRestaurant]
GO

/****** Object:  Table [dbo].[ingredient]    Script Date: 10/10/2024 10:18:48 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ingredient](
	[IngredientID] [varchar](10) NOT NULL,
	[IngredientName] [varchar](200) NOT NULL,
	[IngredientWeight] [int] NOT NULL,
	[IngredientMass] [varchar](20) NOT NULL,
	[IngredientPrice] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_ingredient] PRIMARY KEY CLUSTERED 
(
	[IngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GRANT SELECT ON [dbo].[ingredient] TO [KitchenStaff] AS [dbo]
GO


