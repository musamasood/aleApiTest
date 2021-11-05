USE [aletest]
GO

/****** Object:  StoredProcedure [dbo].[sp_RelUserSchedules_insert]    Script Date: 03/11/2021 14:14:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RelUserSchedules_insert] ( @ScheduleId int,@UserId int)

AS
declare @currentDate datetime,
		@idCreated int,
		@sal varchar(2)
 
BEGIN
   insert into RelUserSchedules (ScheduleId,UserId,DateCreate,Dateupdate,IsActivo)
   values (@ScheduleId,@UserId,getdate(),getdate(),1)

   SELECT @sal = CAST(@@ROWCOUNT AS VARCHAR(2))
   select @sal
END
GO