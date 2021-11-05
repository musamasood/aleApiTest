USE [aleTest]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 04/11/2021 19:17:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--drop table RelUserSchedules
--drop table Users
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Dni] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNumber] [nvarchar](50) NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Avatar] [nvarchar](max) NULL,
	[Color] [nvarchar](50) NULL,
	[NickName] [nvarchar](5) NULL,
	[DateCreate] [datetime] NOT NULL,
	[DateUpdate] [datetime] NOT NULL,
	[IsActivo] [bit] NOT NULL,
	[RoleId] [int] NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PasswordHash_old] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO

ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_RoleId]
GO

ALTER TABLE [dbo].[users] ADD  CONSTRAINT [U_usersColorCol]  DEFAULT ('#1783CC') FOR [Color]
GO

ALTER TABLE [dbo].[users] ADD  CONSTRAINT [U_NickCol]  DEFAULT ('') FOR [NickName]
GO

