USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[NewCustomer]    Script Date: 10/10/2024 10:28:32 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[NewCustomer]
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;  -- Prevent extra result sets from interfering with SELECT statements

    -- Declare a variable to store the new CustomerID
    DECLARE @NewCustomerID INT;

    -- Find the next CustomerID based on the existing maximum
    SELECT @NewCustomerID = ISNULL(MAX(CustomerID), 0) + 1 FROM dbo.Customers;

    -- Insert the new customer with the calculated CustomerID
    INSERT INTO dbo.Customers (CustomerID, FirstName, LastName)
    VALUES (@NewCustomerID, @FirstName, @LastName);
END;
GO

GRANT EXECUTE ON [dbo].[NewCustomer] TO [CustomerSupport] AS [dbo]
GO

