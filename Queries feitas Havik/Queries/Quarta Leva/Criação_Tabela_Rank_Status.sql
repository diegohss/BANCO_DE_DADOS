use havik

go

create table br_cli_rank_status
(
id int identity(1,1) not null,
id_status bigint null foreign key references br_cli_status(id),
id_substatus bigint null foreign key references br_cli_substatus(id),
rank int not null,
usuario_criacao int not null,
dt_criacao datetime not null
)