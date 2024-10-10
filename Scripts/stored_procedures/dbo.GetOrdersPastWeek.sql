USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[GetOrdersPastWeek]    Script Date: 10/10/2024 10:28:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetOrdersPastWeek]
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Report of all orders in the past week
        SELECT 
            *
        FROM 
            OrderActivity
        WHERE 
            CreatedAt >= DATEADD(WEEK, -1, GETDATE())
            AND CreatedAt < GETDATE()
        ORDER BY 
            CreatedAt DESC;
    END TRY

    BEGIN CATCH
        PRINT 'Error occurred while retrieving orders from the past week.';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
    END CATCH
END
GO

