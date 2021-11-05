USE [aletest]
GO

/****** Object:  StoredProcedure [dbo].[sp_schedules_insert]    Script Date: 03/11/2021 14:14:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_schedules_insert] ( @Description varchar(max), @WeekSelect tinyint,@TimeInit smalldatetime,@TimeEnd smalldatetime,@CoachId int,@LocationId int)

AS
declare @currentDate datetime,
		@idCreated int;

set @currentDate = getdate();

 
BEGIN
   insert into Schedules (Description,	WeekSelect,	TimeInit,	TimeEnd,	DateCreate,	DateUpdate,	
   IsActivo,	CoachId,	LocationId)
   values (@Description,@WeekSelect,@TimeInit,@TimeEnd, @currentDate,  @currentDate, 1,
   @CoachId,@LocationId)

   set @idCreated = @@IDENTITY

   select * from Schedules where id = @idCreated 
END
GO