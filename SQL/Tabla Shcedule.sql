USE [aleoApiTest]
GO

/****** Object:  Table [dbo].[schedule]    Script Date: 10/28/2021 6:42:17 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/*
CREATE TABLE [dbo].[schedule](
	[idSchedule] [int] IDENTITY(1,1) NOT NULL,
	[SchDescription] [nvarchar](100) NOT NULL,
	[SchWeekSelect] [nvarchar](100) NOT NULL,
	[SchTimeInit] [time](7) NOT NULL,
	[SchTimeEnd] [time](7) NOT NULL,
	[idUsersCoath] [int] NOT NULL,
	[idLocation] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[NickName] [nvarchar](50) NULL,
 CONSTRAINT [PK_schedule] PRIMARY KEY CLUSTERED 
(
	[idSchedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[schedule] ADD  CONSTRAINT [S_NickCol]  DEFAULT ('') FOR [NickName]
GO
*/