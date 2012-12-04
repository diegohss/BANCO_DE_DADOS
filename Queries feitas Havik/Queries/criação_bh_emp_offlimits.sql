use havik

create table bh_emp_offlimits
(
id bigint identity(1,1) not null primary key,
id_empresa bigint not null foreign key references bc_empresa_unq(id),
offlimits bigint not null foreign key references br_emp_offlimits(id),
id_area bigint not null foreign key references br_area(id),
usuario_criacao smallint not null,
dt_criacao datetime
)

go

