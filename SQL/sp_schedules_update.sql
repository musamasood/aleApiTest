USE [aleTest]
GO

/****** Object:  StoredProcedure [dbo].[sp_schedules_update]    Script Date: 07/11/2021 21:01:08 ******/
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

	BEGIN TRY
	   update Schedules set Description=@Description,	
							WeekSelect=@WeekSelect,	
							TimeInit=@TimeInit,	
							TimeEnd=@TimeEnd,	
							DateUpdate=@currentDate,	
							CoachId=@CoachId,	
							LocationId=@LocationId
		where id = @id

		SELECT '1'
	END TRY

	BEGIN CATCH
		SELECT '-1'
	END CATCH

END
GO


