use havik

create table bh_proj_ult_status
(
id bigint identity(1,1) not null primary key,
id_projeto bigint not null foreign key references bc_projeto(id),
status varchar(100) null,
substatus varchar(100) null,
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go

