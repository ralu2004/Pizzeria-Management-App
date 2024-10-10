USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[DeleteStaffByName]    Script Date: 10/10/2024 10:26:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteStaffByName]
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        DELETE FROM Staff
        WHERE FirstName = @FirstName AND LastName = @LastName;

        -- Check if any rows were affected
        IF @@ROWCOUNT = 0
        BEGIN
            RAISERROR('No staff member found with the specified name.', 16, 1);
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH;
END;
GO

