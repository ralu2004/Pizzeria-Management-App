USE [PizzaRestaurant]
GO

/****** Object:  StoredProcedure [dbo].[FindPendingOrders]    Script Date: 10/10/2024 10:27:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FindPendingOrders]
AS

BEGIN TRY
	SELECT * FROM OrderActivity
	WHERE Delivery = 0
	ORDER BY CreatedAt;
END TRY

BEGIN CATCH
	PRINT 'Error occured: ' + ERROR_MESSAGE();
END CATCH
GO

