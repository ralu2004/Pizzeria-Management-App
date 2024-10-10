USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[UpdateCustomerInfo]    Script Date: 10/10/2024 10:29:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateCustomerInfo]
(
    @ID int,
    @FirstName varchar(50) = NULL,
    @LastName varchar(50) = NULL
)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Update customer information
        UPDATE customers
        SET
            FirstName = COALESCE(@FirstName, FirstName), -- Only update if @FirstName is not NULL
            LastName = COALESCE(@LastName, LastName)    -- Only update if @LastName is not NULL
        WHERE CustomerID = @ID;

        PRINT 'Customer information updated successfully.';
    END TRY

    BEGIN CATCH
        PRINT 'Error occurred during update.';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
    END CATCH
END
GO

