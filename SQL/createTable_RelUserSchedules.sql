USE [aleTest]
GO

/****** Object:  Table [dbo].[Schedules]    Script Date: 03/11/2021 22:17:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RelUserSchedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[DateCreate] [datetime] NOT NULL,
	[DateUpdate] [datetime] NOT NULL,
	[IsActivo] [bit] NOT NULL,

 CONSTRAINT [PK_dbo.RelUserSchedules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] 
GO

ALTER TABLE [dbo].[RelUserSchedules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RelUserSchedules_dbo.Schedules_ScheduleId] FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedules] ([Id])
GO

ALTER TABLE [dbo].[RelUserSchedules] CHECK CONSTRAINT [FK_dbo.RelUserSchedules_dbo.Schedules_ScheduleId]
GO

ALTER TABLE [dbo].[RelUserSchedules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RelUserSchedules_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO

ALTER TABLE [dbo].[RelUserSchedules] CHECK CONSTRAINT [FK_dbo.RelUserSchedules_dbo.Users_UserId]
GO


