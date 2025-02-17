USE [PizzaRestaurant]
GO

/****** Object:  Table [dbo].[address]    Script Date: 10/10/2024 10:18:06 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[address](
	[AddressID] [int] NOT NULL,
	[DeliveryAddress1] [varchar](200) NOT NULL,
	[DeliveryAddress2] [varchar](200) NULL,
	[DeliveryCity] [varchar](50) NOT NULL,
	[Zipcode] [varchar](20) NOT NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


