USE [PizzaRestaurant]
GO

/****** Object:  UserDefinedFunction [dbo].[getNextId]    Script Date: 10/10/2024 10:30:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [dbo].[getNextId]()
RETURNS INT
AS
BEGIN
    DECLARE @NextOrderID INT;

    -- Get the maximum OrderID and increment by 1
    SELECT @NextOrderID = ISNULL(MAX(ID), 0) + 1 FROM [dbo].[orders];

    RETURN @NextOrderID;
END
GO

