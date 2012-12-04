create table bc_proj_pergunta
(
id bigint identity(1,1) not null primary key,
id_projeto bigint not null foreign key references bc_projeto(id),
pergunta1 varchar(400) null,
usuario_criacao int not null foreign key references bc_usuario(id),
dt_criacao datetime not null
)

go

create table bc_proj_cli_resposta
(
id bigint identity(1,1) not null primary key,
id_projeto bigint not null foreign key references bc_projeto(id),
id_candidato bigint not null foreign key references bc_cliente(id),
id_pergunta bigint not null foreign key references bc_proj_pergunta(id),
resposta varchar(10) null,
usuario_criacao int not null foreign key references bc_usuario(id),
dt_criacao datetime not null
)
go