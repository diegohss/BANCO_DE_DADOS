use havik
go
create table bh_proj_site
(
id bigint identity(1,1) not null,
id_projeto bigint not null,
mostrar_site bit not null,
dt_alteracao datetime not null,
usuario_alteracao smallint not null
)