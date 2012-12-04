use havik_teste
go
create table bh_proj_faturar
(
id bigint identity(1,1) not null primary key,
id_acao bigint not null,
faturar int not null,
usuario_alteracao int not null,
dt_alteracao datetime not null
)
