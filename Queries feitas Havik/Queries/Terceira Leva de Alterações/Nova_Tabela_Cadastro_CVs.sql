create table bc_cli_base_cvs
(
id bigint not null identity(1,1) primary key,
id_cliente bigint not null foreign key references bc_cliente(id),
nome_arquivo varchar(50) null,
tipo_arquivo varchar(50) null,
idioma tinyint null,
caminho varchar(100) null,
cv nvarchar(max) null,
dados varbinary(max) null,
dt_criacao datetime not null,
usuario_criacao int not null foreign key references bc_usuario(id)
)