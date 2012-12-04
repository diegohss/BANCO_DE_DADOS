CREATE TABLE bc_projeto
(
	id bigint IDENTITY(1,1) primary key NOT NULL,
	nome varchar(200) NOT NULL,
	id_empresa bigint NOT NULL foreign key references bc_empresa_unq(id),
	segmento bigint NOT NULL foreign key references br_segmento(id),
	area bigint NOT NULL foreign key references br_area(id),
	subdivisao bigint NOT NULL foreign key references br_subdivisao(id),
	cargo bigint NOT NULL foreign key references br_cargo(id),
	tipo_produto bigint NOT NULL foreign key references br_tp_produto(id),
	responsavel_captacao int NOT NULL foreign key references bc_usuario(id),
	responsavel_entrega int NOT NULL foreign key references bc_usuario(id),
	colaborador_responsavel int NOT NULL foreign key references bc_usuario(id),
	dt_criacao datetime not null,
	usuario_criacao int NOT NULL	
)
go