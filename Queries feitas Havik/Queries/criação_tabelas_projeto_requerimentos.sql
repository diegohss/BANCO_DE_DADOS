-- Tabelas Modulo Projeto - Requisitos

use havik

CREATE TABLE bc_proj_requisitos
(
	id bigint IDENTITY(1,1) NOT NULL,
	id_projeto bigint not null foreign key references bc_projeto(id),
	tp_contrato bigint null foreign key references br_tp_contratacao(id),
	tamanho_equipe int null,
	experiencia int null,
	escolaridade bigint NULL foreign key references br_escolaridade(id),
	superior_imediato bigint NULL foreign key references br_cargo(id),
	salario_mensal money null,
	bonus money null,
	total_cash money null,
	dt_criacao datetime not null,
	usuario_criacao int not null	
)
go

CREATE TABLE bh_proj_idioma
(
	id bigint IDENTITY(1,1) NOT NULL,
	id_projeto bigint NOT NULL foreign key references bc_projeto(id),
	idioma bigint NULL foreign key references br_idiomas(id),
	nvl_idioma bigint NULL foreign key references br_nv_idiomas(id),
	dt_criacao datetime not null,
	usuario_criacao int not null	
)
go

CREATE TABLE bh_proj_graduacao
(
	id bigint IDENTITY(1,1) NOT NULL,
	id_projeto bigint NOT NULL foreign key references bc_projeto(id),
	graduacao bigint NULL foreign key references br_graduacao(id),
	nvl_graduacao bigint NULL foreign key references br_nv_graduacao(id),
	dt_criacao datetime not null,
	usuario_criacao int not null	
)
go

CREATE TABLE bh_proj_beneficios
(
	id bigint IDENTITY(1,1) NOT NULL,
	id_projeto bigint NOT NULL foreign key references bc_projeto(id),
	beneficios bigint NULL foreign key references br_proj_beneficios(id),
	dt_criacao datetime not null,
	usuario_criacao int not null	
)
go