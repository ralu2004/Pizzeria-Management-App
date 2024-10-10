USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[CustomerCount]    Script Date: 10/10/2024 10:26:03 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CustomerCount] 
(
	@count int = NULL OUTPUT
)
AS
	SET NOCOUNT ON;

	SELECT @count = COUNT(CustomerID) FROM customers;

RETURN
GO

GRANT EXECUTE ON [dbo].[CustomerCount] TO [CustomerSupport] AS [dbo]
GO

