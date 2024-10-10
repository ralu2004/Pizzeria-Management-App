USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[FindCustomer]    Script Date: 10/10/2024 10:26:47 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FindCustomer]
(
	@FirstName varchar(50) = NULL,
	@LastName varchar(50) = NULL,
	@CustomerID INT OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;

	IF @LastName IS NULL
	BEGIN
		SET @CustomerID = -1;  -- Error code for missing LastName
		RETURN
	END

	IF @FirstName IS NULL
	BEGIN
		SET @CustomerID = -2;  -- Error code for missing FirstName
		RETURN
	END

	SELECT @CustomerID = CustomerID FROM customers
	WHERE LastName = @LastName AND FirstName = @FirstName;

	IF @CustomerID IS NULL
	BEGIN
		SET @CustomerID = -3;  -- Error code for customer not found
	END
END
GO

GRANT EXECUTE ON [dbo].[FindCustomer] TO [CustomerSupport] AS [dbo]
GO

