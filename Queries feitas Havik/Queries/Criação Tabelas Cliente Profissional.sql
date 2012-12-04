use havik

go

create table bc_cli_profissional
(
id bigint identity(1,1) not null primary key,
id_cliente bigint not null foreign key references bc_cliente(id),
id_empresa bigint null foreign key references bc_empresa_unq(id),
dt_inicio datetime null,
dt_saida datetime null,
id_segmento bigint null foreign key references br_segmento(id),
id_area bigint null foreign key references br_area(id),
id_subdivisao bigint null foreign key references br_segmento(id),
id_cargo bigint null foreign key references br_segmento(id),
salario money null, 
bonus money null,
total_cash money null,
realizacoes varchar(4000) null,
dt_alteracao datetime not null,
usuario_alteracao int not null
)

go

create table bh_cli_beneficios
(
id bigint identity(1,1) not null primary key,
id_cliente bigint not null foreign key references bc_cliente(id),
id_beneficios bigint null foreign key references br_segmento(id),
dt_alteracao datetime not null,
usuario_alteracao int not null

)

go