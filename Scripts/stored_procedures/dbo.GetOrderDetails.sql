USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[GetOrderDetails]    Script Date: 10/10/2024 10:27:46 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetOrderDetails]
(
    @OrderID int
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT o.OrderID, o.CustomerID, o.CreatedAt, o.Delivery,
               i.ItemID, o.Quantity, i.ItemPrice
        FROM Orders o
        JOIN Item i ON o.ItemID = i.ItemID
        WHERE o.OrderID = @OrderID;

    END TRY

    BEGIN CATCH
        PRINT 'Error occurred while retrieving order details.';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
    END CATCH
END
GO

GRANT EXECUTE ON [dbo].[GetOrderDetails] TO [DeliveryStaff] AS [dbo]
GO

