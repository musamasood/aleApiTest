USE [aletest]
GO

/****** Object:  StoredProcedure [dbo].[sp_schedules_update]    Script Date: 03/11/2021 14:14:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_schedules_update] (@id int, @Description varchar(max), @WeekSelect tinyint,@TimeInit smalldatetime,
											@TimeEnd smalldatetime,@CoachId int,@LocationId int)

AS
declare @currentDate datetime

set @currentDate = getdate();

 
BEGIN
   update Schedules set Description=@Description,	
						WeekSelect=@WeekSelect,	
						TimeInit=@TimeInit,	
						TimeEnd=@TimeEnd,	
						DateUpdate=@currentDate,	
						CoachId=@CoachId,	
						LocationId=@LocationId
	where id = @id

    select * from Schedules where id = @id
END
GO