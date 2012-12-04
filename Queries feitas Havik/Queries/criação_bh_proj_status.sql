use havik

create table bh_proj_status
(
id bigint identity(1,1) not null primary key,
id_projeto bigint not null foreign key references bc_projeto(id),
id_status bigint not null foreign key references br_proj_status (id),
id_substatus bigint not null foreign key references br_proj_substatus (id),
obs varchar(4000) null,
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go

