-- Tabelas de E-mail e Telefone

create table bh_cli_tels
(
id bigint identity(1,1) not null primary key,
id_empresa bigint foreign key references bc_cliente(id),
cod_pais smallint null,
ddd smallint null,
telefone smallint not null,
tipo_tel bigint null,
usuario_criacao smallint not null,
dt_criacao datetime
)

go

create table bh_cli_emails
(
id bigint identity(1,1) not null primary key,
id_cliente bigint foreign key references bc_cliente(id),
email varchar(200) not null,
usuario_criacao smallint not null,
dt_criacao datetime
)

go




