USE [PizzaRestaurant]
GO

/****** Object:  Table [dbo].[rota]    Script Date: 10/10/2024 10:20:41 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[rota](
	[ID] [int] NOT NULL,
	[RotaID] [varchar](20) NOT NULL,
	[ShiftID] [varchar](20) NOT NULL,
	[StaffID] [varchar](20) NOT NULL,
	[DayOfWeek] [varchar](10) NULL,
 CONSTRAINT [PK_rota] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

GRANT ALTER ON [dbo].[rota] TO [StaffManagement] AS [dbo]
GO

GRANT DELETE ON [dbo].[rota] TO [StaffManagement] AS [dbo]
GO

GRANT INSERT ON [dbo].[rota] TO [StaffManagement] AS [dbo]
GO

GRANT SELECT ON [dbo].[rota] TO [StaffManagement] AS [dbo]
GO

GRANT UPDATE ON [dbo].[rota] TO [StaffManagement] AS [dbo]
GO

ALTER TABLE [dbo].[rota]  WITH NOCHECK ADD  CONSTRAINT [FK_rota_ShiftID] FOREIGN KEY([ShiftID])
REFERENCES [dbo].[shift] ([ShiftID])
GO

ALTER TABLE [dbo].[rota] CHECK CONSTRAINT [FK_rota_ShiftID]
GO

ALTER TABLE [dbo].[rota]  WITH NOCHECK ADD  CONSTRAINT [FK_rota_StaffID] FOREIGN KEY([StaffID])
REFERENCES [dbo].[staff] ([StaffID])
GO

ALTER TABLE [dbo].[rota] CHECK CONSTRAINT [FK_rota_StaffID]
GO


