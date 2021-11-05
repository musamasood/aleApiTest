USE [aleTest]
GO

/****** Object:  StoredProcedure [dbo].[sp_user_update]    Script Date: 04/11/2021 17:46:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_user_update] ( @Dni nvarchar(50), @Email nvarchar(50), @PhoneNumber nvarchar(50), 
										@Firstname nvarchar(50), @Lastname nvarchar(50),
										@Username nvarchar(50),@pass nvarchar(max),@Avatar nvarchar(max), 
										@Color nvarchar(50), @NickName nvarchar(5), 
										@roleId int, @IsActivo bit)

AS
declare @currentDate datetime

set @currentDate = getdate();

 
BEGIN
   
	UPDATE Users SET Dni=@Dni,	Email=@Email,	PhoneNumber=@PhoneNumber, Firstname=@Firstname,	
				Lastname=@Lastname, Avatar=@Avatar, Color=@Color,	NickName=@NickName, 
				DateUpdate=@currentDate, RoleId=@roleId, IsActivo = @IsActivo
	WHERE Username = @Username
   

   select *  from users WHERE Username = @Username 
END
GO


