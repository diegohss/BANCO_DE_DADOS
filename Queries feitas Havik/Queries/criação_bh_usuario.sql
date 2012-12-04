create table bh_usuario
(
	id bigint IDENTITY(1,1) primary key NOT NULL,
	id_usuario int foreign key references bc_usuario(id),	
	sessao bigint null,
	status varchar(15) not null,
	dt_log datetime not null,
	usuario_alteracao smallint not null	
)

