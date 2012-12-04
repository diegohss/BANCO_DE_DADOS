create table tr_proj_beneficios
(
id bigint identity(1,1) not null primary key,
descricao varchar(100),
usuario_criacao smallint not null,
dt_criacao datetime
);