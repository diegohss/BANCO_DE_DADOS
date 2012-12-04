create table br_cli_drive
(
id bigint identity(1,1) not null primary key,
descricao varchar(50) null,
usuario_criacao int not null,
dt_criacao int not null
)