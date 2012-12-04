use havik

create table bh_emp_mercado
(
id bigint identity(1,1) not null primary key,
id_empresa bigint not null foreign key references bc_empresa_unq(id),
funcionarios bigint not null foreign key references br_funcionarios(id),
faturamento bigint not null foreign key references br_emp_faturamento(id),
origem smallint null foreign key references br_paises(id),
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go

create table bh_emp_concorrentes
(
id bigint identity(1,1) not null primary key,
id_empresa bigint not null foreign key references bc_empresa_unq(id),
id_concorrente bigint not null foreign key references bc_empresa_unq(id),
dt_alteracao datetime not null,
usuario_alteracao smallint not null 
)

go

create table bh_emp_noticias
(
id bigint identity(1,1) not null primary key,
id_empresa bigint not null foreign key references bc_empresa_unq(id),
news varchar(4000) not null,
dt_alteracao datetime not null,
usuario_alteracao smallint not null
)

go