create table bh_proj_site
(
	id bigint IDENTITY(1,1) primary key NOT NULL,
	id_projeto bigint NOT NULL foreign key references bc_projeto(id),	
	descricao_completa varchar(4000) null,
	resumo_descricao varchar(2000) null,	
	mostrar_site bit not null,
	dt_alteracao datetime not null,
	usuario_alteracao smallint not null	
)