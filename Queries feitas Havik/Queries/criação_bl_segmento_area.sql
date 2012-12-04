create table bl_segmento_area
(
id bigint identity(1,1) not null primary key,
id_area bigint not null foreign key references br_area(id),
id_segmento bigint not null foreign key references br_segmento(id),
usuario_criacao smallint not null,
dt_criacao datetime
);