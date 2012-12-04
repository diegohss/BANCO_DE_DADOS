create table br_tipo_contato
(
id bigint identity(1,1) primary key not null,
descricao varchar(50) null,
dt_criacao datetime not null,
usuario_criacao int not null
)
