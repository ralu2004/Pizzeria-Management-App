USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 10/10/2024 10:26:16 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteCustomer]
(
	@FirstName varchar(50) = NULL,
	@LastName varchar(50) = NULL
)
AS
	SET NOCOUNT ON;

	IF @FirstName IS NULL
	BEGIN
		PRINT 'ERROR: First Name must be specified!';
		RETURN
	END
	IF @FirstName IS NULL
	BEGIN
		PRINT 'ERROR: Last Name must be specified!';
		RETURN
	END

	DELETE FROM customers
	WHERE FirstName = @FirstName AND LastName = @LastName;

RETURN
GO

GRANT EXECUTE ON [dbo].[DeleteCustomer] TO [CustomerSupport] AS [dbo]
GO

