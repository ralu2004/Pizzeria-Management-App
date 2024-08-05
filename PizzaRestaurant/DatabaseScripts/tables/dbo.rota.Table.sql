USE [PizzaRestaurant]
GO
/****** Object:  Table [dbo].[rota]    Script Date: 04/08/2024 4:47:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rota](
	[ID] [int] NOT NULL,
	[RotaID] [varchar](20) NOT NULL,
	[Date] [datetime] NOT NULL,
	[ShiftID] [varchar](20) NOT NULL,
	[StaffID] [varchar](20) NOT NULL,
 CONSTRAINT [PK_rota] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
