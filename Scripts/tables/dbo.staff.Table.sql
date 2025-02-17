USE [PizzaRestaurant]
GO

/****** Object:  Table [dbo].[staff]    Script Date: 10/10/2024 10:21:15 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[staff](
	[StaffID] [varchar](20) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Position] [varchar](100) NOT NULL,
	[HourlyRate] [decimal](5, 2) NOT NULL,
	[HireDate] [date] NULL,
	[e_mail] [varchar](100) NULL,
 CONSTRAINT [PK_staff] PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GRANT INSERT ON [dbo].[staff] TO [Manager] AS [dbo]
GO

GRANT SELECT ON [dbo].[staff] TO [Manager] AS [dbo]
GO

GRANT UPDATE ON [dbo].[staff] TO [Manager] AS [dbo]
GO

GRANT ALTER ON [dbo].[staff] TO [StaffManagement] AS [dbo]
GO

GRANT DELETE ON [dbo].[staff] TO [StaffManagement] AS [dbo]
GO

GRANT INSERT ON [dbo].[staff] TO [StaffManagement] AS [dbo]
GO

GRANT SELECT ON [dbo].[staff] TO [StaffManagement] AS [dbo]
GO

GRANT UPDATE ON [dbo].[staff] TO [StaffManagement] AS [dbo]
GO

GRANT VIEW CHANGE TRACKING ON [dbo].[staff] TO [StaffManagement] AS [dbo]
GO


