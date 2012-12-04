use havik
go
create table bh_cli_codifica 
(
id bigint identity(1,1) not null,
id_cliente bigint not null foreign key references bc_cliente(id),
id_area bigint null,
id_subdivisao bigint null,
id_segmento bigint null,
exibir int not null,
usuario_alteracao int not null,
dt_alteracao datetime not null
)