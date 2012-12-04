create table bl_area_subdivisao
(
id bigint identity(1,1) not null primary key,
id_subdivisao bigint not null foreign key references br_subdivisao(id),
id_area bigint not null foreign key references br_area(id),
usuario_criacao smallint not null,
dt_criacao datetime
);