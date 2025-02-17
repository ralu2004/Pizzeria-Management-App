USE [PizzaRestaurant]
GO

/****** Object:  Table [dbo].[recipe]    Script Date: 10/10/2024 10:20:26 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[recipe](
	[ID] [int] NOT NULL,
	[RecipeID] [varchar](20) NOT NULL,
	[IngredientID] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_recipe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GRANT INSERT ON [dbo].[recipe] TO [KitchenStaff] AS [dbo]
GO

GRANT SELECT ON [dbo].[recipe] TO [KitchenStaff] AS [dbo]
GO

GRANT UPDATE ON [dbo].[recipe] TO [KitchenStaff] AS [dbo]
GO

ALTER TABLE [dbo].[recipe]  WITH NOCHECK ADD  CONSTRAINT [FK_recipe_IngredientID] FOREIGN KEY([IngredientID])
REFERENCES [dbo].[ingredient] ([IngredientID])
GO

ALTER TABLE [dbo].[recipe] NOCHECK CONSTRAINT [FK_recipe_IngredientID]
GO


