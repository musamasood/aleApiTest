USE [aleTest]
GO

/****** Object:  Table [dbo].[Schedules]    Script Date: 03/11/2021 22:17:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE TABLE [dbo].[Schedules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[WeekSelect] [tinyint] NOT NULL,
	[TimeInit] [datetime] NOT NULL,
	[TimeEnd] [datetime] NOT NULL,
	[DateCreate] [datetime] NOT NULL,
	[DateUpdate] [datetime] NOT NULL,
	[IsActivo] [bit] NOT NULL,
	[CoachId] [int] NULL,
	[LocationId] [int] NULL,
 CONSTRAINT [PK_dbo.Schedules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Schedules_dbo.Coaches_CoachId] FOREIGN KEY([CoachId])
REFERENCES [dbo].[Coaches] ([Id])
GO

ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_dbo.Schedules_dbo.Coaches_CoachId]
GO

ALTER TABLE [dbo].[Schedules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Schedules_dbo.Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
GO

ALTER TABLE [dbo].[Schedules] CHECK CONSTRAINT [FK_dbo.Schedules_dbo.Locations_LocationId]
GO


