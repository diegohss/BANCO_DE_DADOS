create procedure sp_log_usuario
(
@usuario int,
@status varchar(15)
)
as
insert into bh_usuario
(
id_usuario,	
status ,
dt_log
)
values
(
@usuario,
@status,
getdate()
)