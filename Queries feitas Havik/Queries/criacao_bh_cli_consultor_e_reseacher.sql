use havik

create table bh_cli_researcher_obs
(
id bigint not null identity (1,1) primary key,
id_cliente bigint not null foreign key references bc_cliente(id),
obs varchar(4000) null,
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go

use havik

create table bh_cli_consultor_obs
(
id bigint not null identity (1,1) primary key,
id_cliente bigint not null foreign key references bc_cliente(id),
obs varchar(4000) null,
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go

