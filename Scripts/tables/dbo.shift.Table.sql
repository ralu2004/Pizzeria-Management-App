USE [PizzaRestaurant]
GO

/****** Object:  Table [dbo].[shift]    Script Date: 10/10/2024 10:21:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[shift](
	[ShiftID] [varchar](20) NOT NULL,
	[DayOfWeek] [varchar](10) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
 CONSTRAINT [PK_shift] PRIMARY KEY CLUSTERED 
(
	[ShiftID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GRANT ALTER ON [dbo].[shift] TO [StaffManagement] AS [dbo]
GO

GRANT DELETE ON [dbo].[shift] TO [StaffManagement] AS [dbo]
GO

GRANT INSERT ON [dbo].[shift] TO [StaffManagement] AS [dbo]
GO

GRANT SELECT ON [dbo].[shift] TO [StaffManagement] AS [dbo]
GO

GRANT UPDATE ON [dbo].[shift] TO [StaffManagement] AS [dbo]
GO

GRANT VIEW CHANGE TRACKING ON [dbo].[shift] TO [StaffManagement] AS [dbo]
GO


