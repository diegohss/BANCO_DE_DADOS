create table bh_proj_obs
(
	id bigint IDENTITY(1,1) primary key NOT NULL,
	id_projeto bigint NOT NULL foreign key references bc_projeto(id),	
	obs varchar(4000) null,
	dt_alteracao datetime not null,
	usuario_alteracao smallint not null	
)