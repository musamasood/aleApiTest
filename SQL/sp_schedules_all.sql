USE [aleTest]
GO

/****** Object:  StoredProcedure [dbo].[sp_schedules_all]    Script Date: 07/11/2021 19:32:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_schedules_all] (  @id int=0, @PageSize INT = 10, @PageNumber INT = 1, @where VARCHAR(1000) = '', @orderby VARCHAR(100) = '1')

AS
 
DECLARE @sps NVARCHAR(MAX) = ''
         

BEGIN
if @id <> 0
	SET @sps = 'SELECT id, Description,	WeekSelect,	TimeInit,	TimeEnd,	DateCreate,	DateUpdate,	
	IsActivo,	CoachId,	LocationId
	FROM schedules where id='+CAST(@id AS varchar(10))
else
	SET @sps = 'SELECT id, Description,	WeekSelect,	TimeInit,	TimeEnd,	DateCreate,	DateUpdate,	
	IsActivo,	CoachId,	LocationId
	FROM schedules'

SET @sps = CONCAT(@sps, ' order by ', @orderby, ' offset ', @PageSize * (@PageNumber - 1), ' ROWS FETCH NEXT ', @PageSize, ' ROWS ONLY')
EXECUTE sp_executesql @sps
END
GO


