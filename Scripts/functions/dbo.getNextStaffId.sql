USE [PizzaRestaurant]
GO

/****** Object:  UserDefinedFunction [dbo].[getNextStaffId]    Script Date: 10/10/2024 10:30:37 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[getNextStaffId]()
RETURNS VARCHAR(4)
AS
BEGIN
    DECLARE @next_id VARCHAR(4);
    DECLARE @max_id VARCHAR(4);
    
    SELECT @max_id = MAX(StaffID) FROM staff;
    
    IF @max_id IS NULL
        SET @next_id = 'S001';
    ELSE
        SET @next_id = 'S' + RIGHT('000' + CAST(CAST(RIGHT(@max_id, 3) AS INT) + 1 AS VARCHAR(3)), 3);
    
    RETURN @next_id;
END;
GO

