USE [aleTest]
GO

/****** Object:  StoredProcedure [dbo].[sp_user_changePass]    Script Date: 05/11/2021 1:18:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_user_changePass] ( @Username nvarchar(50),@pass nvarchar(max))

AS
declare @currentDate datetime,
		@idCreated int,
		@oldPass nvarchar(max),
		@sal varchar(2)

set @currentDate = getdate();

 
BEGIN
	  select  @oldPass = passwordHash from Users where username=@Username

	  UPDATE Users SET PasswordHash =  @pass, DateUpdate=@currentDate, PasswordHash_old =  @oldPass
	  WHERE Username = @Username
	  SELECT @sal = CAST(@@ROWCOUNT AS VARCHAR(2))
	  select @sal
   
END
GO


