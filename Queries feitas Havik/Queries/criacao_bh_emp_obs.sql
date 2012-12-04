use havik

create table bh_emp_obs
(
id bigint not null identity (1,1) primary key,
id_empresa bigint not null foreign key references bc_empresa_unq(id),
obs varchar(4000) null,
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go

