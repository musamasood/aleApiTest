use aletest

truncate table RelUserSchedules
truncate table users
truncate table schedules

select * from roles
select * from users
select * from schedules
select * from coaches
select * from locations
select * from RelUserSchedules



set  dateformat 'dmy'

insert into roles (Name,	Description,	DateCreate,	DateUpdate,	IsActivo)
values ('empleado','nuevo emp','3-11-2021','3-11-2021',1),
('coach','nuevo coach','3-11-2021','3-11-2021',1),
('adm','nuevo adm','3-11-2021','3-11-2021',1)

insert into users (
Dni,	Email,	PhoneNumber,	Firstname,	Lastname,	Username,	Password,	
Avatar,	OldPassword,	Color,	NickName,	DateCreate,	DateUpdate,	IsActivo,	RoleId_Id)
values ( 1234567,'prueba1@gmail.com','567678765','nameprueba1','apellidoprueba1','prueba1','123',
'','','','pru1','3-11-2021','3-11-2021',1,2),
( 1234567,'prueba2@gmail.com','567678765','nameprueba2','apellidoprueba2','prueba2','123',
null,null,null,'pru2','3-11-2021','3-11-2021',1,2),
( 1234567,'prueba3@gmail.com','567678765','nameprueba3','apellidoprueba3','prueba3','123',
null,null,null,'pru3','3-11-2021','3-11-2021',1,2)

insert into coaches (FirstName,	LastName,	Dni,	Description,	DateCreate,	DateUpdate,	IsActivo)
values ( 'Coach1','apeCoach1','1234565567','','3-11-2021','3-11-2021',1)

insert into locations (	Name,	Description,	DateCreate,	DateUpdate,	IsActivo)
values ('lugar1','','3-11-2021','3-11-2021',1)

insert into schedules (Description,	WeekSelect,	TimeInit,	TimeEnd,	DateCreate,	DateUpdate,	
IsActivo,	CoachId_Id,	LocationId_Id)
values ( 'primera',1,'1-11-2021','2-11-2021','1-11-2021','2-11-2021',2,1,1),
( 'segunda',3,'3-11-2021','3-11-2021','3-11-2021','3-11-2021',1,1,1),
( 'tercera',4,'4-11-2021','5-11-2021','3-11-2021','3-11-2021',1,1,1),
( 'cuarta',5,'5-11-2021','3-11-2021','3-11-2021','3-11-2021',1,1,1)