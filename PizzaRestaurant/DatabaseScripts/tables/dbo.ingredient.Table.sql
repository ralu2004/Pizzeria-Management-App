USE [PizzaRestaurant]
GO
/****** Object:  Table [dbo].[ingredient]    Script Date: 04/08/2024 4:47:06 PM ******/
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
