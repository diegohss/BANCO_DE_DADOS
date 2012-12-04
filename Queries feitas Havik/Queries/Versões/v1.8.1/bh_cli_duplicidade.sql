use havik_teste
go
create table bh_cli_duplicidade
(
id bigint identity(1,1) not null,
id_cliente bigint not null foreign key references bc_cliente(id),
verificado tinyint not null,
dt_criacao datetime not null,
usuario_criacao int not null
)
