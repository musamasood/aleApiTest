USE [aletest]
GO

/****** Object:  StoredProcedure [dbo].[sp_user_all]    Script Date: 03/11/2021 14:14:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RelUserShedule_all] (  @sheduleId int=0, @PageSize INT = 10, @PageNumber INT = 1, @where VARCHAR(1000) = '', @orderby VARCHAR(100) = '1')

AS
 
DECLARE @sps NVARCHAR(MAX) = ''
         

BEGIN
if @sheduleId <> 0 
	SET @sps = 'SELECT * FROM RelUserSchedules 
				where ScheduleId='+cast(@sheduleId as varchar(10))
else
	SET @sps = 'SELECT *   
	            FROM RelUserSchedules'

SET @sps = CONCAT(@sps, ' order by ', @orderby, ' offset ', @PageSize * (@PageNumber - 1), ' ROWS FETCH NEXT ', @PageSize, ' ROWS ONLY')
EXECUTE sp_executesql @sps
END
GO