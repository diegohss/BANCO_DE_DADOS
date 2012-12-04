use havik
go

create table br_equipe
(
id bigint identity(1,1) not null primary key,
id_lider int not null,
id_colaborador int not null,
funcao varchar(150) null,
id_funcao int null,
cargo varchar(150) null,
id_cargo int null,
home varchar(150) null,
id_home int null,
dt_alteracao datetime not null,
usuario_alteracao int not null
)
