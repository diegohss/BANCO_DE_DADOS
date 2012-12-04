use havik 

go

create table bh_cli_academico
(
	id bigint identity(1,1) not null primary key,
	id_cliente bigint not null foreign key references bc_cliente(id),
	id_escolaridade bigint null foreign key references br_escolaridade(id),
	instituicao varchar(400) null,
	id_graduacao bigint null foreign key references br_graduacao(id),
	id_ano_formacao bigint null foreign key references br_cli_ano_formacao(id),
	dt_inicio datetime not null,
	usuario_criacao int NOT NULL
)

go

CREATE TABLE bh_cli_idiomas
(
	id bigint IDENTITY(1,1) NOT NULL primary key,
	id_cliente bigint NOT NULL foreign key references bc_cliente(id),
	id_idioma bigint NULL foreign key references br_idiomas(id),
	id_nvl_idioma bigint NULL foreign key references br_nv_idiomas(id),
	dt_criacao datetime NOT NULL,
	usuario_criacao int NOT NULL
)

go

CREATE TABLE bh_cli_cursos
(
	id bigint IDENTITY(1,1) NOT NULL primary key,
	id_cliente bigint NOT NULL foreign key references bc_cliente(id),
	curso varchar(40) not null,
	dt_criacao datetime NOT NULL,
	usuario_criacao int NOT NULL
)

go