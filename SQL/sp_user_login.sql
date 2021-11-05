/****** Object:  StoredProcedure [dbo].[sp_user_login]    Script Date: 03/11/2021 14:14:30 ******/
USE [aletest]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_user_login] (@username nvarchar(50)='',@email nvarchar(50)='')

AS
declare @PasswordHash nvarchar(max)

 
BEGIN
	
	if @username <> ''
	   select @PasswordHash = PasswordHash
	   from  Users  where username = @username 
	else
	   select @PasswordHash = PasswordHash
	   from  Users  where email = @email 

	select isnull(@PasswordHash,'')
END
GO