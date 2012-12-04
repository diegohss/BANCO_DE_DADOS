use havik

go

create table br_mapeamento_rel
(
id bigint identity(1,1) primary key,
campo varchar(100) not null,
modulo varchar(50) not null,
tabela varchar(50) null,
campo_tabela varchar(50) null,
tabela_bi varchar(50) null,
campo_tabela_bi varchar(50) null,
usuario_criacao int not null,
dt_criacao datetime not null
)

go

create table bh_proj_mapeamento
(
id bigint identity(1,1) primary key,
id_projeto bigint foreign key references bc_projeto(id),
id_mapeamento bigint foreign key references br_mapeamento_rel(id),
exibir tinyint not null,
usuario_alteracao int not null,
dt_alteracao datetime not null,
usuario_criacao int not null,
dt_criacao datetime not null
)

