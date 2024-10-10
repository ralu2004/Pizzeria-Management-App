USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[PlaceOrder]    Script Date: 10/10/2024 10:28:55 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PlaceOrder]
(
    @Item VARCHAR(50),
    @Quantity INT,
	@CustomerID INT,
    @DeliveryAddress1 VARCHAR(200),
    @DeliveryAddress2 VARCHAR(200),
    @DeliveryCity VARCHAR(50),
    @Zipcode VARCHAR(20)
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        DECLARE @id INT;
        DECLARE @ItemID VARCHAR(10);
        DECLARE @NextOrderID VARCHAR(6);  -- Variable to hold the next order ID

        -- Get the next AddressID
        SELECT @id = ISNULL(MAX(AddressID), 0) + 1 FROM address;

        -- Retrieve ItemID based on the Item name
        SELECT @ItemID = ItemID FROM item WHERE ItemName = @Item;

        -- Check if the ItemID is found
        IF @ItemID IS NULL
        BEGIN
            PRINT 'Item not found: ' + @Item;
            ROLLBACK TRANSACTION;
            RETURN;
        END

        -- Get the next Order ID (assuming this function generates a unique OrderID)
        SET @NextOrderID = dbo.getNextOrderId();

        -- Insert the address into the address table
        INSERT INTO [dbo].[address]
           ([AddressID],
           [DeliveryAddress1],
           [DeliveryAddress2],
           [DeliveryCity],
           [Zipcode])
        VALUES
           (@id,
            @DeliveryAddress1,
            @DeliveryAddress2,
            @DeliveryCity,
            @Zipcode);

        -- Insert the order into the orders table
        INSERT INTO [dbo].[orders]
           ([ID]
           ,[OrderID]
           ,[CreatedAt]
           ,[ItemID]
           ,[Quantity]
           ,[CustomerID]
           ,[Delivery]
           ,[AddressID])
        VALUES
           (dbo.getNextId(),
		   @NextOrderID,
           GETDATE(),
           @ItemID,
           @Quantity,
           @CustomerID,
           0, -- Assuming '0' means not delivered
           @id);

        -- Commit the transaction if everything is successful
        COMMIT TRANSACTION;
    END TRY
    
    BEGIN CATCH
        -- Rollback transaction in case of error
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        -- Print error message
        PRINT 'Something went wrong!';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
    END CATCH
END
GO

