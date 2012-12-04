create table bl_emp_status_substatus
(
id bigint identity(1,1) not null primary key,
id_status bigint not null foreign key references br_emp_status(id),
id_substatus bigint not null foreign key references br_emp_substatus(id),
usuario_criacao smallint not null,
dt_criacao datetime
);

go

create table bl_proj_status_substatus
(
id bigint identity(1,1) not null primary key,
id_status bigint not null foreign key references br_proj_status(id),
id_substatus bigint not null foreign key references br_proj_substatus(id),
usuario_criacao smallint not null,
dt_criacao datetime
);

go