USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[AddNewStaff]    Script Date: 10/10/2024 10:25:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[AddNewStaff]
(
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Position VARCHAR(50),
    @HireDate DATE,
    @HourlyRate DECIMAL(10, 2),
    @Email VARCHAR(100) = NULL 
)
AS
BEGIN
    BEGIN TRY
        -- Start the transaction
        BEGIN TRANSACTION;

        -- Declare @ID with the correct datatype (assuming INT for this example)
        DECLARE @ID varchar(4);

        -- Assign a value to @ID using the getNextStaffID() function
        SET @ID = dbo.getNextStaffID();

        -- Insert the new staff record into the staff table
        INSERT INTO staff (StaffID, FirstName, LastName, Position, HireDate, HourlyRate, e_mail)
        VALUES (@ID, @FirstName, @LastName, @Position, @HireDate, @HourlyRate, @Email);

        -- Commit the transaction
        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH
        -- Rollback the transaction in case of an error
        IF @@TRANCOUNT > 0
        BEGIN
            ROLLBACK TRANSACTION;
        END

        -- Capture the error details
        DECLARE @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT;
        SELECT @ErrorMessage = ERROR_MESSAGE(),
               @ErrorSeverity = ERROR_SEVERITY(),
               @ErrorState = ERROR_STATE();

        -- Raise the error with the captured details
        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH;
END;
GO

