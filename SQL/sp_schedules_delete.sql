/****** Object:  StoredProcedure [dbo].[sp_schedules_delete]    Script Date: 03/11/2021 14:14:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_schedules_delete] (@id int)

AS
declare @currentDate datetime,
		@sal varchar(2)

set @currentDate = getdate();

 
BEGIN
   UPDATE Schedules SET IsActivo=0 where id = @id
   SELECT @sal = CAST(@@ROWCOUNT AS VARCHAR(2))
   select @sal 
END
GO