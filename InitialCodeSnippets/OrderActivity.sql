SELECT
o.OrderID, 
i.ItemPrice,
o.Quantity,
i.ItemCat,
i.itemName,
o.CreatedAt,
a.DeliveryAddress1,
a.DeliveryAddress2,
a.DeliveryCity,
a.Zipcode,
o.delivery
FROM orders AS o
LEFT JOIN item AS i ON o.ItemID = i.ItemID
LEFT JOIN address AS a ON o.AddressID = a.AddressID
