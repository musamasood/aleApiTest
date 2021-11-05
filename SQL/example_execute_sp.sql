
USE [aletest]
GO

exec sp_schedules_all 3

{"Description": "Sectimo",
"WeekSelect": "5",
"TimeInit": "2021-11-05",
"TimeEnd": "2021-11-05",
"LocationId": "1",
"CoachId": "1"
}
exec sp_schedules_insert "Octavo","8","2021-11-05 10:00:00","2021-11-05 12:00:00",1,1

exec sp_user_login 'plopez'
exec sp_user_delete 'plopez'