USE [aleTest]
GO

/****** Object:  StoredProcedure [dbo].[sp_user_insert]    Script Date: 04/11/2021 21:42:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_user_insert] ( @Dni nvarchar(50), @Email nvarchar(50), @PhoneNumber nvarchar(50), 
										@Firstname nvarchar(50), @Lastname nvarchar(50),
										@Username nvarchar(50),@Avatar nvarchar(max), 
										@Color nvarchar(50), @NickName nvarchar(5), 
										@roleId int,@PasswordHash nvarchar(max))

AS
declare @currentDate datetime,
		@idCreated int;

set @currentDate = getdate();

 
BEGIN
   insert into Users (Dni,	Email,	PhoneNumber, Firstname,	Lastname, Username,  
					  Avatar, Color,	NickName, DateCreate, DateUpdate,  IsActivo, RoleId,
					  PasswordHash)
   values (@Dni, @Email, @PhoneNumber, @Firstname, @Lastname, @Username, 
			@Avatar, @Color, @NickName, @currentDate, @currentDate,1, @roleId,
			@PasswordHash)

   set @idCreated = @@IDENTITY

   --select Id, Dni,	Email,	PhoneNumber, Firstname,	Lastname,
	  --    Username, Avatar, Color,	NickName, DateCreate, DateUpdate,	
	  --    IsActivo, RoleId 
   --from users where id = @idCreated 

      select * from users where id = @idCreated 
END
GO


