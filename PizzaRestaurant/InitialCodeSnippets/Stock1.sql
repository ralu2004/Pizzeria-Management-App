SELECT 
s1.ItemName,
s1.IngredientName,
s1.IngredientID,
s1.IngredientWeight,
s1.IngredientPrice,
s1.OrderQuantity,
s1.RecipeQuantity,
s1.OrderQuantity * s1.RecipeQuantity AS OrderedWeight,
s1.IngredientPrice / s1.IngredientWeight AS UnitCost,
(s1.OrderQuantity * s1.RecipeQuantity) * (s1.IngredientPrice / s1.IngredientWeight) AS IngredientCost
FROM (SELECT 
o.ItemID,
i.SKU,
i.ItemName,
r.IngredientID,
ing.IngredientName,
r.Quantity AS RecipeQuantity,
SUM(o.Quantity) AS OrderQuantity,
ing.IngredientWeight,
ing.IngredientPrice
FROM orders AS o 
LEFT JOIN item AS i ON o.ItemID = i.ItemID
LEFT JOIN recipe AS r ON i.SKU = r.RecipeID
LEFT JOIN ingredient AS ing ON ing.IngredientID = r.IngredientID
GROUP BY o.ItemID, i.SKU, i.ItemName, r.IngredientID, r.Quantity, ing.IngredientName, ing.IngredientWeight, ing.IngredientPrice) AS s1