USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[GetRecipeIngredients]    Script Date: 10/10/2024 10:28:13 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRecipeIngredients]
    @RecipeID VARCHAR(20)
AS
BEGIN

    SET NOCOUNT ON;

    SELECT 
        i.IngredientName,
        r.Quantity
    FROM 
        recipe r
    JOIN 
        ingredient i ON r.IngredientID = i.IngredientID
    where 
        r.RecipeID = @RecipeID;
END;

GO

