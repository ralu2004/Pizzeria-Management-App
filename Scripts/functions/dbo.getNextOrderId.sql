USE [PizzaRestaurant]
GO

/****** Object:  UserDefinedFunction [dbo].[getNextOrderId]    Script Date: 10/10/2024 10:30:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[getNextOrderId]()
RETURNS VARCHAR(6)
AS
BEGIN
    DECLARE @next_id VARCHAR(6);
    DECLARE @max_id VARCHAR(6);
    
    SELECT @max_id = MAX(OrderID) FROM orders;
    
    IF @max_id IS NULL
        SET @next_id = 'ORD001';
    ELSE
        SET @next_id = 'ORD' + RIGHT('000' + CAST(CAST(RIGHT(@max_id, 3) AS INT) + 1 AS VARCHAR(3)), 3);
    
    RETURN @next_id;
END;
GO

