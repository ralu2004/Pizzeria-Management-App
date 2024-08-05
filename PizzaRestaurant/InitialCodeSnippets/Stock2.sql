SELECT 
    s2.IngredientName,
    s2.OrderedWeight,
    ing.IngredientWeight * inv.Quantity AS TotalInvWeight,
    (ing.IngredientWeight * inv.Quantity) - s2.OrderedWeight AS RemainingWeight
FROM
    (SELECT IngredientID, IngredientName, SUM(OrderedWeight) AS OrderedWeight
     FROM Stock1
     GROUP BY IngredientName, IngredientID) AS s2
LEFT JOIN inventory AS inv ON inv.ItemID = s2.IngredientID
LEFT JOIN ingredient AS ing ON ing.IngredientID = s2.IngredientID;
