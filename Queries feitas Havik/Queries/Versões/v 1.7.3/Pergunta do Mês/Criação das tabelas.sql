use havik
go
create table br_cli_perguntas
(
id bigint not null identity(1,1) primary key,
descricao varchar(400) not null,
dt_criacao datetime not null,
usuario_criacao int not null
)


go

create table br_cli_respostas
(
id bigint not null identity(1,1) primary key,
descricao varchar(400) not null,
dt_criacao datetime not null,
usuario_criacao int not null
)

go

create table bl_cli_perguntas_respostas
(
id bigint not null identity(1,1) primary key,
id_area bigint null foreign key references br_area(id),
id_segmento bigint null foreign key references br_segmento(id),
id_pergunta bigint null foreign key references br_cli_perguntas(id),
id_resposta bigint null foreign key references br_cli_respostas(id),
dt_ini datetime not null,
dt_fim datetime not null,
dt_criacao datetime not null,
usuario_criacao int not null
)

go

create table bh_cli_perguntas_respostas
(
id bigint not null identity(1,1) primary key,
id_pergunta bigint null foreign key references br_cli_perguntas(id),
id_resposta bigint null foreign key references br_cli_respostas(id),
id_cliente bigint not null foreign key references bc_cliente(id),
dt_alteracao datetime not null,
usuario_alteracao int not null
)