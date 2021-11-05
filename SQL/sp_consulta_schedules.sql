USE [aletest]
GO

/****** Object:  StoredProcedure [dbo].[sp_consulta_schedules]    Script Date: 03/11/2021 14:14:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_consulta_schedules]

AS
BEGIN
SELECT id, Description,	WeekSelect,	TimeInit,	TimeEnd,	DateCreate,	DateUpdate,	
IsActivo,	CoachId_Id,	LocationId_Id
FROM schedules
END
GO