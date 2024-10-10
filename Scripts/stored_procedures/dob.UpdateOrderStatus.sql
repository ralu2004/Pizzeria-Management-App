USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[UpdateOrderStatus]    Script Date: 10/10/2024 10:29:25 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[UpdateOrderStatus]
(
    @OrderID varchar(6),
    @NewStatus bit
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Update the order status
        UPDATE Orders
        SET Delivery = @NewStatus
        WHERE OrderID = @OrderID;
    END TRY

    BEGIN CATCH
        -- Print detailed error information
        PRINT 'Error occurred while updating order status.';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
    END CATCH
END
GO

