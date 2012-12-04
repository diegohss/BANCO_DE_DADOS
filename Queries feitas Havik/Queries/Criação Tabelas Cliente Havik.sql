create table bh_cli_projeto
(
	id bigint IDENTITY(1,1) NOT NULL primary key,
	id_cliente bigint NOT NULL foreign key references bc_cliente(id),
	id_projeto bigint NOT NULL foreign key references bc_projeto(id),
	dt_criacao datetime NOT NULL,
	usuario_criacao int NOT NULL
)

go

--drop table bh_cli_status
create table bh_cli_status
(
	id bigint IDENTITY(1,1) NOT NULL primary key,
	id_cliente bigint NOT NULL foreign key references bc_cliente(id),
	id_projeto bigint NULL foreign key references bc_projeto(id),
	id_status bigint NOT NULL foreign key references br_cli_status(id),
	id_substatus bigint NOT NULL foreign key references br_cli_substatus(id),
	obs varchar(4000) null,
	dt_agendada datetime null,  
	dt_criacao datetime NOT NULL,
	usuario_criacao int NOT NULL
)

go

