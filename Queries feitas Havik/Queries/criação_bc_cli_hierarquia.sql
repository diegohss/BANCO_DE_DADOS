--drop table bc_cli_hierarquia
create table bc_cli_hierarquia
(
id bigint not null identity(1,1) primary key,
id_cliente bigint NOT NULL foreign key references bc_cliente(id),
reportase int null,
reportados int null,
qtd_subordinados int null,
qtd_subordinados_diretos int null,
usuario_alteracao int not null,
dt_alteracao datetime not null
)