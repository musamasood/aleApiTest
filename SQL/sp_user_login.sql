USE [aleTest]
GO

/****** Object:  StoredProcedure [dbo].[sp_user_login]    Script Date: 09/11/2021 16:50:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_user_login] (@username nvarchar(50)='')

AS
declare @PasswordHash nvarchar(max)

 
BEGIN
	
	if @username <> ''
	   select @PasswordHash = PasswordHash
	   from  Users  where username = @username 

	   if @PasswordHash is null
		   select @PasswordHash = PasswordHash
			from  Users  where email = @username 

	select isnull(@PasswordHash,'')
END
GO


