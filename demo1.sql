create table Admin
(
Username varchar(20) primary key,
Password varchar(20),
role int,
)
go
insert into Admin values('admin','123',1)
insert into Admin values('manager','123',2)
