/****** Object:  StoredProcedure [dbo].[sp_user_delete]    Script Date: 03/11/2021 14:14:30 ******/
USE [aletest]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[sp_user_delete] (@username nvarchar(50))

AS
declare @currentDate datetime,
		@sal varchar(2)

set @currentDate = getdate();

 
BEGIN
   UPDATE Users SET IsActivo=0 where username = @username
   SELECT @sal = CAST(@@ROWCOUNT AS VARCHAR(2))
   select @sal 
END
GO