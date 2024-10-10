USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[GetCurrentShift]    Script Date: 10/10/2024 10:27:29 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCurrentShift]
AS
BEGIN
    BEGIN TRY
        WITH CurrentAndNextShifts AS (
            SELECT 
                r.ID,
                r.RotaID,
                r.DayOfWeek,
                r.ShiftID,
                r.StaffID,
                s.StartTime,
                s.EndTime,
                ROW_NUMBER() OVER (ORDER BY 
                    CASE 
                        WHEN r.DayOfWeek = DATENAME(WEEKDAY, GETDATE()) THEN 1 
                        WHEN r.DayOfWeek = DATENAME(WEEKDAY, DATEADD(DAY, 1, GETDATE())) THEN 2 
                        ELSE 3 
                    END) AS ShiftOrder
            FROM 
                rota r
            JOIN 
                shift s ON r.ShiftID = s.ShiftID
        )
        SELECT *
        FROM CurrentAndNextShifts
        WHERE ShiftOrder <= 2;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage nvarchar(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH;
END;
GO

