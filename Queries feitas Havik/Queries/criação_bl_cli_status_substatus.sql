create table bl_cli_status_substatus
(
id bigint identity(1,1) not null primary key,
id_status bigint not null foreign key references br_cli_status(id),
id_substatus bigint not null foreign key references br_cli_substatus(id),
usuario_criacao smallint not null,
dt_criacao datetime
);