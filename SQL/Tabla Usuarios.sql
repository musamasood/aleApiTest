USE [aleApiTest]
GO

/****** Object:  Table [dbo].[users]    Script Date: 10/28/2021 6:40:11 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/*
CREATE TABLE [dbo].[users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[userDNI] [varchar](50) NOT NULL,
	[userEmail] [varchar](40) NOT NULL,
	[userPhoneNumber] [varchar](50) NULL,
	[userFirstname] [varchar](50) NOT NULL,
	[userLastname] [varchar](50) NOT NULL,
	[userUsername] [varchar](50) NOT NULL,
	[userPassword] [varchar](50) NOT NULL,
	[userAvatar] [varchar](max) NULL,
	[userDateCreate] [datetime] NOT NULL,
	[userDateUpdate] [datetime] NOT NULL,
	[idRole] [int] NOT NULL,
	[userOldPassword] [varchar](50) NULL,
	[Color] [nvarchar](8) NOT NULL,
	[NickName] [nvarchar](5) NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[users] ADD  CONSTRAINT [U_usersColorCol]  DEFAULT ('#1783CC') FOR [Color]
GO

ALTER TABLE [dbo].[users] ADD  CONSTRAINT [U_NickCol]  DEFAULT ('') FOR [NickName]
GO
*/


