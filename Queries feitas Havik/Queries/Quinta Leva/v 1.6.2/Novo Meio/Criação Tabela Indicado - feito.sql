use havik
go
create table bh_cli_indicado
(
id bigint identity(1,1) not null,
id_cliente bigint not null foreign key references bc_cliente(id),
id_indicado int not null foreign key references bc_usuario(id),
id_projeto bigint not null foreign key references bc_projeto(id),
dt_alteracao datetime not null, 
usuario_alteracao int not null
)