use havik
go
create table br_proj_tp_bonus 
(
id tinyint identity(1,1) not null,
descricao varchar(50) not null,
usuario_criacao int not null,
dt_criacao datetime not null
)