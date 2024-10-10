USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[GetAllRecipes]    Script Date: 10/10/2024 10:27:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllRecipes]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT RecipeID AS RecipeName
    FROM recipe; 
END;
GO

