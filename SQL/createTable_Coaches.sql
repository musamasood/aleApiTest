USE [aleTest]
GO

/****** Object:  Table [dbo].[Coaches]    Script Date: 05/11/2021 16:17:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Coaches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Dni] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[DateCreate] [datetime] NOT NULL,
	[DateUpdate] [datetime] NOT NULL,
	[IsActivo] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Coaches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


